--[[
	コースリザルト画面
	blog: https://www.kasacontent.com/tag/modernchic/
]]
-- モジュール読み込み
main_state = require("main_state")
timer_util = require("timer_util")

-- requireはディレクトリ区切りを.で表す
local skinProperty = require("lua.require.course.skinproperty")
local property = require("lua.require.course.courseproperty")
local filepath = require("lua.require.course.filepath")
local offset = require("lua.require.course.offset")

local header = {
	type = 15,			-- 0:7k, 1:5k, 2:12k, 3:10k, 4:9k, 5:select, 6:decide, 7:result, 15:courceresult, 16:24k, 17:24kDouble
	name = skinProperty.version,
	w = skinProperty.width,
	h = skinProperty.height,
	loadend = skinProperty.loadend,
	playstart = skinProperty.playstart,
	scene = skinProperty.scene,
	input = skinProperty.input,
	close = skinProperty.close,
	fadeout = skinProperty.fadeout,
	property = property,
	filepath = filepath,
	offset = offset
}

local function add_all(list, t)
	if t then
		for i, v in ipairs(t) do
			table.insert(list, v) 
		end
	end
end

local function isIrmenuOff()
	return skin_config.option["IRメニュー表示"] == 900
end
local function isIrmenuOn()
	return skin_config.option["IRメニュー表示"] == 901
end
function isMainmenuLeft()
	return skin_config.option["グラフ&スコア表示位置"] == 905
end
function isMainmenuRight()
	return skin_config.option["グラフ&スコア表示位置"] == 906
end
local function isStartAnimationOff()
	return skin_config.option["開始時アニメーション"] == 910
end
local function isStartAnimationOn()
	return skin_config.option["開始時アニメーション"] == 911
end
local function isBackgroundClearFailed()
	return skin_config.option["背景表示パターン"] == 915
end
local function isBackgroundAll()
	return skin_config.option["背景表示パターン"] == 916
end
local function isIlluminationOff()
	return skin_config.option["修飾"] == 925
end
local function isIlluminationOn()
	return skin_config.option["修飾"] == 926
end

local function main()

	-- カスタムタイマー
	local CUSTOMTIMER_ID = 9999
	-- タイマー値をインクリメント
	function get_customTimer_id()
		CUSTOMTIMER_ID = CUSTOMTIMER_ID + 1
		return CUSTOMTIMER_ID
	end

	-- ヘッダ情報のコピー
	local skin = {}
	for k, v in pairs(header) do
		skin[k] = v
	end

	-- 基準点
	local mainPosX
	local subPosX
	local centerPosX = 700
	if isMainmenuLeft() then
		mainPosX = 35
		subPosX = 1220
	elseif isMainmenuRight() then
		mainPosX = 1220
		subPosX = 35
	end

	skin.source =  {
		{id = 2, path = "parts/system.png"},
		{id = 3, path = "parts/prepare.png"},
		{id = 4, path = "parts/number.png"},
		{id = 5, path = "parts/lamp.png"},
		{id = 6, path = "parts/parts.png"},
		{id = 7, path = "parts/rank/*.png"},
		{id = 8, path = "parts/bg/course/clear/*.png"},
		{id = 9, path = "parts/bg/course/failed/*.png"},
		{id = 10, path = "parts/bg/course/all/*.png"},
		{id = 11, path = "parts/irmask/*.png"},
	}

	do
		local mainShadowOffset = 4
		local subShadowOffset = 2
		local bottom = main_state.text(12)

		skin.font =  {}
		-- フォント読み込み
		table.insert(skin.font,{
			id = 0, path = "font/ttf/GenShinGothic-Heavy.ttf"
		})
		table.insert(skin.font,{
			id = 1, path = "font/ttf/GenShinGothic-Medium.ttf"
		})
		skin.text = {
			{id = "bottomInfo", font = 0, size = 30, constantText = bottom, overflow = 1, align = 1, shadowOffsetX = subShadowOffset, shadowOffsetY = subShadowOffset},
		}
	end

	skin.image = {
		-- 背景
		{id = "bgClear", src = 8, x = 0, y = 0, w = 1920, h = 1080},
		{id = "bgFailed", src = 9, x = 0, y = 0, w = 1920, h = 1080},
		{id = "bgAll", src = 10, x = 0, y = 0, w = 1920, h = 1080},
		-- 修飾
		{id = "beam", src = 2, x = 0, y = 1778, w = 960, h = 30},
		-- フェードアウト時の文字
		{id = "finishClear", src = 2, x = 0, y = 1808, w = 1200, h = 50},
		{id = "finishFailed", src = 2, x = 0, y = 1858, w = 1200, h = 50},
	}

	skin.imageset = {}

	skin.value = {}
	skin.slider = {}
	skin.graph = {}
	skin.gauge = {
		id = 2001,
		nodes = {
			-- 並び順はoverclear(明),underclear(明),overclear(暗),underclear(暗),先端の色(明),先端の色(暗)
			-- アシストイージーゲージ
			"gauge-r1","gauge-p1","gauge-r2","gauge-p2","gauge-r3","gauge-p3",
			-- イージーゲージ
			"gauge-r1","gauge-g1","gauge-r2","gauge-g2","gauge-r3","gauge-g3",
			-- ノーマルゲージ
			"gauge-r1","gauge-b1","gauge-r2","gauge-b2","gauge-r3","gauge-b3",
			-- ハードゲージ(2,4,6番目はダミー？)
			"gauge-r1","gauge-p1","gauge-r2","gauge-p2","gauge-r3","gauge-p3",
			-- EXハードゲージ(2,4,6番目はダミー？)
			"gauge-y1","gauge-p1","gauge-y2","gauge-p2","gauge-y3","gauge-p3",
			-- ハザードゲージ(2,4,6番目はダミー？)
			"gauge-h1","gauge-p1","gauge-h2","gauge-p2","gauge-h3","gauge-p3"
		}
	}
	skin.gaugegraph = {}
	skin.judgegraph = {}
	skin.bpmgraph = {
		{id = "bpmgraph"}
	}
	skin.timingvisualizer = {
		{id = "timing"}
	}

	skin.customTimers = {}
	skin.customEvents = {}

	skin.destination = {}

	-- 背景表示
	if isBackgroundClearFailed() then
		table.insert(skin.destination, {
			id = "bgClear", op = {90}, dst = {
				{x = 0, y = 0, w = 1920, h = 1080},
			}
		})
		table.insert(skin.destination, {
			id = "bgFailed", op = {91}, dst = {
				{x = 0, y = 0, w = 1920, h = 1080},
			}
		})
	elseif isBackgroundAll() then
		table.insert(skin.destination, {
			id = "bgAll", dst = {
				{x = 0, y = 0, w = 1920, h = 1080},
			}
		})
	end

	-- 背景用明るさ調整
	table.insert(skin.destination, {
		id = -110, offsets = {40}, dst = {
			{x = 0, y = 0, w = 1920, h = 1080, a = 0},
		}
	})

	-- ビーム修飾
	if isIlluminationOn() then
		table.insert(skin.destination, {
			id = "beam", blend = 2, dst = {
				{time = 0, x = 0, y = 0, w = 1920, h = 30, a = 150},
				{time = 5000, y = 1080 / 2, a = 0}
			}
		})
	end

	-- 画面下にタイトル、アーティスト、ジャンル、難易度表名
	table.insert(skin.destination, {
		id = -110, dst = {
			{x = 0, y = 0, w = 1920, h = 50},
		}
	})
	table.insert(skin.destination, {
		id = "bottomInfo", dst = {
			{x = 1920 / 2, y = 10, w = 1920, h = 25},
		}
	})


	-- 通常メニュー
	do
		local path = skin_config.get_path("lua/mainmenu.lua")
		local status, parts = pcall(function()
			return dofile(path).load(mainPosX, 1)
		end)
		if status and parts then
			add_all(skin.image, parts.image)
			add_all(skin.value, parts.value)
			add_all(skin.gaugegraph, parts.gaugegraph)
			add_all(skin.judgegraph, parts.judgegraph)
			add_all(skin.destination, parts.destination)
		end
	end

	-- IRメニュー
	-- op51 : オンライン時
	-- op84 : リプレイ中
	if isIrmenuOn() and main_state.option(51) then
		local path = skin_config.get_path("lua/irmenu.lua")
		local status, parts = pcall(function()
			return dofile(path).load(subPosX)
		end)
		if status and parts then
			add_all(skin.image, parts.image)
			add_all(skin.imageset, parts.imageset)
			add_all(skin.customTimers, parts.customTimers)
			add_all(skin.text, parts.text)
			add_all(skin.value, parts.value)
			add_all(skin.destination, parts.destination)
		end
	end

	-- 中央部情報
	do
		local path = skin_config.get_path("lua/centerinfo.lua")
		local status, parts = pcall(function()
			return dofile(path).load(centerPosX)
		end)
		if status and parts then
			add_all(skin.image, parts.image)
			add_all(skin.text, parts.text)
			add_all(skin.value, parts.value)
			add_all(skin.destination, parts.destination)
		end
	end

	-- 事前準備
	-- main_state.option(293)は使えないっぽい
	if isStartAnimationOn() then
		local path = skin_config.get_path("lua/prepare.lua")
		local status, parts = pcall(function()
			return dofile(path).load()
		end)
		if status and parts then
			add_all(skin.image, parts.image)
			add_all(skin.destination, parts.destination)
		end
	end

	-- フェードアウト処理
	-- ボタンが押されたら発動
	table.insert(skin.destination, {
		id = -110, timer = 2, loop = 1000, dst = {
			{time = 0, x = 0, y = 540, w = 1920, h = 0},
			{time = 500, y = 0, h = 1080},
			{time = 1000}
		}
	})
	table.insert(skin.destination, {
		id = "finishClear", timer = 2, op = {90}, loop = -1, dst = {
			{time = 300, x =  375, y = 513, w = 1200, h = 50, a = 0},
			{time = 600, a = 255},
			{time = 1000}
		}
	})
	table.insert(skin.destination, {
		id = "finishFailed", timer = 2, op = {91}, loop = -1, dst = {
			{time = 300, x =  375, y = 513, w = 1200, h = 50, a = 0},
			{time = 600, a = 255},
			{time = 1000}
		}
	})

	return skin
end

return{
	header = header,
	main = main
}