--[[
	7鍵用メインLua
	blog: https://www.kasacontent.com/tag/modernchic/
]]
-- モジュール読み込み
main_state = require("main_state")
-- requireはディレクトリ区切りを.で表す
local skinProperty = require("lua.require.skinproperty")
local property = require("lua.require.sp_property")
local filepath = require("lua.require.sp_filepath")
local offset = require("lua.require.sp_offset")

function is_left_scratch()
	return skin_config.option["プレイサイド"] == 900
end
function is_right_scratch()
	return skin_config.option["プレイサイド"] == 901
end
function is_left_position()
	return skin_config.option["プレイ位置"] == 903
end
function is_right_position()
	return skin_config.option["プレイ位置"] == 904
end
function isHanyoTypeMovie()
	return skin_config.option["汎用BGAの種類"] == 990
end
function isHanyoTypeImage()
	return skin_config.option["汎用BGAの種類"] == 991
end
function isHanyoDisable()
	return skin_config.option["汎用BGAの種類"] == 992
end

local header = {
	type = 0,			-- 0:7k, 1:5k, 2:12k, 3:10k, 4:9k, 5:select, 6:decide, 7:result, 15:courceresult, 16:24k, 17:24kDouble
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

local function main()
	-- ヘッダ情報のコピー
	local skin = {}
	for k, v in pairs(header) do
		skin[k] = v
	end
	
	-- プレイ側レーン基準
	local playsidePositionX
	-- プログレスバー基準
	local progressbarPositionX
	-- サブ画面（タイトル、BGA,スコアなど）基準
	local infoPositionX
	-- ゲージ基準（ゲージ、レベル、判定カウント）
	local gaugePositionX
	
	-- 基準点の設定
	if is_left_position() then
		playsidePositionX = 51
		infoPositionX = 570
		progressbarPositionX = 23
		gaugePositionX = 16
	elseif is_right_position() then
		playsidePositionX = 1350
		infoPositionX = 0
		gaugePositionX = 1350
		progressbarPositionX = 1881
	end
	
	local keyPosition = {}
	local keyflashPosX = {}
	local scratchflashPosX
	if is_left_scratch() then
		keyPosition = {114, 177, 228, 291, 342, 405, 456, 3}
		keyflashPosX = {110, 167, 224, 281, 338, 395, 452}
		scratchflashPosX = 5
	elseif is_right_scratch() then
		keyPosition = {3, 66, 117, 180, 231, 294, 345, 408}
		keyflashPosX = {-1, 56, 113, 170, 227, 284, 341}
		scratchflashPosX = 410
	end
	
	-- 判定基準点
	local notesPositionY = 227
	
	local info_outline_color = "53710cff"
	
	skin.source =  {
		{id = 1, path = "parts/sp_hw/system.png"},
		{id = 2, path = "parts/sp_hw/info.png"},
		{id = 3, path = "parts/common/bg/*.png"},
		{id = 4, path = "parts/common/judge/*.png"},
		{id = 5, path = "parts/common/judgeline/*.png"},
		{id = 6, path = "parts/common/notes/*.png"},
		{id = 9, path = "parts/common/glow/*.png"},
		{id = 10, path = "parts/common/progress/*.png"},
		{id = 11, path = "parts/common/bomb/*.png"},
		{id = 13, path = "parts/common/fullcombo/*.png"},
		{id = 14, path = "parts/common/keybeam/*.png"},
		{id = 15, path = "parts/common/key/*.png"},
		{id = 16, path = "parts/common/keyflash/*.png"},
		{id = 17, path = "parts/sp_hw/lanecover/*.png"},
		{id = 18, path = "parts/sp_hw/lift/*.png"},
		{id = 20, path = "parts/sp_hw/bga.png"},
		{id = 21, path = "parts/common/close/close.png"},
		{id = 22, path = "parts/sp_hw/score.png"},
		{id = 24, path = "parts/common/lamp/*.png"},
		{id = 25, path = "parts/sp_hw/graphbg/*.png"},
		{id = 26, path = "parts/common/mine/#default.png"},
		{id = 28, path = "parts/common/oadx_bomb/*.png"},
	}
	-- BGAが用意されていないときのみ読み込む
	if main_state.option(170) and isHanyoTypeMovie() then
		table.insert(skin.source,{
			id = 23, path = "parts/common/BGA/movie/*.mp4"
		})
	elseif main_state.option(170) and isHanyoTypeImage() then
		table.insert(skin.source,{
			id = 27, path = "parts/common/BGA/image/*.png"
		})
	end
	
	do	
		skin.font =  {}
		-- フォント読み込み
		table.insert(skin.font,{
			id = 0, path = "font/ttf/GenShinGothic-Heavy.ttf"
		})
		table.insert(skin.font,{
			id = 1, path = "font/ttf/GenShinGothic-Medium.ttf"
		})
		
		local mainNum = 0
		local subNum = 1
		local mainShadowOffset = 4
		local subShadowOffset = 2
		
		skin.text = {
			{id = "genre", font = subNum, size = 25, ref = 13, overflow = 1, align = 1, shadowOffsetX = subShadowOffset, shadowOffsetY = subShadowOffset},
			{id = "title", font = subNum, size = 25, ref = 12, overflow = 1, align = 1, shadowOffsetX = subShadowOffset, shadowOffsetY = subShadowOffset},
			{id = "artist", font = subNum, size = 25, ref = 14, overflow = 1, align = 1, shadowOffsetX = subShadowOffset, shadowOffsetY = subShadowOffset},
			{id = "pretitle", font = mainNum, size = 90, ref = 12, overflow = 1, align = 1, shadowOffsetX = mainShadowOffset, shadowOffsetY = mainShadowOffset},
			{id = "pregenre", font = subNum, size = 40, ref = 13, overflow = 1, align = 1},
			{id = "preartist", font = subNum, size = 40, ref = 14, overflow = 1, align = 1},
			-- contstantText:任意の文字を扱える
			{id = "from", font = subNum, size = 18, constantText = "～", align = 1, shadowOffsetX = subShadowOffset, shadowOffsetY = subShadowOffset, shadowColor = "00000000"},
			{id = "per", font = subNum, size = 18, constantText = "%", align = 1, shadowOffsetX = subShadowOffset, shadowOffsetY = subShadowOffset, shadowColor = "00000000"},
		}
	end
	do
		local whiteWidth = 60
		local whitePosX = 216
		
		local blueWidth = 48
		local bluePosX = 276
		
		local scWidth = 108
		local scPosX = 108
		local acPosX = 0
		
		local stdPosY = 0
		local lnePosY = 36
		local lnsPosY = 72
		local lnbPosY = 144
		local lnaPosY = 108
		local hcnePosY = 216
		local hcnsPosY = 252
		local hcnbPosY = 288
		local hcnrPosY = 324
		local hcnaPosY = 288
		local hcndPosY = 288
		
		local lnCycle = 200
		local hcnCycle = 200
		local hcnDamageCycle = 100
		
		skin.image = {
			{id = "info", src = 2, x = 0, y = 0, w = 1350, h = 1080},
			{id = "bg", src = 3, x = 0, y = 0, w = 1920, h = 1080},
			
			-- 通常ノート b:2,4,6 w:1,3,5,7 s:皿
			{id = "note-w", src = 6, x = whitePosX, y = stdPosY, w = whiteWidth, h = 36},
			{id = "note-b", src = 6, x = bluePosX, y = stdPosY, w = blueWidth, h = 36},
			{id = "note-s", src = 6, x = scPosX, y = stdPosY, w = scWidth, h = 36},
			{id = "note-a", src = 6, x = acPosX, y = stdPosY, w = scWidth, h = 36},
			-- ln終了（上部分）
			{id = "lne-w", src = 6, x = whitePosX, y = lnePosY, w = whiteWidth, h = 36},
			{id = "lne-b", src = 6, x = bluePosX, y = lnePosY, w = blueWidth, h = 36},
			{id = "lne-s", src = 6, x = scPosX, y = lnePosY, w = scWidth, h = 36},
			{id = "lne-a", src = 6, x = acPosX, y = lnePosY, w = scWidth, h = 36},
			-- ln開始（下部分）
			{id = "lns-w", src = 6, x = whitePosX, y = lnsPosY, w = whiteWidth, h = 36},
			{id = "lns-b", src = 6, x = bluePosX, y = lnsPosY, w = blueWidth, h = 36},
			{id = "lns-s", src = 6, x = scPosX, y = lnsPosY, w = scWidth, h = 36},
			{id = "lns-a", src = 6, x = acPosX, y = lnsPosY, w = scWidth, h = 36},
			-- ln途中（押している状態）
			{id = "lnb-w", src = 6, x = whitePosX, y = lnbPosY, w = whiteWidth, h = 72, divy = 2, cycle = lnCycle},
			{id = "lnb-b", src = 6, x = bluePosX, y = lnbPosY, w = blueWidth, h = 72, divy = 2, cycle = lnCycle},
			{id = "lnb-s", src = 6, x = scPosX, y = lnbPosY, w = scWidth, h = 72, divy = 2, cycle = lnCycle},
			{id = "lnb-a", src = 6, x = acPosX, y = lnbPosY, w = scWidth, h = 72, divy = 2, cycle = lnCycle},
			-- ln途中（離している状態）
			{id = "lna-w", src = 6, x = whitePosX, y = lnaPosY, w = whiteWidth, h = 36},
			{id = "lna-b", src = 6, x = bluePosX, y = lnaPosY, w = blueWidth, h = 36},
			{id = "lna-s", src = 6, x = scPosX, y = lnaPosY, w = scWidth, h = 36},
			{id = "lna-a", src = 6, x = acPosX, y = lnaPosY, w = scWidth, h = 36},
			-- hcn終了（上部分）
			{id = "hcne-w", src = 6, x = whitePosX, y = hcnePosY, w = whiteWidth, h = 36},
			{id = "hcne-b", src = 6, x = bluePosX, y = hcnePosY, w = blueWidth, h = 36},
			{id = "hcne-s", src = 6, x = scPosX, y = hcnePosY, w = scWidth, h = 36},
			{id = "hcne-a", src = 6, x = acPosX, y = hcnePosY, w = scWidth, h = 36},
			-- hcn 開始（上部分）
			{id = "hcns-w", src = 6, x = whitePosX, y = hcnsPosY, w = whiteWidth, h = 36},
			{id = "hcns-b", src = 6, x = bluePosX, y = hcnsPosY, w = blueWidth, h = 36},
			{id = "hcns-s", src = 6, x = scPosX, y = hcnsPosY, w = scWidth, h = 36},
			{id = "hcns-a", src = 6, x = acPosX, y = hcnsPosY, w = scWidth, h = 36},
			-- hcn 入力中
			{id = "hcnb-w", src = 6, x = whitePosX, y = hcnbPosY, w = whiteWidth, h = 36, divy = 2, cycle = hcnCycle},
			{id = "hcnb-b", src = 6, x = bluePosX, y = hcnbPosY, w = blueWidth, h = 36, divy = 2, cycle = hcnCycle},
			{id = "hcnb-s", src = 6, x = scPosX, y = hcnbPosY, w = scWidth, h = 36, divy = 2, cycle = hcnCycle},
			{id = "hcnb-a", src = 6, x = acPosX, y = hcnbPosY, w = scWidth, h = 36, divy = 2, cycle = hcnCycle},
			-- hcnダメージエフェクト
			{id = "hcnr-w", src = 6, x = whitePosX, y = hcnrPosY, w = whiteWidth, h = 36, divy = 2, cycle = hcnDamageCycle},
			{id = "hcnr-b", src = 6, x = bluePosX, y = hcnrPosY, w = blueWidth, h = 36, divy = 2, cycle = hcnDamageCycle},
			{id = "hcnr-s", src = 6, x = scPosX, y = hcnrPosY, w = scWidth, h = 36, divy = 2, cycle = hcnDamageCycle},
			{id = "hcnr-a", src = 6, x = acPosX, y = hcnrPosY, w = scWidth, h = 36, divy = 2, cycle = hcnDamageCycle},
			-- hcn 入力する前の状態
			{id = "hcna-w", src = 6, x = whitePosX, y = hcnaPosY, w = whiteWidth, h = 18},
			{id = "hcna-b", src = 6, x = bluePosX, y = hcnaPosY, w = blueWidth, h = 18},
			{id = "hcna-s", src = 6, x = scPosX, y = hcnaPosY, w = scWidth, h = 18},
			{id = "hcna-a", src = 6, x = acPosX, y = hcnaPosY, w = scWidth, h = 18},
			-- hcn 途中から押したとき
			{id = "hcnd-w", src = 6, x = whitePosX, y = hcndPosY, w = whiteWidth, h = 36, divy = 2, cycle = hcnCycle},
			{id = "hcnd-b", src = 6, x = bluePosX, y = hcndPosY, w = blueWidth, h = 36, divy = 2, cycle = hcnCycle},
			{id = "hcnd-s", src = 6, x = scPosX, y = hcndPosY, w = scWidth, h = 36, divy = 2, cycle = hcnCycle},
			{id = "hcnd-a", src = 6, x = acPosX, y = hcndPosY, w = scWidth, h = 36, divy = 2, cycle = hcnCycle},
			--地雷
			{id = "mine-w", src = 26, x = whitePosX, y = 0, w = whiteWidth, h = 36},
			{id = "mine-b", src = 26, x = bluePosX, y = 0, w = blueWidth, h = 36},
			{id = "mine-s", src = 26, x = scPosX, y = 0, w = scWidth, h = 36},
			-- 小節線
			{id = "section-line", src = 1, x = 1, y = 0, w = 1, h = 1},
		}
		
		-- 各鍵盤の情報 ※別ファイルに分割は出来ないっぽい？
		skin.note = {
			id = "notes",
			note = {"note-w", "note-b", "note-w", "note-b", "note-w", "note-b", "note-w", "note-s"},
			lnend = {"lne-w", "lne-b", "lne-w", "lne-b", "lne-w", "lne-b", "lne-w", "lne-s"},
			lnstart = {"lns-w", "lns-b", "lns-w", "lns-b", "lns-w", "lns-b", "lns-w", "lns-s"},
			lnbody = {"lnb-w", "lnb-b", "lnb-w", "lnb-b", "lnb-w", "lnb-b", "lnb-w", "lnb-s"},
			lnactive = {"lna-w", "lna-b", "lna-w", "lna-b", "lna-w", "lna-b", "lna-w", "lna-s"},
			
			hcnend = {"hcne-w", "hcne-b", "hcne-w", "hcne-b", "hcne-w", "hcne-b", "hcne-w", "hcne-s"},
			hcnstart = {"hcns-w", "hcns-b", "hcns-w", "hcns-b", "hcns-w",  "hcns-b", "hcns-w", "hcns-s"},
			hcnbody = {"hcnb-w", "hcnb-b", "hcnb-w", "hcnb-b", "hcnb-w", "hcnb-b", "hcnb-w", "hcnb-s"},
			hcnactive = {"hcna-w", "hcna-b", "hcna-w", "hcna-b", "hcna-w", "hcna-b", "hcna-w", "hcna-s"},
			hcndamage = {"hcnd-w", "hcnd-b", "hcnd-w", "hcnd-b", "hcnd-w", "hcnd-b", "hcnd-w", "hcnd-s"},
			hcnreactive = {"hcnr-w", "hcnr-b", "hcnr-w", "hcnr-b", "hcnr-w", "hcnr-b", "hcnr-w", "hcnr-s"},
			
			mine = {"mine-w", "mine-b", "mine-w", "mine-b", "mine-w", "mine-b", "mine-w","mine-s"},
			hidden = {},
			processed = {},
			size = {},	-- ノートの高さを調節（px数で指定）
			dst = {
				-- 1鍵
				{x = playsidePositionX + keyPosition[1], y = notesPositionY - 12, w = whiteWidth, h = 857},
				-- 2鍵
				{x = playsidePositionX + keyPosition[2], y = notesPositionY - 12, w = blueWidth, h = 857},
				-- 3鍵
				{x = playsidePositionX + keyPosition[3], y = notesPositionY - 12, w = whiteWidth, h = 857},
				-- 4鍵
				{x = playsidePositionX + keyPosition[4], y = notesPositionY - 12, w = blueWidth, h = 857},
				-- 5鍵
				{x = playsidePositionX + keyPosition[5], y = notesPositionY - 12, w = whiteWidth, h = 857},
				-- 6鍵
				{x = playsidePositionX + keyPosition[6], y = notesPositionY - 12, w = blueWidth, h = 857},
				-- 7鍵
				{x = playsidePositionX + keyPosition[7], y = notesPositionY - 12, w = whiteWidth, h = 857},
				-- 皿
				{x = playsidePositionX + keyPosition[8], y = notesPositionY - 12, w = scWidth, h = 857},
			},
			-- 小節線配置 offset3指定でliftの値を考慮した座標になる
			group = {
				{id = "section-line", offset = 3, dst = {
					{x = playsidePositionX + 3, y = notesPositionY, w = 513, h = 3}
				}}
			},
			time = {
				{id = "section-line", offset = 3, dst = {
					{x = playsidePositionX + 3, y = notesPositionY, w = 513, h = 15, r = 100, g = 100, b = 255}
				}}
			},
			bpm = {
				{id = "section-line", offset = 3, dst = {
					{x = playsidePositionX + 3, y = notesPositionY, w = 513, h = 15, r = 100, g = 255, b = 100}
				}}
			},
			stop = {
				{id = "section-line", offset = 3, dst = {
					{x = playsidePositionX + 3, y = notesPositionY, w = 513, h = 15, r = 255, g = 100, b = 100}
				}}
			}
		}
	end
	skin.value = {}
	skin.slider = {}
	skin.hiddenCover = {}
	skin.liftCover = {}
	skin.graph = {}
	
	skin.bga = {
		id = "bga"
	}
	skin.judgegraph = {
		-- backTexOff 0：背景黒 1:背景を透過
		{id = "judgegraph", type = 1, backTexOff = 1},
	}
	skin.bpmgraph = {
		{id = "bpmgraph"}
	}
	skin.timingvisualizer = {
		{id = "timing"}
	}
	skin.judge = {}
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
	
	skin.destination = {}
	
	-- 背景
	table.insert(skin.destination, {
		id = "bg", dst = {
			{x = 0, y = 0, w = 1920, h = 1080}
		}
	})
	-- 背景の明るさ調節
	table.insert(skin.destination, {
		id = -110, offset = 42, dst = {
			{x = 0, y = 0, w = 1920, h = 1080, a = 0},
		}
	})
	-- インフォ部分
	do
		local info_path = skin_config.get_path("lua/sp/info.lua")
		local info_status, info_parts = pcall(function()
			return dofile(info_path).load(infoPositionX)
		end)
		if info_status and info_parts then
			add_all(skin.image, info_parts.image)
			add_all(skin.value, info_parts.value)
			add_all(skin.destination, info_parts.destination)
		end
	end
	-- 進捗バー
	do
		local progress_path = skin_config.get_path("lua/sp/progress.lua")
		local progress_status, progress_parts = pcall(function()
			return dofile(progress_path).load(progressbarPositionX)
		end)
		if progress_status and progress_parts then
			add_all(skin.image, progress_parts.image)
			add_all(skin.slider, progress_parts.slider)
			add_all(skin.destination, progress_parts.destination)
		end
	end
	-- キーフラッシュ
	do
		local information = {
			timer = {101, 102, 103, 104, 105, 106, 107},
			keyflashPosX = keyflashPosX,
			scratchflashPosX = scratchflashPosX,
			num = 7,
		}
		local keyflash_path = skin_config.get_path("lua/sp/keyflash.lua")
		local keyflash_status, keyflash_parts = pcall(function()
			return dofile(keyflash_path).load(playsidePositionX, information)
		end)
		if keyflash_status and keyflash_parts then
			add_all(skin.image, keyflash_parts.image)
			add_all(skin.destination, keyflash_parts.destination)
		end
	end
	-- ゲージ
	do
		local gauge_path = skin_config.get_path("lua/sp/gauge.lua")
		local gauge_status, gauge_parts = pcall(function()
			return dofile(gauge_path).load(gaugePositionX)
		end)
		if gauge_status and gauge_parts then
			add_all(skin.image, gauge_parts.image)
			add_all(skin.value, gauge_parts.value)
			add_all(skin.destination, gauge_parts.destination)
		end
	end
	-- レーン部分
	do
		local lane_path = skin_config.get_path("lua/sp/lane.lua")
		local lane_status, lane_parts = pcall(function()
			return dofile(lane_path).load(playsidePositionX, notesPositionY)
		end)
		if lane_status and lane_parts then
			add_all(skin.image, lane_parts.image)
			add_all(skin.destination, lane_parts.destination)
		end
	end
	-- キー入力
	do
		local inputkey7_path = skin_config.get_path("lua/sp/inputkey7.lua")
		local inputkey7_status, inputkey7_parts = pcall(function()
			return dofile(inputkey7_path).load(playsidePositionX, notesPositionY)
		end)
		if inputkey7_status and inputkey7_parts then
			add_all(skin.image, inputkey7_parts.image)
			add_all(skin.destination, inputkey7_parts.destination)
		end
	end
	-- ノート配置(play7_hw.lua)
	table.insert(skin.destination,{id = "notes", offset = 30})
	-- カバー
	do
		local  cover_path = skin_config.get_path("lua/sp/cover.lua")
		local  cover_status, cover_parts = pcall(function()
			return dofile(cover_path).load(playsidePositionX, notesPositionY)
		end)
		if cover_status and cover_parts then
			add_all(skin.image, cover_parts.image)
			add_all(skin.value, cover_parts.value)
			add_all(skin.slider, cover_parts.slider)
			add_all(skin.hiddenCover, cover_parts.hiddenCover)
			add_all(skin.liftCover, cover_parts.liftCover)
			add_all(skin.destination, cover_parts.destination)
		end
	end
	-- ターゲット差分、SLOW/FAST
	do
		local  assist_path = skin_config.get_path("lua/sp/assist.lua")
		local  assist_status, assist_parts = pcall(function()
			return dofile(assist_path).load(playsidePositionX, notesPositionY)
		end)
		if assist_status and assist_parts then
			add_all(skin.image, assist_parts.image)
			add_all(skin.value, assist_parts.value)
			add_all(skin.destination, assist_parts.destination)
		end
	end
	-- 爆発
	do
		local bomb7_path = skin_config.get_path("lua/sp/bomb7.lua")
		local bomb7_status, bomb7_parts = pcall(function()
			return dofile(bomb7_path).load(playsidePositionX, notesPositionY)
		end)
		if bomb7_status and bomb7_parts then
			add_all(skin.image, bomb7_parts.image)
			add_all(skin.destination, bomb7_parts.destination)
		end
	end
	
	-- 判定カウント、レベル情報部分
	do
		local  info2_path = skin_config.get_path("lua/sp/info2.lua")
		local  info2_status, info2_parts = pcall(function()
			return dofile(info2_path).load(gaugePositionX)
		end)
		if info2_status and info2_parts then
			add_all(skin.image, info2_parts.image)
			add_all(skin.value, info2_parts.value)
			add_all(skin.destination, info2_parts.destination)
		end
	end
	-- 判定
	do
		local judge_path = skin_config.get_path("lua/sp/judge.lua")
		local judge_status, judge_parts = pcall(function()
			return dofile(judge_path).load(playsidePositionX, notesPositionY)
		end)
		if judge_status and judge_parts then
			add_all(skin.image, judge_parts.image)
			add_all(skin.value, judge_parts.value)
			add_all(skin.judge, judge_parts.judge)
			add_all(skin.destination, judge_parts.destination)
		end
	end
	-- フルコン演出
	do
		local fullcombo_path = skin_config.get_path("lua/sp/fullcombo.lua")
		local fullcombo_status, fullcombo_parts = pcall(function()
			return dofile(fullcombo_path).load(playsidePositionX, notesPositionY)
		end)
		if fullcombo_status and fullcombo_parts then
			add_all(skin.image, fullcombo_parts.image)
			add_all(skin.destination, fullcombo_parts.destination)
		end
	end
	-- グラフ
	do
		local graph_path = skin_config.get_path("lua/sp/graph.lua")
		local graph_status, graph_parts = pcall(function()
			return dofile(graph_path).load(infoPositionX)
		end)
		if graph_status and graph_parts then
			add_all(skin.image, graph_parts.image)
			add_all(skin.value, graph_parts.value)
			add_all(skin.graph, graph_parts.graph)
			add_all(skin.destination, graph_parts.destination)
		end
	end
	-- 準備
	do
		local prepare_path = skin_config.get_path("lua/sp/prepare.lua")
		local prepare_status, prepare_parts = pcall(function()
			return dofile(prepare_path).load(playsidePositionX, infoPositionX)
		end)
		if prepare_status and prepare_parts then
			add_all(skin.image, prepare_parts.image)
			add_all(skin.value, prepare_parts.value)
			add_all(skin.graph, prepare_parts.graph)
			add_all(skin.judgegraph, prepare_parts.judgegraph)
			add_all(skin.destination, prepare_parts.destination)
		end
	end
	-- 閉店処理
	do
		local close_path = skin_config.get_path("lua/close.lua")
		local close_status, close_parts = pcall(function()
			return dofile(close_path).load(21)
		end)
		if close_status and close_parts then
			add_all(skin.image, close_parts.image)
			add_all(skin.destination, close_parts.destination)
		end
	end
	-- 終了時にフェードアウト
	-- timer2 : フェードアウトタイマー fadeoutで定義
	table.insert(skin.destination, {
		id = -110, timer = 2, loop = 500, dst = {
			{time = 0, x = 0, y = 0, w = 1920, h = 1080, a = 0},
			{time = 500, a = 255}
		}
	})
	
	return skin
end

return{
	header = header,
	main = main
}