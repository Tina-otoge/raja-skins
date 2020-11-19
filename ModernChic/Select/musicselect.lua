-- モジュール読み込み
main_state = require("main_state")
timer_util = require("timer_util")

local function is_bg_image()
	return skin_config.option["背景の種類"] == 900
end
local function is_bg_movie()
	return skin_config.option["背景の種類"] == 901
end
function is_outlinefont()
	return  skin_config.option["画像フォントの使用"] == 910
end
function is_bitmapfont()
	return  skin_config.option["画像フォントの使用"] == 911
end

local skinProperty = require("lua.require.skinproperty")
local property = require("lua.require.property")
local filepath = require("lua.require.filepath")

local header = {
	type = skinProperty.type,
	name = skinProperty.version,
	w = skinProperty.width,
	h = skinProperty.height,
	fadeout = skinProperty.fadeout,
	scene = skinProperty.scene,
	input = skinProperty.input,
	property = property,
	filepath = filepath
}

-- テーブルに要素を追加する
local function add_all(list, t)
	if t then
		for i, v in ipairs(t) do
			table.insert(list, v) 
		end
	end
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
	
	-- 背景選択
	local bg_type
	if is_bg_image() then
		bg_type = 1
	elseif is_bg_movie() then
		bg_type = 2
	end
	-- バージョン名
	local version = skinProperty.ver
	
	skin.source = {
		{id = 1, path = "bg/image/*.png"},
		{id = 2, path = "bg/movie/*.mp4"},
		{id = 3, path = "parts/assistop.png"},
		{id = 4, path = "parts/subop.png"},
		{id = 5, path = "parts/mainframe.png"},
		{id = 6, path = "parts/op.png"},
		{id = 7, path = "parts/songbar.png"},
		{id = 8, path = "parts/scoreinfo.png"},
		{id = 9, path = "parts/qco.png"},
		{id = 10, path = "parts/help.png"},
		{id = 11, path = "parts/sidemenu.png"},
	}

	skin.image = {
		{id = "bg", src = bg_type, x = 0, y = 0, w = 1920, h = 1080},
		{id = "main-bg", src = 5, x = 1401, y = 1240, w = 50, h = 50},
		
		{id = "timing-frame", src = 5, x = 2410, y = 800, w = 195, h = 160},
		{id = "selectmusic-frame", src = 7, x = 0, y = 560, w = 990, h = 82},
		{id = "selectmusic-frame-top", src = 7, x = 0, y = 560, w = 17, h = 82},
		{id = "selectmusic-frame-bottom", src = 7, x = 17, y = 560, w = 973, h = 82},
	}
	skin.imageset = {}
	skin.graph = {
		{id = "graph-lamp", src = 7, x = 1010, y = 90, w = 11, h = 60, divx = 11, divy = 6, cycle = 100, type = -1},
	}
	skin.slider = {}
	skin.value = {
		-- IR総プレイヤー
		{id = "ir-totalplayer", src = 5, x = 2401, y = 510, w = 242, h = 15, divx = 11, digit = 5, ref = 180},
		-- IRランク
		{id = "ir-rank", src = 5, x = 2401, y = 510, w = 242, h = 15, divx = 11, digit = 5, ref = 179},
	}
	
	if is_outlinefont() then
		skin.font = {
			{id = 2, path = "font/ttf/GenShinGothic-Medium.ttf"},
			{id = 3, path = "font/ttf/GenShinGothic-Heavy.ttf"},
		}
		skin.text = {
			-- 画像フォント未使用
			{id = "title", font = 3, size = 70, ref = 10, overflow = 1, align = 2, shadowOffsetX = 3, shadowOffsetY = 3},
			{id = "artist", font = 3, size = 30, ref = 14, overflow = 1, align = 2, shadowOffsetX = 2, shadowOffsetY = 2},
			{id = "subtitle", font = 3, size = 170, ref = 11, overflow = 1},
			{id = "genre", font = 3, size = 30, ref = 13, overflow = 1, align = 2, shadowOffsetX = 2, shadowOffsetY = 2},
			{id = "bartext", font = 2, size = 35, shadowOffsetX = 1, shadowOffsetY = 1},
			{id = "search", font = 2, size = 30, ref = 30},
			{id = "yourname", font = 2, size = 35, ref = 2, overflow = 1, align = 2},
			{id = "rivalname", font = 2, size = 35, ref = 1, overflow = 1},
			{id = "directory", font = 2, size = 25, ref = 1000, overflow = 1, align = 2, shadowOffsetX = 1, shadowOffsetY = 1},
			{id = "course1", font = 2, size = 30, ref = 150, overflow = 1, align = 1, shadowOffsetX = 2, shadowOffsetY = 2},
			{id = "course2", font = 2, size = 30, ref = 151, overflow = 1, align = 1, shadowOffsetX = 2, shadowOffsetY = 2},
			{id = "course3", font = 2, size = 30, ref = 152, overflow = 1, align = 1, shadowOffsetX = 2, shadowOffsetY = 2},
			{id = "course4", font = 2, size = 30, ref = 153, overflow = 1, align = 1, shadowOffsetX = 2, shadowOffsetY = 2},
			{id = "course5", font = 2, size = 30, ref = 154, overflow = 1, align = 1, shadowOffsetX = 2, shadowOffsetY = 2},
			{id = "version", font = 2, size = 16, constantText = version, overflow = 1, shadowOffsetX = 2, shadowOffsetY = 2},
		}
	elseif  is_bitmapfont() then
		skin.font = {
			{id = 0, path = "font/fnt/gen.fnt"},
			{id = 1, path = "font/fnt/info.fnt", type = 1}
		}
		skin.text = {
			-- 画像フォント使用
			{id = "title", font = 1, size = 70, ref = 10, overflow = 1, outlineColor = "222222ff", outlineWidth = 0.5, align = 2},
			{id = "artist", font = 1, size = 30, ref = 14, overflow = 1, outlineColor = "555555ff", outlineWidth = 0.8, align = 2},
			{id = "subtitle", font = 1, size = 170, ref = 11, overflow = 1},
			{id = "genre", font = 1, size = 30, ref = 13, overflow = 1, outlineColor = "555555ff", outlineWidth = 0.8, align = 2},
			{id = "bartext", font = 0, size = 35},
			{id = "search", font = 1, size = 30, ref = 30},
			{id = "yourname", font = 1, size = 35, ref = 2, overflow = 1, align = 2},
			{id = "rivalname", font = 1, size = 35, ref = 1, overflow = 1},
			{id = "directory", font = 1, size = 25, ref = 1000, overflow = 1, align = 2, outlineColor = "555555ff", outlineWidth = 0.5},
			{id = "course1", font = 1, size = 30, ref = 150, overflow = 1, outlineColor = "222222ff", outlineWidth = 0.8, align = 1},
			{id = "course2", font = 1, size = 30, ref = 151, overflow = 1, outlineColor = "222222ff", outlineWidth = 0.8, align = 1},
			{id = "course3", font = 1, size = 30, ref = 152, overflow = 1, outlineColor = "222222ff", outlineWidth = 0.8, align = 1},
			{id = "course4", font = 1, size = 30, ref = 153, overflow = 1, outlineColor = "222222ff", outlineWidth = 0.8, align = 1},
			{id = "course5", font = 1, size = 30, ref = 154, overflow = 1, outlineColor = "222222ff", outlineWidth = 0.8, align = 1},
			{id = "version", font = 1, size = 16, constantText = version, overflow = 1, outlineColor = "222222ff", outlineWidth = 0.8},
		}
	end
	
	skin.songlist = {
		id = "songlist",
		center = 8,
		clickable = {6,7,8,9,10},
		liston = {},
		listoff = {},
		level = {},
		label = {},
		text = {},	
		lamp = {},
		playerlamp = {},
		rivallamp = {},
		trophy = {},
		graph = {
			id = "graph-lamp", dst = {
				{x = 40, y = 5, w = 650, h = 10}
			},
		},
	}
	
	skin.customTimers = {}
	skin.judgegraph = {}
	skin.bpmgraph = {}
	skin.destination = {}
	
	-- 背景
	table.insert(skin.destination, {
		id = "bg", dst = {
			{x = 0, y = 0, w = 1920, h = 1080}
		}
	})
	--ステージファイル
	table.insert(skin.destination, {
		id = "-100", loop = 300, op = {915}, timer = 11, dst = {
			{time = 0, x = 120, y = 406, w = 480, h = 360, a = 0},
			{time = 300, x = 80, a = 255}
		}
	})
	table.insert(skin.destination, {
		id = "-100", loop = 300, op = {916}, timer = 11, dst = {
			{time = 0, x = 0, y = 0, w = 1920, h = 1080, a = 0},
			{time = 300, a = 255}
		}
	})
	table.insert(skin.destination, {
		-- バナー
		id = "-102", loop = 300, op = {915}, timer = 11, dst = {
			{time = 0, x = 700, y = 785, w = 300, h = 80, a = 0},
			{time = 300, a = 255}
		}
	})
	table.insert(skin.destination, {
		-- サブタイトル
		id = "subtitle", loop = 0, op = {925}, dst = {
			{time = 0, x = 1920, y = 500, w = 1920, h = 170, r = 255, g = 255, b = 0, a = 120},
			{time = 10000, x = -1920}
		}
	})
	table.insert(skin.destination, {
		-- サブタイトルを表示させるための背景
		id = "main-bg", op = {925}, dst = {
			{x = 0, y = 406, w = 1920, h = 360},
		}
	})
	-- 曲リスト
	do
		local  songlist_path = skin_config.get_path("lua/songlist.lua")
		local  songlist_status, songlist_parts = pcall(function()
			return dofile(songlist_path).load()
		end)
		if songlist_status and songlist_parts then
			add_all(skin.image, songlist_parts.image)
			add_all(skin.imageset, songlist_parts.imageset)
			add_all(skin.value, songlist_parts.value)
			add_all(skin.songlist.listoff, songlist_parts.listoff)
			add_all(skin.songlist.liston, songlist_parts.liston)
			add_all(skin.songlist.level, songlist_parts.level)
			add_all(skin.songlist.label, songlist_parts.label)
			add_all(skin.songlist.text, songlist_parts.text)
			add_all(skin.songlist.lamp, songlist_parts.lamp)
			add_all(skin.songlist.playerlamp, songlist_parts.playerlamp)
			add_all(skin.songlist.rivallamp, songlist_parts.rivallamp)
			add_all(skin.songlist.trophy, songlist_parts.trophy)
			--add_all(skin.songlist.graph, songlist_parts.gra)
			add_all(skin.destination, songlist_parts.destination)
		end
	end
	-- メインフレーム
	do
		local mainframe_path = skin_config.get_path("lua/mainframe.lua")
		local mainframe_status, mainframe_parts = pcall(function()
			return dofile(mainframe_path).load()
		end)
		if mainframe_status and mainframe_parts then
			add_all(skin.image, mainframe_parts.image)
			add_all(skin.slider, mainframe_parts.slider)
			add_all(skin.imageset, mainframe_parts.imageset)
			add_all(skin.destination, mainframe_parts.destination)
		end
	end
	-- 選曲タイトル、ジャンル、BPM表示部
	do
		local musicdisplay_path = skin_config.get_path("lua/musicdisplay.lua")
		local musicdisplay_status, musicdisplay_parts = pcall(function()
			return dofile(musicdisplay_path).load()
		end)
		if musicdisplay_status and musicdisplay_parts then
			add_all(skin.image, musicdisplay_parts.image)
			add_all(skin.value, musicdisplay_parts.value)
			add_all(skin.destination, musicdisplay_parts.destination)
		end
	end
	-- ボタンエリア
	do
		local btnarea_path = skin_config.get_path("lua/btnarea.lua")
		local btnarea_status, btnarea_parts = pcall(function()
			return dofile(btnarea_path).load()
		end)
		if btnarea_status and btnarea_parts then
			add_all(skin.image, btnarea_parts.image)
			add_all(skin.destination, btnarea_parts.destination)
		end
	end
	-- コース・段位表示
	do
		local cource_path = skin_config.get_path("lua/cource.lua")
		local cource_status, cource_parts = pcall(function()
			return dofile(cource_path).load()
		end)
		if cource_status and cource_parts then
			add_all(skin.image, cource_parts.image)
			add_all(skin.destination, cource_parts.destination)
		end
	end
	-- BMS情報部
	do
		local info_path = skin_config.get_path("lua/info.lua")
		local info_status, info_parts = pcall(function()
			return dofile(info_path).load()
		end)
		if info_status and info_parts then
			add_all(skin.image, info_parts.image)
			add_all(skin.value, info_parts.value)
			add_all(skin.destination, info_parts.destination)
		end
	end
	-- スコア表示部
	do
		local score_path = skin_config.get_path("lua/score.lua")
		local score_status, score_parts = pcall(function()
			return dofile(score_path).load()
		end)
		if score_status and score_parts then
			add_all(skin.image, score_parts.image)
			add_all(skin.value, score_parts.value)
			add_all(skin.graph, score_parts.graph)
			add_all(skin.destination, score_parts.destination)
		end
	end
	-- BMS分析部
	do
		local bmsanalysis_path = skin_config.get_path("lua/bmsanalysis.lua")
		local bmsanalysis_status, bmsanalysis_parts = pcall(function()
			return dofile(bmsanalysis_path).load()
		end)
		if bmsanalysis_status and bmsanalysis_parts then
			add_all(skin.image, bmsanalysis_parts.image)
			add_all(skin.judgegraph, bmsanalysis_parts.judgegraph)
			add_all(skin.bpmgraph, bmsanalysis_parts.bpmgraph)
			add_all(skin.value, bmsanalysis_parts.value)
			add_all(skin.destination, bmsanalysis_parts.destination)
		end
	end
	-- ボリュームコントロール
	do
		local volumecontrol_path = skin_config.get_path("lua/volumecontrol.lua")
		local volumecontrol_status, volumecontrol_parts = pcall(function()
			return dofile(volumecontrol_path).load()
		end)
		if volumecontrol_status and volumecontrol_parts then
			add_all(skin.image, volumecontrol_parts.image)
			add_all(skin.value, volumecontrol_parts.value)
			add_all(skin.slider, volumecontrol_parts.slider)
			add_all(skin.destination, volumecontrol_parts.destination)
		end
	end
	-- QCO
	do
		local qco_path = skin_config.get_path("lua/qco.lua")
		local qco_status, qco_parts = pcall(function()
			return dofile(qco_path).load()
		end)
		if qco_status and qco_parts then
			add_all(skin.image, qco_parts.image)
			add_all(skin.imageset, qco_parts.imageset)
			add_all(skin.text, qco_parts.text)
			add_all(skin.value, qco_parts.value)
			add_all(skin.destination, qco_parts.destination)
		end
	end
	-- ライバル機能
	do
		local rivalview_path = skin_config.get_path("lua/rivalview.lua")
		local rivalview_status, rivalview_parts = pcall(function()
			return dofile(rivalview_path).load()
		end)
		if rivalview_status and rivalview_parts then
			add_all(skin.image, rivalview_parts.image)
			add_all(skin.value, rivalview_parts.value)
			add_all(skin.destination, rivalview_parts.destination)
		end
	end
	-- サイドメニュー
	do
		local path = skin_config.get_path("lua/sidemenu.lua")
		local status, parts = pcall(function()
			return dofile(path).load()
		end)
		if status and parts then
			add_all(skin.image, parts.image)
			add_all(skin.value, parts.value)
			add_all(skin.graph, parts.graph)
			add_all(skin.customTimers, parts.customTimers)
			add_all(skin.destination, parts.destination)
		end
	end
	-- ヘルプ画面
	do
		local path = skin_config.get_path("lua/help.lua")
		local status, parts = pcall(function()
			return dofile(path).load()
		end)
		if status and parts then
			add_all(skin.image, parts.image)
			add_all(skin.customTimers, parts.customTimers)
			add_all(skin.destination, parts.destination)
		end
	end
	-- 開始アニメーション
	do
		local startanimation_path = skin_config.get_path("lua/startanimation.lua")
		local startanimation_status, startanimation_parts = pcall(function()
			return dofile(startanimation_path).load()
		end)
		if startanimation_status and startanimation_parts then
			add_all(skin.image, startanimation_parts.image)
			add_all(skin.destination, startanimation_parts.destination)
		end
	end
	-- オプションメニュー
	do
		local option_path = skin_config.get_path("lua/option.lua")
		local option_status, option_parts = pcall(function()
			return dofile(option_path).load()
		end)
		if option_status and option_parts then
			add_all(skin.image, option_parts.image)
			add_all(skin.customTimers, option_parts.customTimers)
			add_all(skin.imageset, option_parts.imageset)
			add_all(skin.destination, option_parts.destination)
		end
	end
	-- アシストオプション
	do
		local assistoption_path = skin_config.get_path("lua/assistoption.lua")
		local assistoption_status, assistoption_parts = pcall(function()
			return dofile(assistoption_path).load()
		end)
		if assistoption_status and assistoption_parts then
			add_all(skin.image, assistoption_parts.image)
			add_all(skin.customTimers, assistoption_parts.customTimers)
			add_all(skin.imageset, assistoption_parts.imageset)
			add_all(skin.destination, assistoption_parts.destination)
		end
	end
	-- サブオプション
	do
		local suboption_path = skin_config.get_path("lua/suboption.lua")
		local suboption_status, suboption_parts = pcall(function()
			return dofile(suboption_path).load()
		end)
		if suboption_status and suboption_parts then
			add_all(skin.image, suboption_parts.image)
			add_all(skin.value, suboption_parts.value)
			add_all(skin.imageset, suboption_parts.imageset)
			add_all(skin.destination, suboption_parts.destination)
		end
	end

	return skin
end

return{
	header = header,
	main = main
}