local op_consts = require("option")
local offset_consts = require("offset")
local bomb_funcs = require("bomb")
local notes_funcs = require("notes")
---[[ バグ対応
local notes2_funcs = require("notes_v074")
--]]
local function append_all(list, t)
	if t then
		for _, v in pairs(t) do
			table.insert(list, v)
		end
	end
end


function main()

	local header = {
		type = 4,
		name = "simple-9keys 0.10 beta",
		w = 1920,
		h = 1080,
		playstart = 1000,
		scene = 3600000,
		input = 500,
		close = 1500,
		fadeout = 1000,
		finishmargin = 5000,


		property = {
		
			{name = "--Option----------------------------------------", item = {{name = "-", op = op_consts.SEPARATE_1}}},
			---[[ バグ対応
			{name = op_consts.OP_0_NAME, item = {
				{name = op_consts.OP_0_ITEM_NAME_1, op = op_consts.OP_0_ITEM_NUMBER_1},
				{name = op_consts.OP_0_ITEM_NAME_2, op = op_consts.OP_0_ITEM_NUMBER_2}
			}, def = op_consts.OP_0_ITEM_NAME_2},	
			--]]	
			{name = op_consts.OP_3_NAME, item = {
				{name = op_consts.OP_3_ITEM_NAME_1, op = op_consts.OP_3_ITEM_NUMBER_1},
				{name = op_consts.OP_3_ITEM_NAME_2, op = op_consts.OP_3_ITEM_NUMBER_2},
				{name = op_consts.OP_3_ITEM_NAME_3, op = op_consts.OP_3_ITEM_NUMBER_3}
			}, def = op_consts.OP_3_ITEM_NAME_1},	
			
			{name = op_consts.OP_6_NAME, item = {
				{name = op_consts.OP_6_ITEM_NAME_1, op = op_consts.OP_6_ITEM_NUMBER_1},
				{name = op_consts.OP_6_ITEM_NAME_2, op = op_consts.OP_6_ITEM_NUMBER_2}
			}, def = op_consts.OP_6_ITEM_NAME_1},
			
			{name = op_consts.OP_8_NAME, item = {
				{name = op_consts.OP_8_ITEM_NAME_1, op = op_consts.OP_8_ITEM_NUMBER_1},
				{name = op_consts.OP_8_ITEM_NAME_2, op = op_consts.OP_8_ITEM_NUMBER_2}
			}, def = op_consts.OP_8_ITEM_NAME_1},		
			
			{name = "--Display---------------------------------------", item = {{name = "-", op = op_consts.SEPARATE_2}}},	
			
			{name = "判定の詳細を表示する(速/遅) FAST/SLOW", item = {
				{name = "OFF",						op = op_consts.DISP_1_NUMBER_1},
				{name = "ON",						op = op_consts.DISP_1_NUMBER_2}
			}, def = "ON"},
			
			{name = "ゴーストスコアを表示する Ghost", item = {
				{name = "OFF",						op = op_consts.DISP_2_NUMBER_1},
				{name = "HISCORE",					op = op_consts.DISP_2_NUMBER_2},
				{name = "TARGET",					op = op_consts.DISP_2_NUMBER_3}
			}, def = "TARGET"},
			
			{name = "スコアグラフを表示する Score Graph", item = {
				{name = "OFF",						op = op_consts.DISP_3_NUMBER_1},
				{name = "ON",						op = op_consts.DISP_3_NUMBER_2}
			}, def = "ON"},
			
			{name = "EXスコアを表示する EX Score", item = {
				{name = "OFF",						op = op_consts.DISP_4_NUMBER_1},
				{name = "ON",						op = op_consts.DISP_4_NUMBER_2}
			}, def = "ON"},
			
			{name = "ターゲット及び自己ベストとのスコア差を表示する Diff Score", item = {
				{name = "OFF",						op = op_consts.DISP_5_NUMBER_1},
				{name = "ON",						op = op_consts.DISP_5_NUMBER_2}
			}, def = "ON"},
			
			{name = "スコアレートを表示する Score Rate", item = {
				{name = "OFF",						op = op_consts.DISP_6_NUMBER_1},
				{name = "ON",						op = op_consts.DISP_6_NUMBER_2}
			}, def = "ON"},
			
			{name = "ジャッジカウントを表示する Judge Count", item = {
				{name = "OFF",						op = op_consts.DISP_7_NUMBER_1},
				{name = "ON",						op = op_consts.DISP_7_NUMBER_2},
				{name = "ON+FAST/SLOW",				op = op_consts.DISP_7_NUMBER_3}
			}, def = "ON+FAST/SLOW"},
			
			{name = "MAXコンボを表示する Max Combo", item = {
				{name = "OFF",						op = op_consts.DISP_8_NUMBER_1},
				{name = "ON",						op = op_consts.DISP_8_NUMBER_2}
			}, def = "ON"},
			
			{name = "グルーヴゲージを表示する Groove Gauge", item = {
				{name = "OFF",						op = op_consts.DISP_9_NUMBER_1},
				{name = "ON",						op = op_consts.DISP_9_NUMBER_2}
			}, def = "ON"},
			
			{name = "楽曲のBPMを表示する BPM", item = {
				{name = "OFF",						op = op_consts.DISP_10_NUMBER_1},
				{name = "ON",						op = op_consts.DISP_10_NUMBER_2},
				{name = "ON+MIN/MAX",				op = op_consts.DISP_10_NUMBER_3}
			}, def = "ON+MIN/MAX"},
			
			{name = "楽曲のタイトルを表示する Title", item = {
				{name = "OFF",						op = op_consts.DISP_11_NUMBER_1},
				{name = "ON",						op = op_consts.DISP_11_NUMBER_2}
			}, def = "ON"},
			
			{name = "BGAを表示する BGA", item = {
				{name = "OFF",						op = op_consts.DISP_12_NUMBER_1},
				{name = "ON",						op = op_consts.DISP_12_NUMBER_2},
				{name = "BACKGROUND",				op = op_consts.DISP_12_NUMBER_3}
			}, def = "ON"},
			
			{name = op_consts.DISP_14_NAME, item = {
				{name = "OFF",						op = op_consts.DISP_14_NUMBER_1},
				{name = "ON(静止画)",				op = op_consts.DISP_14_NUMBER_2},
				{name = "POMYU(ぽみゅキャラ)",		op = op_consts.DISP_14_NUMBER_3},
				{name = "POMYU+BG(ぽみゅキャラ+キャラ背景)",	op = op_consts.DISP_14_NUMBER_4}
			}, def = "OFF"},
			
			{name = "--Image Select----------------------------------", item = {
				{name = "-", op = op_consts.SEPARATE_3}
			}}
		},
		
		filepath = {
			{name = "背景の画像 Background",							path = "customize/background/*", def = "default.png"},
			{name = "レーンの背景の画像 Lane Background",				path = "customize/lanebackground/*", def = "default.png"},
			{name = "1レーン目の色 Lane Color Key1",					path = "customize/lanecolor/*.png|1|", def = "10_darkgrey.png"},
			{name = "2レーン目の色 Lane Color Key2",					path = "customize/lanecolor/*.png|2|", def = "09_darkyellow.png"},
			{name = "3レーン目の色 Lane Color Key3",					path = "customize/lanecolor/*.png|3|", def = "08_darkgreen.png"},
			{name = "4レーン目の色 Lane Color Key4",					path = "customize/lanecolor/*.png|4|", def = "07_darkblue.png"},
			{name = "5レーン目の色 Lane Color Key5",					path = "customize/lanecolor/*.png|5|", def = "06_darkred.png"},
			{name = "6レーン目の色 Lane Color Key6",					path = "customize/lanecolor/*.png|6|", def = "07_darkblue.png"},
			{name = "7レーン目の色 Lane Color Key7",					path = "customize/lanecolor/*.png|7|", def = "08_darkgreen.png"},
			{name = "8レーン目の色 Lane Color Key8",					path = "customize/lanecolor/*.png|8|", def = "09_darkyellow.png"},
			{name = "9レーン目の色 Lane Color Key9",					path = "customize/lanecolor/*.png|9|", def = "10_darkgrey.png"},
			{name = "レーン間の線の色 Lane Line Color",					path = "customize/lanecolor/*.png|10|", def = "01_black.png"},
			{name = "レーンの外枠の色 Lane Outline Color",				path = "customize/lanecolor/*.png|11|", def = "04_silver.png"},
			{name = "1レーン目のノーツの画像 Notes Key1",				path = "customize/notes/*.png|1|", def = "pop_white.png"},
			{name = "2レーン目のノーツの画像 Notes Key2",				path = "customize/notes/*.png|2|", def = "pop_yellow.png"},
			{name = "3レーン目のノーツの画像 Notes Key3",				path = "customize/notes/*.png|3|", def = "pop_green.png"},
			{name = "4レーン目のノーツの画像 Notes Key4",				path = "customize/notes/*.png|4|", def = "pop_blue.png"},
			{name = "5レーン目のノーツの画像 Notes Key5",				path = "customize/notes/*.png|5|", def = "pop_red.png"},
			{name = "6レーン目のノーツの画像 Notes Key6",				path = "customize/notes/*.png|6|", def = "pop_blue.png"},
			{name = "7レーン目のノーツの画像 Notes Key7",				path = "customize/notes/*.png|7|", def = "pop_green.png"},
			{name = "8レーン目のノーツの画像 Notes Key8",				path = "customize/notes/*.png|8|", def = "pop_yellow.png"},
			{name = "9レーン目のノーツの画像 Notes Key9",				path = "customize/notes/*.png|9|", def = "pop_white.png"},
			{name = "1レーン目のキービームの画像 Laser Key1",			path = "customize/laser/*.png|1|", def = "default_w.png"},		
			{name = "2レーン目のキービームの画像 Laser Key2",			path = "customize/laser/*.png|2|", def = "default_b.png"},		
			{name = "3レーン目のキービームの画像 Laser Key3",			path = "customize/laser/*.png|3|", def = "default_w.png"},		
			{name = "4レーン目のキービームの画像 Laser Key4",			path = "customize/laser/*.png|4|", def = "default_b.png"},		
			{name = "5レーン目のキービームの画像 Laser Key5",			path = "customize/laser/*.png|5|", def = "default_w.png"},		
			{name = "6レーン目のキービームの画像 Laser Key6",			path = "customize/laser/*.png|6|", def = "default_b.png"},		
			{name = "7レーン目のキービームの画像 Laser Key7",			path = "customize/laser/*.png|7|", def = "default_w.png"},		
			{name = "8レーン目のキービームの画像 Laser Key8",			path = "customize/laser/*.png|8|", def = "default_b.png"},		
			{name = "9レーン目のキービームの画像 Laser Key9",			path = "customize/laser/*.png|9|", def = "default_w.png"},		
			{name = "判定ライン付近のグローの色 Glow Color",			path = "customize/glow/*.png", def = "99_off.png"},
			{name = "判定ラインの色 Judgeline Color",					path = "customize/judgeline/*.png", def = "01_red.png"},
			{name = "判定文字の画像 Judge",								path = "customize/judge/*.png", def = "default.png"},
			{name = "判定文字の画像(OADX+) OADX+ Judge",				path = "customize/oadx+/judge/*.png", def = "off.png"},
			{name = "曲進行度のバーの色 Song Progress Color",			path = "customize/progress/*.png", def = "04_aqua.png"},
			{name = "キーオン時のボタンの色 Key Light Color",			path = "customize/key/*.png", def = "04_aqua.png"},
			{name = "キャラクターの画像(静止画) Character",				path = "customize/character/*.png", def = "off.png"},
			{name = "ぽみゅキャラ Pomyu Chara",							path = "customize/pomyuchara/*", def = "off"},
			{name = "BGAが存在しない時に表示する画像 No BGA Image",		path = "customize/no_bga_image/*"},
			
			{name = "ボムの画像(グレ) Bomb",							path = "customize/bomb/*.png|1|", def = "default.png"},
			{name = "ボムの画像(ピカグレ) Bomb PG",						path = "customize/bomb/*.png|2|", def = "default_pg.png"},
			{name = "ボムの画像(ホールド始点終点) Bomb HOLD",			path = "customize/bomb/*.png|3|", def = "default_hold.png"},
			{name = "ボムの画像(ホールド中) HOLD Effect",				path = "customize/bomb/*.png|4|", def = "default_effect.png"},	
			{name = "ボムの画像(OADX) OADX Bomb",						path = "customize/oadx/bomb/*.png", def = "off.png"},	
			
			{name = "レーンカバーの画像 Lanecover",						path = "customize/cover/*|1|", def = "default.png"},
			{name = "HIDDENカバーの画像 Hiddencover",					path = "customize/cover/*|2|", def = "default.png"},
			{name = "リフトカバーの画像 Liftcover",						path = "customize/cover/*|3|", def = "off.png"},
			{name = "フィニッシュカバーの画像 Finishcover",				path = "customize/cover/*|4|", def = "off.png"}		
		},
		
		offset = {
			{name = "--Parameter (Absolute Value)--------------------",	id = offset_consts.SEPARATE_1},
			{name = offset_consts.PARAMETER_1_NAME,		id = offset_consts.PARAMETER_1_ID,	x = true, y = true},
			{name = offset_consts.PARAMETER_2_NAME,		id = offset_consts.PARAMETER_2_ID,	w = true},
			{name = offset_consts.PARAMETER_3_NAME,		id = offset_consts.PARAMETER_3_ID,	w = true},
			{name = offset_consts.PARAMETER_4_NAME,		id = offset_consts.PARAMETER_4_ID,	w = true},
			{name = offset_consts.PARAMETER_5_NAME,		id = offset_consts.PARAMETER_5_ID,	w = true},
			{name = offset_consts.PARAMETER_6_NAME,		id = offset_consts.PARAMETER_6_ID,	w = true},
			{name = offset_consts.PARAMETER_7_NAME,		id = offset_consts.PARAMETER_7_ID,	w = true},
			{name = offset_consts.PARAMETER_8_NAME,		id = offset_consts.PARAMETER_8_ID,	w = true},
			{name = offset_consts.PARAMETER_39_NAME,	id = offset_consts.PARAMETER_39_ID,	w = true},
			{name = offset_consts.PARAMETER_40_NAME,	id = offset_consts.PARAMETER_40_ID,	w = true},

			{name = offset_consts.PARAMETER_41_NAME,	id = offset_consts.PARAMETER_41_ID,	w = true, h = true},
			{name = offset_consts.PARAMETER_42_NAME,	id = offset_consts.PARAMETER_42_ID,	w = true, h = true},
			{name = offset_consts.PARAMETER_43_NAME,	id = offset_consts.PARAMETER_43_ID,	w = true, h = true},
			{name = offset_consts.PARAMETER_44_NAME,	id = offset_consts.PARAMETER_44_ID,	w = true, h = true},
			{name = offset_consts.PARAMETER_45_NAME,	id = offset_consts.PARAMETER_45_ID,	w = true, h = true},
			{name = offset_consts.PARAMETER_46_NAME,	id = offset_consts.PARAMETER_46_ID,	w = true, h = true},
			{name = offset_consts.PARAMETER_47_NAME,	id = offset_consts.PARAMETER_47_ID,	w = true, h = true},
			{name = offset_consts.PARAMETER_48_NAME,	id = offset_consts.PARAMETER_48_ID,	w = true, h = true},
			{name = offset_consts.PARAMETER_49_NAME,	id = offset_consts.PARAMETER_49_ID,	w = true, h = true},
			
			{name = offset_consts.PARAMETER_10_NAME,	id = offset_consts.PARAMETER_10_ID,	w = true},
			{name = offset_consts.PARAMETER_11_NAME,	id = offset_consts.PARAMETER_11_ID,	w = true},		
			{name = offset_consts.PARAMETER_12_NAME,	id = offset_consts.PARAMETER_12_ID,	a = true},
			{name = offset_consts.PARAMETER_13_NAME,	id = offset_consts.PARAMETER_13_ID,	a = true},
			{name = offset_consts.PARAMETER_14_NAME,	id = offset_consts.PARAMETER_14_ID,	a = true},
			{name = offset_consts.PARAMETER_15_NAME,	id = offset_consts.PARAMETER_15_ID,	h = true},
			{name = offset_consts.PARAMETER_16_NAME,	id = offset_consts.PARAMETER_16_ID,	h = true},
			{name = offset_consts.PARAMETER_17_NAME,	id = offset_consts.PARAMETER_17_ID,	h = true},
			{name = offset_consts.PARAMETER_18_NAME,	id = offset_consts.PARAMETER_18_ID,	a = true},
			{name = offset_consts.PARAMETER_19_NAME,	id = offset_consts.PARAMETER_19_ID,	w = true, h = true},
			{name = offset_consts.PARAMETER_20_NAME,	id = offset_consts.PARAMETER_20_ID,	w = true},		
			{name = offset_consts.PARAMETER_21_NAME,	id = offset_consts.PARAMETER_21_ID,	x = true, y = true},
			{name = offset_consts.PARAMETER_22_NAME,	id = offset_consts.PARAMETER_22_ID,	h = true},
			{name = offset_consts.PARAMETER_23_NAME,	id = offset_consts.PARAMETER_23_ID,	x = true, y = true},
			{name = offset_consts.PARAMETER_24_NAME,	id = offset_consts.PARAMETER_24_ID,	x = true, y = true},
			{name = offset_consts.PARAMETER_25_NAME,	id = offset_consts.PARAMETER_25_ID,	x = true, y = true},
			{name = offset_consts.PARAMETER_26_NAME,	id = offset_consts.PARAMETER_26_ID,	x = true, y = true},		
			{name = offset_consts.PARAMETER_27_NAME,	id = offset_consts.PARAMETER_27_ID,	x = true, y = true},
			{name = offset_consts.PARAMETER_28_NAME,	id = offset_consts.PARAMETER_28_ID,	x = true, y = true},
			{name = offset_consts.PARAMETER_29_NAME,	id = offset_consts.PARAMETER_29_ID,	x = true, y = true},
			{name = offset_consts.PARAMETER_30_NAME,	id = offset_consts.PARAMETER_30_ID,	w = true},
			{name = offset_consts.PARAMETER_31_NAME,	id = offset_consts.PARAMETER_31_ID,	x = true, y = true},
			{name = offset_consts.PARAMETER_32_NAME,	id = offset_consts.PARAMETER_32_ID,	x = true, y = true},
			{name = offset_consts.PARAMETER_33_NAME,	id = offset_consts.PARAMETER_33_ID,	w = true},
			{name = offset_consts.PARAMETER_36_NAME,	id = offset_consts.PARAMETER_36_ID,	a = true},
			{name = offset_consts.PARAMETER_37_NAME,	id = offset_consts.PARAMETER_37_ID,	x = true, y = true},
			{name = offset_consts.PARAMETER_38_NAME,	id = offset_consts.PARAMETER_38_ID,	a = true},
			{name = "--offset (Relative Value)-----------------------",	id = offset_consts.SEPARATE_3},
			{name = "判定ラインの表示位置 Judgeline Position",	id = offset_consts.OFFSET_1_ID, y = true}
		}
	}

	local function body()

		local skin = {}
		for k, v in pairs(header) do
			skin[k] = v
		end

		-- 各レーン幅
		local lane_width = {90, 79, 90, 79, 90, 79, 90, 79, 90}
		
		if skin_config.offset[offset_consts.PARAMETER_2_NAME].w > 0 then
			lane_width[1] = skin_config.offset[offset_consts.PARAMETER_2_NAME].w
		end	
		if skin_config.offset[offset_consts.PARAMETER_3_NAME].w > 0 then
			lane_width[2] = skin_config.offset[offset_consts.PARAMETER_3_NAME].w
		end	
		if skin_config.offset[offset_consts.PARAMETER_4_NAME].w > 0 then
			lane_width[3] = skin_config.offset[offset_consts.PARAMETER_4_NAME].w
		end	
		if skin_config.offset[offset_consts.PARAMETER_5_NAME].w > 0 then
			lane_width[4] = skin_config.offset[offset_consts.PARAMETER_5_NAME].w
		end	
		if skin_config.offset[offset_consts.PARAMETER_6_NAME].w > 0 then
			lane_width[5] = skin_config.offset[offset_consts.PARAMETER_6_NAME].w
		end	
		if skin_config.offset[offset_consts.PARAMETER_7_NAME].w > 0 then
			lane_width[6] = skin_config.offset[offset_consts.PARAMETER_7_NAME].w
		end	
		if skin_config.offset[offset_consts.PARAMETER_8_NAME].w > 0 then
			lane_width[7] = skin_config.offset[offset_consts.PARAMETER_8_NAME].w
		end	
		if skin_config.offset[offset_consts.PARAMETER_39_NAME].w > 0 then
			lane_width[8] = skin_config.offset[offset_consts.PARAMETER_39_NAME].w
		end 
		if skin_config.offset[offset_consts.PARAMETER_40_NAME].w > 0 then
			lane_width[9] = skin_config.offset[offset_consts.PARAMETER_40_NAME].w
		end 
		
		-- 各ノーツ幅
		local note_width = {}
		append_all(note_width, lane_width)
		local note_height = {40,40,40,40,40,40,40,40,40}
		
		if skin_config.offset[offset_consts.PARAMETER_41_NAME].w > 0 then
			note_width[1] = skin_config.offset[offset_consts.PARAMETER_41_NAME].w
		end	
		if skin_config.offset[offset_consts.PARAMETER_42_NAME].w > 0 then
			note_width[2] = skin_config.offset[offset_consts.PARAMETER_42_NAME].w
		end	
		if skin_config.offset[offset_consts.PARAMETER_43_NAME].w > 0 then
			note_width[3] = skin_config.offset[offset_consts.PARAMETER_43_NAME].w
		end	
		if skin_config.offset[offset_consts.PARAMETER_44_NAME].w > 0 then
			note_width[4] = skin_config.offset[offset_consts.PARAMETER_44_NAME].w
		end	
		if skin_config.offset[offset_consts.PARAMETER_45_NAME].w > 0 then
			note_width[5] = skin_config.offset[offset_consts.PARAMETER_45_NAME].w
		end	
		if skin_config.offset[offset_consts.PARAMETER_46_NAME].w > 0 then
			note_width[6] = skin_config.offset[offset_consts.PARAMETER_46_NAME].w
		end	
		if skin_config.offset[offset_consts.PARAMETER_47_NAME].w > 0 then
			note_width[7] = skin_config.offset[offset_consts.PARAMETER_47_NAME].w
		end	
		if skin_config.offset[offset_consts.PARAMETER_48_NAME].w > 0 then
			note_width[8] = skin_config.offset[offset_consts.PARAMETER_48_NAME].w
		end 
		if skin_config.offset[offset_consts.PARAMETER_49_NAME].w > 0 then
			note_width[9] = skin_config.offset[offset_consts.PARAMETER_49_NAME].w
		end 
		
		if skin_config.offset[offset_consts.PARAMETER_41_NAME].h > 0 then
			note_height[1] = skin_config.offset[offset_consts.PARAMETER_41_NAME].h
		end	
		if skin_config.offset[offset_consts.PARAMETER_42_NAME].h > 0 then
			note_height[2] = skin_config.offset[offset_consts.PARAMETER_42_NAME].h
		end	
		if skin_config.offset[offset_consts.PARAMETER_43_NAME].h > 0 then
			note_height[3] = skin_config.offset[offset_consts.PARAMETER_43_NAME].h
		end	
		if skin_config.offset[offset_consts.PARAMETER_44_NAME].h > 0 then
			note_height[4] = skin_config.offset[offset_consts.PARAMETER_44_NAME].h
		end	
		if skin_config.offset[offset_consts.PARAMETER_45_NAME].h > 0 then
			note_height[5] = skin_config.offset[offset_consts.PARAMETER_45_NAME].h
		end	
		if skin_config.offset[offset_consts.PARAMETER_46_NAME].h > 0 then
			note_height[6] = skin_config.offset[offset_consts.PARAMETER_46_NAME].h
		end	
		if skin_config.offset[offset_consts.PARAMETER_47_NAME].h > 0 then
			note_height[7] = skin_config.offset[offset_consts.PARAMETER_47_NAME].h
		end	
		if skin_config.offset[offset_consts.PARAMETER_48_NAME].h > 0 then
			note_height[8] = skin_config.offset[offset_consts.PARAMETER_48_NAME].h
		end 
		if skin_config.offset[offset_consts.PARAMETER_49_NAME].h > 0 then
			note_height[9] = skin_config.offset[offset_consts.PARAMETER_49_NAME].h
		end 


		-- レーン間の線幅
		local lane_line_px = 3
		if skin_config.offset[offset_consts.PARAMETER_10_NAME].w ~= 0 then
			if skin_config.offset[offset_consts.PARAMETER_10_NAME].w < 0 then
				lane_line_px = 0
			else
				lane_line_px = skin_config.offset[offset_consts.PARAMETER_10_NAME].w
			end
		end 
		
		-- アウトラインの線幅
		local lane_outline_px = 3
		if skin_config.offset[offset_consts.PARAMETER_11_NAME].w ~= 0 then
			if skin_config.offset[offset_consts.PARAMETER_11_NAME].w < 0 then
				lane_outline_px = 0
			else
				lane_outline_px = skin_config.offset[offset_consts.PARAMETER_11_NAME].w
			end
		end 
		
		-- レーンの透過度
		local lane_opacity = 0
		if skin_config.offset[offset_consts.PARAMETER_12_NAME].a < 0 then
			lane_opacity = skin_config.offset[offset_consts.PARAMETER_12_NAME].a
		end 
		-- レーン背景の透過度
		local lanebg_opacity = 0
		if skin_config.offset[offset_consts.PARAMETER_13_NAME].a < 0 then
			lanebg_opacity = skin_config.offset[offset_consts.PARAMETER_13_NAME].a
		end 
		
		-- レーンの座標
		local lane_origin_x = nil
		do
			local w = 0
			for i, v in ipairs(lane_width) do
				w = w + v + (lane_line_px * (i - 1))
			end
			lane_origin_x = (1920 - w) / 2
		end
		
		local lane_origin_y = 210
		if skin_config.offset[offset_consts.PARAMETER_1_NAME].x ~= 0 then
			lane_origin_x = skin_config.offset[offset_consts.PARAMETER_1_NAME].x + lane_outline_px
		end	
		if skin_config.offset[offset_consts.PARAMETER_1_NAME].y ~= 0 then
			lane_origin_y = skin_config.offset[offset_consts.PARAMETER_1_NAME].y
		end	
		
		-- レーンの縦幅
		local lane_height = 1080 - lane_origin_y
		
		-- ぽみゅキャラ
		local pmc_w = 334
		local pmc_h = 542
		local pmc_x = lane_origin_x - pmc_w - lane_outline_px - 32
		local pmc_y = lane_origin_y
		local pmc_margin = 10
		local pmc_name_w = 262
		local pmc_name_h = 58
		local pmc_name_x = (pmc_w - pmc_name_w) / 2 + pmc_x
		local pmc_name_y = pmc_y + pmc_h + 30 + pmc_margin
		local pmc_name_area_h = pmc_name_h + (pmc_margin * 2)		
		local pmc_name_area_y = pmc_y + pmc_h + 30
		local pmc_frame_image_y = pmc_y + pmc_h - 3
		local pmc_line_image_y = pmc_y - 3
		local pmc_frame_name_y = pmc_name_y + pmc_name_h + pmc_margin - 3
		local pmc_line_name_y = pmc_y + pmc_h + 27
		
		-- 小節線の透過度
		local barline_opacity = 0
		if skin_config.offset[offset_consts.PARAMETER_14_NAME].a < 0 then
			barline_opacity = skin_config.offset[offset_consts.PARAMETER_14_NAME].a
		end	
				
		-- グローの縦幅
		local glow_height = 64
		if skin_config.offset[offset_consts.PARAMETER_15_NAME].h > 0 then
			glow_height = skin_config.offset[offset_consts.PARAMETER_15_NAME].h
		end	
		
		-- ジャッジラインの縦幅
		local judgeline_height = 14
		if skin_config.offset[offset_consts.PARAMETER_16_NAME].h > 0 then
			judgeline_height = skin_config.offset[offset_consts.PARAMETER_16_NAME].h
		end	
		-- ジャッジラインの位置
		local judgeline_y = lane_origin_y
		if skin_config.option[op_consts.OP_8_NAME] == op_consts.OP_8_ITEM_NUMBER_1 then
			judgeline_y = judgeline_y + 13
		end	
		
		-- キービームの縦幅
		local keybeam_height = lane_height
		if skin_config.offset[offset_consts.PARAMETER_17_NAME].h > 0 then
			keybeam_height = skin_config.offset[offset_consts.PARAMETER_17_NAME].h
		end	
		
		-- キービームの透過度
		local keybeam_opacity = 0
		if skin_config.offset[offset_consts.PARAMETER_18_NAME].a < 0 then
			keybeam_opacity = skin_config.offset[offset_consts.PARAMETER_18_NAME].a
		end	
		
		-- キービームの可変幅
		local keybeam_variable = 10	
		local keybeam_width = {
			key1 = lane_width[1] - (keybeam_variable * 2),
			key2 = lane_width[2] - (keybeam_variable * 2),
			key3 = lane_width[3] - (keybeam_variable * 2),
			key4 = lane_width[4] - (keybeam_variable * 2),
			key5 = lane_width[5] - (keybeam_variable * 2),
			key6 = lane_width[6] - (keybeam_variable * 2),
			key7 = lane_width[7] - (keybeam_variable * 2),
			key8 = lane_width[8] - (keybeam_variable * 2),
			key9 = lane_width[9] - (keybeam_variable * 2),
		}
		
		-- ボムのサイズ
		local bomb_size = {
			w = 384,
			h = 384
		}
		if skin_config.offset[offset_consts.PARAMETER_19_NAME].w > 0 then
			bomb_size.w = skin_config.offset[offset_consts.PARAMETER_19_NAME].w
		end	
		if skin_config.offset[offset_consts.PARAMETER_19_NAME].h > 0 then
			bomb_size.h = skin_config.offset[offset_consts.PARAMETER_19_NAME].h
		end	
		
		-- ボムのy座標
		local bomb_y = judgeline_y - (bomb_size.h / 2)
		
		-- OADXボムのサイズ
		local oadx_bomb_size = {
			w = 181,
			h = 192
		}
		if skin_config.option[op_consts.OP_3_NAME] == op_consts.OP_3_ITEM_NUMBER_3 then
			oadx_bomb_size.h = 144
		end

		if skin_config.offset[offset_consts.PARAMETER_20_NAME].w > 0 then
			oadx_bomb_size.w = oadx_bomb_size.w / 100 * skin_config.offset[offset_consts.PARAMETER_20_NAME].w
			oadx_bomb_size.h = oadx_bomb_size.h / 100 * skin_config.offset[offset_consts.PARAMETER_20_NAME].w
		else
			oadx_bomb_size.w = oadx_bomb_size.w * 3
			oadx_bomb_size.h = oadx_bomb_size.h * 3	
		end
		
		-- OADXボムのy座標
		local oadx_bomb_y = judgeline_y - (oadx_bomb_size.h / 2) - (oadx_bomb_size.h / 100 * 7.29166666666667)
		
		-- 各x座標を計算する
		local lane_x = {}
		local lane_width_total = nil
		local note_x = {}
		local line_x = {}
		local outline_x = {}
		local keybeam_x = {}
		local bomb_x = {}
		local oadx_bomb_x = {}

		do
			local lane_order = {1, 2, 3, 4, 5, 6, 7, 8, 9}			
			local x = lane_origin_x
			for i, k in ipairs(lane_order) do
				lane_x[k] = x
				line_x[i] = x - lane_line_px
				keybeam_x[k] = x + keybeam_variable
				local width = lane_width[k]
				note_x[k] = x + (width / 2) - (note_width[k] / 2)
				bomb_x[k] = x + (width / 2) - (bomb_size.w / 2)
				oadx_bomb_x[k] = x + (width / 2) - (oadx_bomb_size.w / 2) + (oadx_bomb_size.w / 100 * 6.35359116022099)
				x = x + width + lane_line_px					
			end
			lane_width_total = x - lane_origin_x - lane_line_px
			outline_x[1] = lane_origin_x - lane_outline_px
			outline_x[2] = x - lane_line_px
		end
		
		-- レーン下部のアウトラインの座標・線幅
		local outline_y = lane_origin_y - lane_outline_px
		local outline_width = lane_width_total + (lane_outline_px * 2)
		
		-- レーン右端の座標
		local lane_right_x = lane_origin_x + lane_width_total + lane_outline_px
		
		-- レーン中央の座標
		local lane_center_x = lane_origin_x + (lane_width_total / 2)
				
		-- ジャッジの座標
		local judge1_x = nil
		local judge2_x = nil
		local judge3_x = nil
		local judge1n_x = nil
		local judge2n_x = nil
		local judge3n_x = nil
		local judge_y = lane_origin_y + 160
		local judgedetail_y = judge_y + 60
		local ghost_y = judgedetail_y + 55

		do
			var1 = lane_width[1] + lane_width[2] + lane_width[3] + (lane_line_px * 2)
			var2 = lane_width[4] + lane_width[5] + lane_width[6] + (lane_line_px * 4)
			var3 = lane_width[7] + lane_width[8] + lane_width[9] + (lane_line_px * 2)
			judge1_x = lane_origin_x + (var1 / 2)
			judge2_x = lane_origin_x + var1 + (var2 / 2)
			judge3_x = lane_origin_x + var1 + var2 + (var3 / 2)
		end
		
		local judgedetail1_x = judge1_x - 36
		local judgedetail2_x = judge2_x - 36
		local judgedetail3_x = judge3_x - 36
		local ghost_x = judge2_x - 54
		
		if skin_config.option[op_consts.OP_6_NAME] == op_consts.OP_6_ITEM_NUMBER_1 then
			judge1_x = judge1_x - 90
			judge2_x = judge2_x - 90
			judge3_x = judge3_x - 90
			judgen_x = 90
		else
			judge1_x = judge1_x - 115
			judge2_x = judge2_x - 115
			judge3_x = judge3_x - 115
			judgen_x = 115
			judgedetail_y = judgedetail_y + 30
			ghost_y = ghost_y + 30
		end
		
		-- OADX+ジャッジのサイズ
		local oadx_judge_w = 231
		local oadx_judgen_w = 51
		local oadx_judge_h = 80
			
		-- スコアグラフの座標
		local graph_x = lane_right_x + 32
		if skin_config.offset[offset_consts.PARAMETER_23_NAME].x ~= 0 then
			graph_x = skin_config.offset[offset_consts.PARAMETER_23_NAME].x
		end	
		local graph_y = 360	
		if skin_config.offset[offset_consts.PARAMETER_23_NAME].y ~= 0 then
			graph_y = skin_config.offset[offset_consts.PARAMETER_23_NAME].y
		end	
		
		local exscore_x = graph_x
		if skin_config.offset[offset_consts.PARAMETER_24_NAME].x ~= 0 then
			exscore_x = skin_config.offset[offset_consts.PARAMETER_24_NAME].x
		end	
		local exscore_y = graph_y + 675
		if skin_config.offset[offset_consts.PARAMETER_24_NAME].y ~= 0 then
			exscore_y = skin_config.offset[offset_consts.PARAMETER_24_NAME].y
		end	
		
		local diffscore_x = graph_x
		if skin_config.offset[offset_consts.PARAMETER_25_NAME].x ~= 0 then
			diffscore_x = skin_config.offset[offset_consts.PARAMETER_25_NAME].x
		end	
		local diffscore_y = graph_y + 36
		if skin_config.offset[offset_consts.PARAMETER_25_NAME].y ~= 0 then
			diffscore_y = skin_config.offset[offset_consts.PARAMETER_25_NAME].y
		end	

		local rate_x = graph_x
		if skin_config.offset[offset_consts.PARAMETER_26_NAME].x ~= 0 then
			rate_x = skin_config.offset[offset_consts.PARAMETER_26_NAME].x
		end	
		local rate_y = graph_y + 17
		if skin_config.offset[offset_consts.PARAMETER_26_NAME].y ~= 0 then
			rate_y = skin_config.offset[offset_consts.PARAMETER_26_NAME].y
		end	
			
		local judgecount_x = graph_x
		if skin_config.offset[offset_consts.PARAMETER_27_NAME].x ~= 0 then
			judgecount_x = skin_config.offset[offset_consts.PARAMETER_27_NAME].x
		end	
		local judgecount_y = graph_y - 150
		if skin_config.offset[offset_consts.PARAMETER_27_NAME].y ~= 0 then
			judgecount_y = skin_config.offset[offset_consts.PARAMETER_27_NAME].y
		end	
		
		local maxcombo_x = graph_x
		if skin_config.offset[offset_consts.PARAMETER_28_NAME].x ~= 0 then
			maxcombo_x = skin_config.offset[offset_consts.PARAMETER_28_NAME].x
		end	
		local maxcombo_y = graph_y - 169
		if skin_config.offset[offset_consts.PARAMETER_28_NAME].y ~= 0 then
			maxcombo_y = skin_config.offset[offset_consts.PARAMETER_28_NAME].y
		end
		
		-- 曲の進行度
		local songprogress_width = 10
		local songprogress_height = 1080
		if skin_config.offset[offset_consts.PARAMETER_22_NAME].h > 0 then
			songprogress_height = skin_config.offset[offset_consts.PARAMETER_22_NAME].h
		end	
		local songprogress_x = 0
		if skin_config.offset[offset_consts.PARAMETER_21_NAME].x ~= 0 then
			songprogress_x = skin_config.offset[offset_consts.PARAMETER_21_NAME].x
		end	
		local songprogress_y = 0
		if skin_config.offset[offset_consts.PARAMETER_21_NAME].y ~= 0 then
			songprogress_y = skin_config.offset[offset_consts.PARAMETER_21_NAME].y
		end	

		-- グルーヴゲージ
		local gauge_x = lane_origin_x
		if skin_config.offset[offset_consts.PARAMETER_29_NAME].x ~= 0 then
			gauge_x = skin_config.offset[offset_consts.PARAMETER_29_NAME].x
		end	
		local gauge_y = 68
		if skin_config.offset[offset_consts.PARAMETER_29_NAME].y ~= 0 then
			gauge_y = skin_config.offset[offset_consts.PARAMETER_29_NAME].y
		end	
		local gauge_scale = lane_width_total / 12
		if skin_config.offset[offset_consts.PARAMETER_30_NAME].w > 0 then
			gauge_scale = skin_config.offset[offset_consts.PARAMETER_30_NAME].w
		end	
		local gauge_width = gauge_scale * 12
		local gauge_height = 35
		
		local bpm_x = gauge_x + gauge_width - 200
		if skin_config.offset[offset_consts.PARAMETER_31_NAME].x ~= 0 then
			bpm_x = skin_config.offset[offset_consts.PARAMETER_31_NAME].x
		end	
		local bpm_y = gauge_y - 56
		if skin_config.offset[offset_consts.PARAMETER_31_NAME].y ~= 0 then
			bpm_y = skin_config.offset[offset_consts.PARAMETER_31_NAME].y
		end
		
		local title_width = gauge_width - 200
		if skin_config.offset[offset_consts.PARAMETER_33_NAME].w > 0 then
			title_width = skin_config.offset[offset_consts.PARAMETER_33_NAME].w
		end	
		local title_x = gauge_x + (title_width / 2)
		if skin_config.offset[offset_consts.PARAMETER_32_NAME].x ~= 0 then
			title_x = skin_config.offset[offset_consts.PARAMETER_32_NAME].x + (title_width / 2)
		end	
		local title_y = gauge_y - 56
		if skin_config.offset[offset_consts.PARAMETER_32_NAME].y ~= 0 then
			title_y = skin_config.offset[offset_consts.PARAMETER_32_NAME].y
		end	
			
		-- BGA
		local bga_x = graph_x + 221 + 32
		local bga1_y = 761
		local bga2_y = 442
		local bga3_y = 123
		local bga4_y = -196
		local bga_width = 319
		local bga_height = 319
		local bga_opacity = 0
		if skin_config.offset[offset_consts.PARAMETER_36_NAME].a < 0 then
			bga_opacity = skin_config.offset[offset_consts.PARAMETER_36_NAME].a
		end
		
		local background_opacity = 0
		if skin_config.offset[offset_consts.PARAMETER_38_NAME].a < 0 then
			background_opacity = skin_config.offset[offset_consts.PARAMETER_38_NAME].a
		end
		
		skin.source =  {
			{id = "src-background",			path = "customize/background/*"},
			{id = "src-lanebg",				path = "customize/lanebackground/*"},
			{id = "src-lane-1",				path = "customize/lanecolor/*.png|1|"},
			{id = "src-lane-2",				path = "customize/lanecolor/*.png|2|"},
			{id = "src-lane-3",				path = "customize/lanecolor/*.png|3|"},
			{id = "src-lane-4",				path = "customize/lanecolor/*.png|4|"},
			{id = "src-lane-5",				path = "customize/lanecolor/*.png|5|"},
			{id = "src-lane-6",				path = "customize/lanecolor/*.png|6|"},
			{id = "src-lane-7",				path = "customize/lanecolor/*.png|7|"},
			{id = "src-lane-8",				path = "customize/lanecolor/*.png|8|"},
			{id = "src-lane-9",				path = "customize/lanecolor/*.png|9|"},
			{id = "src-line",				path = "customize/lanecolor/*.png|10|"},
			{id = "src-outline",			path = "customize/lanecolor/*.png|11|"},
			{id = "src-glow",				path = "customize/glow/*.png"},
			{id = "src-judgeline",			path = "customize/judgeline/*.png"},
			{id = "src-laser-1",			path = "customize/laser/*.png|1|"},
			{id = "src-laser-2",			path = "customize/laser/*.png|2|"},
			{id = "src-laser-3",			path = "customize/laser/*.png|3|"},
			{id = "src-laser-4",			path = "customize/laser/*.png|4|"},
			{id = "src-laser-5",			path = "customize/laser/*.png|5|"},
			{id = "src-laser-6",			path = "customize/laser/*.png|6|"},
			{id = "src-laser-7",			path = "customize/laser/*.png|7|"},
			{id = "src-laser-8",			path = "customize/laser/*.png|8|"},
			{id = "src-laser-9",			path = "customize/laser/*.png|9|"},
			{id = "src-notes-1",			path = "customize/notes/*.png|1|"},
			{id = "src-notes-2",			path = "customize/notes/*.png|2|"},
			{id = "src-notes-3",			path = "customize/notes/*.png|3|"},
			{id = "src-notes-4",			path = "customize/notes/*.png|4|"},
			{id = "src-notes-5",			path = "customize/notes/*.png|5|"},
			{id = "src-notes-6",			path = "customize/notes/*.png|6|"},
			{id = "src-notes-7",			path = "customize/notes/*.png|7|"},
			{id = "src-notes-8",			path = "customize/notes/*.png|8|"},
			{id = "src-notes-9",			path = "customize/notes/*.png|9|"},
			{id = "src-bomb",				path = "customize/bomb/*.png|1|"},
			{id = "src-bomb-pg",			path = "customize/bomb/*.png|2|"},
			{id = "src-bomb-hold",			path = "customize/bomb/*.png|3|"},
			{id = "src-hold-effect",		path = "customize/bomb/*.png|4|"},
			{id = "src-judge",				path = "customize/judge/*.png"},
			{id = "src-lanecover",			path = "customize/cover/*|1|"},	
			{id = "src-hiddencover",		path = "customize/cover/*|2|"},
			{id = "src-liftcover",			path = "customize/cover/*|3|"},
			{id = "src-finishcover",		path = "customize/cover/*|4|"},		
			{id = "src-key",				path = "customize/key/*.png"},
			{id = "src-progress",			path = "customize/progress/*.png"},
			{id = "src-character",			path = "customize/character/*.png"},
			{id = "src-pomyuchara",			path = "customize/pomyuchara/*"},
			{id = "src-nobgaimage",			path = "customize/no_bga_image/*"},
			{id = "src-judgedetail",		path = "parts/judgedetail.png"},
			{id = "src-barline",			path = "parts/bar_line.png"},
			{id = "src-number-s",			path = "parts/number_s.png"},
			{id = "src-number-m",			path = "parts/number_m.png"},
			{id = "src-scoregraph",			path = "parts/scoregraph.png"},
			{id = "src-scoregraph-frame",	path = "parts/scoregraph_frame.png"},
			{id = "src-scoregraph-line",	path = "parts/scoregraph_line.png"},
			{id = "src-string",				path = "parts/string.png"},
			{id = "src-pomyu-frame",		path = "parts/pomyu_frame.png"},
			{id = "src-gauge",				path = "parts/gauge.png"},
			{id = "src-fceffect",			path = "parts/fceffect.png"},
			{id = "src-fullcombo",			path = "parts/fullcombo.png"},
			{id = "src-ready",				path = "parts/ready.png"},
			
			{id = "src-oadxbomb",			path = "customize/oadx/bomb/*.png"},
			{id = "src-oadx+judge",			path = "customize/oadx+/judge/*.png"}
		}
		
		skin.font =  {{id = 0, path = "font/mplus-1c-heavy.ttf"}}
		
		skin.image = {
			{id = "background", src = "src-background", x = 0, y = 0, w = -1, h = -1},
			
			{id = "no-bga-image", src = "src-nobgaimage", x = 0, y = 0, w = -1, h = -1},

			{id = "scoregraph-frame", src = "src-scoregraph-frame", x = 0, y = 0, w = -1, h = -1},
			{id = "scoregraph-line", src = "src-scoregraph-line", x = 0, y = 0, w = 1, h = 1},
			
			{id = "pomyu-frame-name", src = "src-pomyu-frame", x = 0, y = 0, w = 334, h = 10},
			{id = "pomyu-frame-image", src = "src-pomyu-frame", x = 0, y = 10, w = 334, h = 10},
			{id = "pomyu-frame-line", src = "src-pomyu-frame", x = 0, y = 24, w = 334, h = 3},

			
			{id = "exscore-s", src = "src-string", x = 0, y = 184, w = 78, h = 17},
			{id = "diffscore-s", src = "src-string", x = 0, y = 131, w = 65, h = 36},
			{id = "rate-s", src = "src-string", x = 0, y = 167, w = 65, h = 17},
			{id = "judgecount-s", src = "src-string", x = 0, y = 0, w = 39, h = 131},
			{id = "bpm-s", src = "src-string", x = 0, y = 201, w = 39, h = 17},
			{id = "maxcombo-s", src = "src-string", x = 0, y = 223, w = 78, h = 17},
			{id = "dot", src = "src-string", x = 0, y = 218, w = 5, h = 5},
			
			{id = "lane-bg", src = "src-lanebg", x = 0, y = 0, w = -1, h = -1},		
			{id = "lane-1", src = "src-lane-1", x = 0, y = 0, w = -1, h = -1},
			{id = "lane-2", src = "src-lane-2", x = 0, y = 0, w = -1, h = -1},
			{id = "lane-3", src = "src-lane-3", x = 0, y = 0, w = -1, h = -1},
			{id = "lane-4", src = "src-lane-4", x = 0, y = 0, w = -1, h = -1},
			{id = "lane-5", src = "src-lane-5", x = 0, y = 0, w = -1, h = -1},
			{id = "lane-6", src = "src-lane-6", x = 0, y = 0, w = -1, h = -1},
			{id = "lane-7", src = "src-lane-7", x = 0, y = 0, w = -1, h = -1},
			{id = "lane-8", src = "src-lane-8", x = 0, y = 0, w = -1, h = -1},
			{id = "lane-9", src = "src-lane-9", x = 0, y = 0, w = -1, h = -1},
			{id = "lane-line", src = "src-line", x = 0, y = 0, w = -1, h = -1},
			{id = "lane-outline", src = "src-outline", x = 0, y = 8, w = -1, h = -1},
			{id = "glow", src = "src-glow", x = 0, y = 0, w = -1, h = -1},
			{id = "judgeline", src = "src-judgeline", x = 0, y = 0, w = 1, h = 1},
			{id = "key", src = "src-key", x = 0, y = 0, w = 1, h = 1},
		
			{id = "keybeam-1", src = "src-laser-1", x = 0, y = 0, w = 16, h = 255},
			{id = "keybeam-2", src = "src-laser-2", x = 0, y = 0, w = 16, h = 255},
			{id = "keybeam-3", src = "src-laser-3", x = 0, y = 0, w = 16, h = 255},
			{id = "keybeam-4", src = "src-laser-4", x = 0, y = 0, w = 16, h = 255},
			{id = "keybeam-5", src = "src-laser-5", x = 0, y = 0, w = 16, h = 255},
			{id = "keybeam-6", src = "src-laser-6", x = 0, y = 0, w = 16, h = 255},
			{id = "keybeam-7", src = "src-laser-7", x = 0, y = 0, w = 16, h = 255},
			{id = "keybeam-8", src = "src-laser-8", x = 0, y = 0, w = 16, h = 255},
			{id = "keybeam-9", src = "src-laser-9", x = 0, y = 0, w = 16, h = 255},
			{id = "keybeam-1-pg", src = "src-laser-1", x = 16, y = 0, w = 16, h = 255},
			{id = "keybeam-2-pg", src = "src-laser-2", x = 16, y = 0, w = 16, h = 255},
			{id = "keybeam-3-pg", src = "src-laser-3", x = 16, y = 0, w = 16, h = 255},
			{id = "keybeam-4-pg", src = "src-laser-4", x = 16, y = 0, w = 16, h = 255},
			{id = "keybeam-5-pg", src = "src-laser-5", x = 16, y = 0, w = 16, h = 255},
			{id = "keybeam-6-pg", src = "src-laser-6", x = 16, y = 0, w = 16, h = 255},
			{id = "keybeam-7-pg", src = "src-laser-7", x = 16, y = 0, w = 16, h = 255},
			{id = "keybeam-8-pg", src = "src-laser-8", x = 16, y = 0, w = 16, h = 255},
			{id = "keybeam-9-pg", src = "src-laser-9", x = 16, y = 0, w = 16, h = 255},
			
			{id = "finishcover", src = "src-finishcover", x = 0, y = 0, w = -1, h = -1},	
			
			{id = "section-line", src = "src-barline", x = 0, y = 0, w = 1, h = 1},
			
			{id = "gauge-n1", src = "src-gauge", x = 0, y = 0, w = 12, h = 35},
			{id = "gauge-n2", src = "src-gauge", x = 12, y = 0, w = 12, h = 35},
			{id = "gauge-n3", src = "src-gauge", x = 24, y = 0, w = 12, h = 35},
			{id = "gauge-n4", src = "src-gauge", x = 36, y = 0, w = 12, h = 35},
			{id = "gauge-e1", src = "src-gauge", x = 0, y = 35, w = 12, h = 35},
			{id = "gauge-e2", src = "src-gauge", x = 12, y = 35, w = 12, h = 35},
			{id = "gauge-e3", src = "src-gauge", x = 24, y = 35, w = 12, h = 35},
			{id = "gauge-e4", src = "src-gauge", x = 36, y = 35, w = 12, h = 35},
			
			{id = "judgef-pg", src = "src-judge", x = 0, y = 0, w = 180, h = 100, divy = 2, cycle = 100},
			{id = "judgef-gr", src = "src-judge", x = 0, y = 150, w = 180, h = 100, divy = 2, cycle = 100},
			{id = "judgef-gd", src = "src-judge", x = 0, y = 250, w = 180, h = 100, divy = 2, cycle = 100},
			{id = "judgef-bd", src = "src-judge", x = 0, y = 350, w = 180, h = 100, divy = 2, cycle = 100},
			{id = "judgef-pr", src = "src-judge", x = 0, y = 450, w = 180, h = 100, divy = 2, cycle = 100},
			{id = "judgef-ms", src = "src-judge", x = 0, y = 450, w = 180, h = 100, divy = 2, cycle = 100},
			
			{id = "oadx+-judgef-pg", src = "src-oadx+judge", x = 0, y = 0, w = 77, h = 105, divy = 3, cycle = 125},
			{id = "oadx+-judgef-gr", src = "src-oadx+judge", x = 0, y = 105, w = 77, h = 70, divy = 2, cycle = 75},
			{id = "oadx+-judgef-gd", src = "src-oadx+judge", x = 247, y = 0, w = 77, h = 70, divy = 2, cycle = 75},
			{id = "oadx+-judgef-bd", src = "src-oadx+judge", x = 324, y = 0, w = 77, h = 70, divy = 2, cycle = 75},
			{id = "oadx+-judgef-pr", src = "src-oadx+judge", x = 401, y = 0, w = 77, h = 70, divy = 2, cycle = 75},
			{id = "oadx+-judgef-ms", src = "src-oadx+judge", x = 401, y = 0, w = 77, h = 70, divy = 2, cycle = 75},

			{id = "judge-fast", src = "src-judgedetail", x = 0, y = 40, w = 72, h = 20},
			{id = "judge-slow", src = "src-judgedetail", x = 72, y = 40, w = 72, h = 20},

			{id = "song-progress-bg", src = "src-progress", x = 0, y = 0, w = 1, h = 1},		
			
			{id = "fc-effect", src = "src-fceffect", x = 0, y = 0, w = -1, h = -1},
			{id = "fullcombo", src = "src-fullcombo", x = 0, y = 0, w = -1, h = -1},

			{id = "character", src = "src-character", x = 0, y = 0, w = -1, h = -1},
			
			{id = "ready", src = "src-ready", x = 0, y = 0, w = -1, h = -1}
		}
		append_all(skin.image, img_bomb_key_1p(9))
		---[[ バグ対応
		if skin_config.option[op_consts.OP_0_NAME] == op_consts.OP_0_ITEM_NUMBER_2 then
			append_all(skin.image, img_notes_key_1p(9))
		else
			append_all(skin.image, img_notes_key_1p_v074(9))
		end
		--]]

		
		skin.imageset = {
			{id = "keybeam1", ref = 501, images = {"keybeam-1","keybeam-1-pg"}},
			{id = "keybeam2", ref = 502, images = {"keybeam-2","keybeam-2-pg"}},
			{id = "keybeam3", ref = 503, images = {"keybeam-3","keybeam-3-pg"}},
			{id = "keybeam4", ref = 504, images = {"keybeam-4","keybeam-4-pg"}},
			{id = "keybeam5", ref = 505, images = {"keybeam-5","keybeam-5-pg"}},
			{id = "keybeam6", ref = 506, images = {"keybeam-6","keybeam-6-pg"}},
			{id = "keybeam7", ref = 507, images = {"keybeam-7","keybeam-7-pg"}},
			{id = "keybeam8", ref = 508, images = {"keybeam-8","keybeam-8-pg"}},
			{id = "keybeam9", ref = 509, images = {"keybeam-9","keybeam-9-pg"}},
			{id = "bomb1", ref = 501, images = {"bomb-1","bomb-pg-1"}},
			{id = "bomb2", ref = 502, images = {"bomb-2","bomb-pg-2"}},
			{id = "bomb3", ref = 503, images = {"bomb-3","bomb-pg-3"}},
			{id = "bomb4", ref = 504, images = {"bomb-4","bomb-pg-4"}},
			{id = "bomb5", ref = 505, images = {"bomb-5","bomb-pg-5"}},
			{id = "bomb6", ref = 506, images = {"bomb-6","bomb-pg-6"}},
			{id = "bomb7", ref = 507, images = {"bomb-7","bomb-pg-7"}},
			{id = "bomb8", ref = 508, images = {"bomb-8","bomb-pg-8"}},
			{id = "bomb9", ref = 509, images = {"bomb-9","bomb-pg-9"}},
		}
		
		skin.value = {
			{id = "ghost-target", src = "src-judgedetail", x = 0, y = 0, w = 216, h = 40, divx = 12, divy = 2, digit = 6, align = 2, ref = 153},
			{id = "ghost-mybest", src = "src-judgedetail", x = 0, y = 0, w = 216, h = 40, divx = 12, divy = 2, digit = 6, align = 2, ref = 152},
			
			{id = "rate",			src = "src-number-s", x = 0, y = 0, w = 143, h = 17, divx = 11, digit = 3, ref = 102},
			{id = "rate-afterdot",	src = "src-number-s", x = 0, y = 51, w = 143, h = 17, divx = 11, digit = 2, align = 1, ref = 103},
			{id = "exscore",		src = "src-number-s", x = 0, y = 51, w = 130, h = 17, divx = 10, digit = 7, align = 1, ref = 101},
			
			{id = "diff-hiscore",	src = "src-number-s", x = 0, y = 51, w = 156, h = 34, divx = 12, divy = 2, digit = 7, align = 1, ref = 152},
			{id = "diff-tgtscore",	src = "src-number-s", x = 0, y = 51, w = 156, h = 34, divx = 12, divy = 2, digit = 7, align = 1, ref = 153},

			{id = "count-cb", src = "src-number-s", x = 0, y = 0, w = 143, h = 17, divx = 11, digit = 4, ref = 425},
			{id = "count-kp", src = "src-number-s", x = 0, y = 0, w = 143, h = 17, divx = 11, digit = 4, ref = 420},
			{id = "count-pr", src = "src-number-s", x = 0, y = 0, w = 143, h = 17, divx = 11, digit = 4, ref = 114},
			{id = "count-bd", src = "src-number-s", x = 0, y = 0, w = 143, h = 17, divx = 11, digit = 4, ref = 113},
			{id = "count-gd", src = "src-number-s", x = 0, y = 0, w = 143, h = 17, divx = 11, digit = 4, ref = 112},
			{id = "count-gr", src = "src-number-s", x = 0, y = 0, w = 143, h = 17, divx = 11, digit = 4, ref = 111},
			{id = "count-pg", src = "src-number-s", x = 0, y = 0, w = 143, h = 17, divx = 11, digit = 4, ref = 110},
			
			{id = "count-kp-fast", src = "src-number-s", x = 0, y = 17, w = 143, h = 17, divx = 11, digit = 4, ref = 421},
			{id = "count-pr-fast", src = "src-number-s", x = 0, y = 17, w = 143, h = 17, divx = 11, digit = 4, ref = 418},
			{id = "count-bd-fast", src = "src-number-s", x = 0, y = 17, w = 143, h = 17, divx = 11, digit = 4, ref = 416},
			{id = "count-gd-fast", src = "src-number-s", x = 0, y = 17, w = 143, h = 17, divx = 11, digit = 4, ref = 414},
			{id = "count-gr-fast", src = "src-number-s", x = 0, y = 17, w = 143, h = 17, divx = 11, digit = 4, ref = 412},
			{id = "count-pg-fast", src = "src-number-s", x = 0, y = 17, w = 143, h = 17, divx = 11, digit = 4, ref = 410},
			
			{id = "count-kp-slow", src = "src-number-s", x = 0, y = 34, w = 143, h = 17, divx = 11, digit = 4, ref = 422},
			{id = "count-pr-slow", src = "src-number-s", x = 0, y = 34, w = 143, h = 17, divx = 11, digit = 4, ref = 419},
			{id = "count-bd-slow", src = "src-number-s", x = 0, y = 34, w = 143, h = 17, divx = 11, digit = 4, ref = 417},
			{id = "count-gd-slow", src = "src-number-s", x = 0, y = 34, w = 143, h = 17, divx = 11, digit = 4, ref = 415},
			{id = "count-gr-slow", src = "src-number-s", x = 0, y = 34, w = 143, h = 17, divx = 11, digit = 4, ref = 413},
			{id = "count-pg-slow", src = "src-number-s", x = 0, y = 34, w = 143, h = 17, divx = 11, digit = 4, ref = 411},

			{id = "maxcombo", src = "src-number-s", x = 0, y = 0, w = 143, h = 17, divx = 11, digit = 4, ref = 105},

			{id = "groovegauge",			src = "src-number-m", x = 0, y = 72, w = 240, h = 24, divx = 10, digit = 3, ref = 107},
			{id = "groovegauge-afterdot",	src = "src-number-m", x = 0, y = 72, w = 264, h = 24, divx = 11, digit = 2, ref = 407},

			{id = "minbpm", src = "src-number-s", x = 0, y = 0, w = 130, h = 17, divx = 10, digit = 4, align = 2, ref = 91},
			{id = "nowbpm", src = "src-number-m", x = 0, y = 24, w = 240, h = 24, divx = 10, digit = 4, align = 2, ref = 160},
			{id = "maxbpm", src = "src-number-s", x = 0, y = 0, w = 130, h = 17, divx = 10, digit = 4, align = 2, ref = 90},

			{id = "lanecover-white",	src = "src-number-s", x = 0, y = 0, w = 130, h = 17, divx = 10, digit = 4, align = 2, ref = 14},
			{id = "liftcover-white",	src = "src-number-s", x = 0, y = 0, w = 130, h = 17, divx = 10, digit = 4, align = 2, ref = 314},
			{id = "duration-green",		src = "src-number-s", x = 0, y = 102, w = 130, h = 17, divx = 10, digit = 4, align = 2, ref = 313},
			
			{id = "judgen-pg", src = "src-judge", x = 200, y = 0, w = 360, h = 100, divx = 10, divy = 2, digit = 6, ref = 75, cycle = 100},
			{id = "judgen-gr", src = "src-judge", x = 200, y = 150, w = 360, h = 100, divx = 10, divy = 2, digit = 6, ref = 75, cycle = 100},
			{id = "judgen-gd", src = "src-judge", x = 200, y = 250, w = 360, h = 100, divx = 10, divy = 2, digit = 6, ref = 75, cycle = 100},
			{id = "judgen-bd", src = "src-judge", x = 200, y = 350, w = 360, h = 100, divx = 10, divy = 2, digit = 6, ref = 75, cycle = 100},
			{id = "judgen-pr", src = "src-judge", x = 200, y = 450, w = 360, h = 100, divx = 10, divy = 2, digit = 6, ref = 75, cycle = 100},
			{id = "judgen-ms", src = "src-judge", x = 200, y = 450, w = 360, h = 100, divx = 10, divy = 2, digit = 6, ref = 75, cycle = 100},

			{id = "oadx+-judgen-pg", src = "src-oadx+judge", x = 77, y = 0, w = 170, h = 105, divx = 10, divy = 3, digit = 6, ref = 75, cycle = 125},
			{id = "oadx+-judgen-gr", src = "src-oadx+judge", x = 77, y = 105, w = 170, h = 70, divx = 10, divy = 2, digit = 6, ref = 75, cycle = 75},
			{id = "oadx+-judgen-gd", src = "src-oadx+judge", x = 77, y = 105, w = 170, h = 70, divx = 10, divy = 2, digit = 6, ref = 75, cycle = 75},
			{id = "oadx+-judgen-bd", src = "src-oadx+judge", x = 77, y = 105, w = 170, h = 70, divx = 10, divy = 2, digit = 6, ref = 75, cycle = 75},
			{id = "oadx+-judgen-pr", src = "src-oadx+judge", x = 77, y = 105, w = 170, h = 70, divx = 10, divy = 2, digit = 6, ref = 75, cycle = 75},
			{id = "oadx+-judgen-ms", src = "src-oadx+judge", x = 77, y = 105, w = 170, h = 70, divx = 10, divy = 2, digit = 6, ref = 75, cycle = 75},
		}
		
		skin.text = {
			{id = "music-title", font = 0, size = 24, align = 1, ref = 12, overflow = 1},
			{id = "music-genre", font = 0, size = 24, align = 1, ref = 13, overflow = 1},
			{id = "music-artist", font = 0, size = 24, align = 1, ref = 16, overflow = 1},
			{id = "table", font = 0, size = 24, align = 1, ref = 1003, overflow = 1}
		}

		
		skin.slider = {
			{id = "lanecover", src = "src-lanecover", x = 0, y = 0, w = -1, h = -1, angle = 2, range = lane_height, type = 4},
			{id = "song-progress", src = "src-progress", x = 0, y = 0, w = -1, h = -1, angle = 2, range = songprogress_height - 18, type = 6}		
		}
		
		skin.hiddenCover = {{id = "hiddencover", src = "src-hiddencover", x = 0, y = 0, w = -1, h = -1, disapearLine = lane_origin_y, isDisapearLineLinkLift = true}}

		skin.liftCover = {{id = "liftcover", src = "src-liftcover", x = 0, y = 0, w = -1, h = -1, disapearLine = lane_origin_y}}	
		
		skin.graph = {
			{id = "graph-now-p",	src = "src-scoregraph", x = 8, y = 8, w = 1, h = 1, type = 111},
			{id = "graph-now",		src = "src-scoregraph", x = 0, y = 0, w = 1, h = 1, type = 110},
			{id = "graph-best-f",	src = "src-scoregraph", x = 8, y = 8, w = 1, h = 1, type = 113},
			{id = "graph-best",		src = "src-scoregraph", x = 8, y = 0, w = 1, h = 1, type = 112},
			{id = "graph-target-f",	src = "src-scoregraph", x = 8, y = 8, w = 1, h = 1, type = 115},
			{id = "graph-target",	src = "src-scoregraph", x = 0, y = 8, w = 1, h = 1, type = 114},
			{id = "load-progress",	src = "src-judgeline", x = 0, y = 0, w = -1, h = -1, angle = 0, type = 102}
		}
		
		skin.note = {
			id = "notes",
			note =			{"note-1","note-2","note-3","note-4","note-5","note-6","note-7","note-8","note-9"},
			lnend =			{"lne-1","lne-2","lne-3","lne-4","lne-5","lne-6","lne-7","lne-8","lne-9"},
			lnstart =		{"lns-1","lns-2","lns-3","lns-4","lns-5","lns-6","lns-7","lns-8","lns-9"},
			lnbody =		{"lnb-1","lnb-2","lnb-3","lnb-4","lnb-5","lnb-6","lnb-7","lnb-8","lnb-9"},
			lnactive =		{"lna-1","lna-2","lna-3","lna-4","lna-5","lna-6","lna-7","lna-8","lna-9"},
			hcnend =		{"hcne-1","hcne-2","hcne-3","hcne-4","hcne-5","hcne-6","hcne-7","hcne-8","hcne-9"},
			hcnstart =		{"hcns-1","hcns-2","hcns-3","hcns-4","hcns-5","hcns-6","hcns-7","hcns-8","hcns-9"},
			hcnbody =		{"hcnb-1","hcnb-2","hcnb-3","hcnb-4","hcnb-5","hcnb-6","hcnb-7","hcnb-8","hcnb-9"},
			hcnactive =		{"hcna-1","hcna-2","hcna-3","hcna-4","hcna-5","hcna-6","hcna-7","hcna-8","hcna-9"},
			hcndamage =		{"hcnd-1","hcnd-2","hcnd-3","hcnd-4","hcnd-5","hcnd-6","hcnd-7","hcnd-8","hcnd-9"},
			hcnreactive =	{"hcnr-1","hcnr-2","hcnr-3","hcnr-4","hcnr-5","hcnr-6","hcnr-7","hcnr-8","hcnr-9"},
			mine =			{"mine-1","mine-2","mine-3","mine-4","mine-5","mine-6","mine-7","mine-8","mine-9"},
			hidden = {},
			processed = {},
			size = note_height,
			dst = {
				{x = note_x[1], y = lane_origin_y, w = note_width[1], h = lane_height},
				{x = note_x[2], y = lane_origin_y, w = note_width[2], h = lane_height},
				{x = note_x[3], y = lane_origin_y, w = note_width[3], h = lane_height},
				{x = note_x[4], y = lane_origin_y, w = note_width[4], h = lane_height},
				{x = note_x[5], y = lane_origin_y, w = note_width[5], h = lane_height},
				{x = note_x[6], y = lane_origin_y, w = note_width[6], h = lane_height},
				{x = note_x[7], y = lane_origin_y, w = note_width[7], h = lane_height},
				{x = note_x[8], y = lane_origin_y, w = note_width[8], h = lane_height},
				{x = note_x[9], y = lane_origin_y, w = note_width[9], h = lane_height}
			},
			group =	{{id = "section-line", offset = 3, dst = {{x = lane_origin_x, y = lane_origin_y, w = lane_width_total, h = 1, r = 128, g = 128, b = 128, a = 255 + barline_opacity}}}},
			time =	{{id = "section-line", offset = 3, dst = {{x = lane_origin_x, y = lane_origin_y, w = lane_width_total, h = 1, r = 64, g = 192, b = 192, a = 255 + barline_opacity}}}},
			bpm =	{{id = "section-line", offset = 3, dst = {{x = lane_origin_x, y = lane_origin_y, w = lane_width_total, h = 2, r = 0, g = 192, b = 0, a = 255 + barline_opacity}}}},
			stop =	{{id = "section-line", offset = 3, dst = {{x = lane_origin_x, y = lane_origin_y, w = lane_width_total, h = 2, r = 192, g = 192, b = 0, a = 255 + barline_opacity}}}}
		}
		
		skin.gauge = {
			id = "gauge",
			nodes = {"gauge-n1","gauge-n2","gauge-n3","gauge-n4","gauge-e1","gauge-e2","gauge-e3","gauge-e4"},
			parts = gauge_scale
		}
		if skin_config.option[op_consts.OP_6_NAME] == op_consts.OP_6_ITEM_NUMBER_1 then
			skin.judge = {
				{
					id = "judge1",
					index = 0,
					images = {
						{id = "judgef-pg", loop = -1, timer = 46 ,offsets = {3,32}, dst = {{time = 0, x = judge1_x, y = judge_y, w = 180, h = 50},{time = 500}}},
						{id = "judgef-gr", loop = -1, timer = 46 ,offsets = {3,32}, dst = {{time = 0, x = judge1_x, y = judge_y, w = 180, h = 50},{time = 500}}},
						{id = "judgef-gd", loop = -1, timer = 46 ,offsets = {3,32}, dst = {{time = 0, x = judge1_x, y = judge_y, w = 180, h = 50},{time = 500}}},
						{id = "judgef-bd", loop = -1, timer = 46 ,offsets = {3,32}, dst = {{time = 0, x = judge1_x, y = judge_y, w = 180, h = 50},{time = 500}}},
						{id = "judgef-pr", loop = -1, timer = 46 ,offsets = {3,32}, dst = {{time = 0, x = judge1_x, y = judge_y, w = 180, h = 50},{time = 500}}},
						{id = "judgef-ms", loop = -1, timer = 46 ,offsets = {3,32}, dst = {{time = 0, x = judge1_x, y = judge_y, w = 180, h = 50},{time = 500}}}
					},
					numbers = {
						{id = "judgen-pg", loop = -1, timer = 446, dst = {{time = 0, x = judgen_x, y = -60, w = 36, h = 50},{time = 500}}},
						{id = "judgen-gr", loop = -1, timer = 446, dst = {{time = 0, x = judgen_x, y = -60, w = 36, h = 50},{time = 500}}},
						{id = "judgen-gd", loop = -1, timer = 446, dst = {{time = 0, x = judgen_x, y = -60, w = 36, h = 50},{time = 500}}},
						{id = "judgen-bd", loop = -1, timer = 446, dst = {{time = 0, x = judgen_x, y = -60, w = 36, h = 50},{time = 500}}},
						{id = "judgen-pr", loop = -1, timer = 446, dst = {{time = 0, x = judgen_x, y = -60, w = 36, h = 50},{time = 500}}},
						{id = "judgen-ms", loop = -1, timer = 446, dst = {{time = 0, x = judgen_x, y = -60, w = 36, h = 50},{time = 500}}}
					},
					shift = false
				},
				{
					id = "judge2",
					index = 1,
					images = {
						{id = "judgef-pg", loop = -1, timer = 47 ,offsets = {3,32}, dst = {{time = 0, x = judge2_x, y = judge_y, w = 180, h = 50},{time = 500}}},
						{id = "judgef-gr", loop = -1, timer = 47 ,offsets = {3,32}, dst = {{time = 0, x = judge2_x, y = judge_y, w = 180, h = 50},{time = 500}}},
						{id = "judgef-gd", loop = -1, timer = 47 ,offsets = {3,32}, dst = {{time = 0, x = judge2_x, y = judge_y, w = 180, h = 50},{time = 500}}},
						{id = "judgef-bd", loop = -1, timer = 47 ,offsets = {3,32}, dst = {{time = 0, x = judge2_x, y = judge_y, w = 180, h = 50},{time = 500}}},
						{id = "judgef-pr", loop = -1, timer = 47 ,offsets = {3,32}, dst = {{time = 0, x = judge2_x, y = judge_y, w = 180, h = 50},{time = 500}}},
						{id = "judgef-ms", loop = -1, timer = 47 ,offsets = {3,32}, dst = {{time = 0, x = judge2_x, y = judge_y, w = 180, h = 50},{time = 500}}}
					},
					numbers = {
						{id = "judgen-pg", loop = -1, timer = 447, dst = {{time = 0, x = judgen_x, y = -60, w = 36, h = 50},{time = 500}}},
						{id = "judgen-gr", loop = -1, timer = 447, dst = {{time = 0, x = judgen_x, y = -60, w = 36, h = 50},{time = 500}}},
						{id = "judgen-gd", loop = -1, timer = 447, dst = {{time = 0, x = judgen_x, y = -60, w = 36, h = 50},{time = 500}}},
						{id = "judgen-bd", loop = -1, timer = 447, dst = {{time = 0, x = judgen_x, y = -60, w = 36, h = 50},{time = 500}}},
						{id = "judgen-pr", loop = -1, timer = 447, dst = {{time = 0, x = judgen_x, y = -60, w = 36, h = 50},{time = 500}}},
						{id = "judgen-ms", loop = -1, timer = 447, dst = {{time = 0, x = judgen_x, y = -60, w = 36, h = 50},{time = 500}}}
					},
					shift = false
				},
				{
					id = "judge3",
					index = 2,
					images = {
						{id = "judgef-pg", loop = -1, timer = 247 ,offsets = {3,32}, dst = {{time = 0, x = judge3_x, y = judge_y, w = 180, h = 50},{time = 500}}},
						{id = "judgef-gr", loop = -1, timer = 247 ,offsets = {3,32}, dst = {{time = 0, x = judge3_x, y = judge_y, w = 180, h = 50},{time = 500}}},
						{id = "judgef-gd", loop = -1, timer = 247 ,offsets = {3,32}, dst = {{time = 0, x = judge3_x, y = judge_y, w = 180, h = 50},{time = 500}}},
						{id = "judgef-bd", loop = -1, timer = 247 ,offsets = {3,32}, dst = {{time = 0, x = judge3_x, y = judge_y, w = 180, h = 50},{time = 500}}},
						{id = "judgef-pr", loop = -1, timer = 247 ,offsets = {3,32}, dst = {{time = 0, x = judge3_x, y = judge_y, w = 180, h = 50},{time = 500}}},
						{id = "judgef-ms", loop = -1, timer = 247 ,offsets = {3,32}, dst = {{time = 0, x = judge3_x, y = judge_y, w = 180, h = 50},{time = 500}}}
					},
					numbers = {
						{id = "judgen-pg", loop = -1, timer = 448, dst = {{time = 0, x = judgen_x, y = -60, w = 36, h = 50},{time = 500}}},
						{id = "judgen-gr", loop = -1, timer = 448, dst = {{time = 0, x = judgen_x, y = -60, w = 36, h = 50},{time = 500}}},
						{id = "judgen-gd", loop = -1, timer = 448, dst = {{time = 0, x = judgen_x, y = -60, w = 36, h = 50},{time = 500}}},
						{id = "judgen-bd", loop = -1, timer = 448, dst = {{time = 0, x = judgen_x, y = -60, w = 36, h = 50},{time = 500}}},
						{id = "judgen-pr", loop = -1, timer = 448, dst = {{time = 0, x = judgen_x, y = -60, w = 36, h = 50},{time = 500}}},
						{id = "judgen-ms", loop = -1, timer = 448, dst = {{time = 0, x = judgen_x, y = -60, w = 36, h = 50},{time = 500}}}
					},
					shift = false
				}		
			}
		else
			skin.judge = {
				{
					id = "judge1",
					index = 0,
					images = {
						{id = "oadx+-judgef-pg", loop = -1, timer = 46 ,offsets = {3,32}, dst = {{time = 0, x = judge1_x, y = judge_y, w = oadx_judge_w, h = oadx_judge_h},{time = 500}}},
						{id = "oadx+-judgef-gr", loop = -1, timer = 46 ,offsets = {3,32}, dst = {{time = 0, x = judge1_x, y = judge_y, w = oadx_judge_w, h = oadx_judge_h},{time = 500}}},
						{id = "oadx+-judgef-gd", loop = -1, timer = 46 ,offsets = {3,32}, dst = {{time = 0, x = judge1_x - 22, y = judge_y, w = oadx_judge_w, h = oadx_judge_h},{time = 500}}},
						{id = "oadx+-judgef-bd", loop = -1, timer = 46 ,offsets = {3,32}, dst = {{time = 0, x = judge1_x - 45, y = judge_y, w = oadx_judge_w, h = oadx_judge_h},{time = 500}}},
						{id = "oadx+-judgef-pr", loop = -1, timer = 46 ,offsets = {3,32}, dst = {{time = 0, x = judge1_x - 22, y = judge_y, w = oadx_judge_w, h = oadx_judge_h},{time = 500}}},
						{id = "oadx+-judgef-ms", loop = -1, timer = 46 ,offsets = {3,32}, dst = {{time = 0, x = judge1_x - 22, y = judge_y, w = oadx_judge_w, h = oadx_judge_h},{time = 500}}}
					},
					numbers = {
						{id = "oadx+-judgen-pg", loop = -1, timer = 446, dst = {{time = 0, x = judgen_x, y = -85, w = oadx_judgen_w, h = oadx_judge_h},{time = 500}}},
						{id = "oadx+-judgen-gr", loop = -1, timer = 446, dst = {{time = 0, x = judgen_x, y = -85, w = oadx_judgen_w, h = oadx_judge_h},{time = 500}}},
						{id = "oadx+-judgen-gd", loop = -1, timer = 446, dst = {{time = 0, x = judgen_x + 22, y = -85, w = oadx_judgen_w, h = oadx_judge_h},{time = 500}}},
						{id = "oadx+-judgen-bd", loop = -1, timer = 446, dst = {{time = 0, x = judgen_x + 45, y = -85, w = oadx_judgen_w, h = oadx_judge_h},{time = 500}}},
						{id = "oadx+-judgen-pr", loop = -1, timer = 446, dst = {{time = 0, x = judgen_x + 22, y = -85, w = oadx_judgen_w, h = oadx_judge_h},{time = 500}}},
						{id = "oadx+-judgen-ms", loop = -1, timer = 446, dst = {{time = 0, x = judgen_x + 22, y = -85, w = oadx_judgen_w, h = oadx_judge_h},{time = 500}}}
					},
					shift = false
				},
				{
					id = "judge2",
					index = 1,
					images = {
						{id = "oadx+-judgef-pg", loop = -1, timer = 47 ,offsets = {3,32}, dst = {{time = 0, x = judge2_x, y = judge_y, w = oadx_judge_w, h = oadx_judge_h},{time = 500}}},
						{id = "oadx+-judgef-gr", loop = -1, timer = 47 ,offsets = {3,32}, dst = {{time = 0, x = judge2_x, y = judge_y, w = oadx_judge_w, h = oadx_judge_h},{time = 500}}},
						{id = "oadx+-judgef-gd", loop = -1, timer = 47 ,offsets = {3,32}, dst = {{time = 0, x = judge2_x - 22, y = judge_y, w = oadx_judge_w, h = oadx_judge_h},{time = 500}}},
						{id = "oadx+-judgef-bd", loop = -1, timer = 47 ,offsets = {3,32}, dst = {{time = 0, x = judge2_x - 45, y = judge_y, w = oadx_judge_w, h = oadx_judge_h},{time = 500}}},
						{id = "oadx+-judgef-pr", loop = -1, timer = 47 ,offsets = {3,32}, dst = {{time = 0, x = judge2_x - 22, y = judge_y, w = oadx_judge_w, h = oadx_judge_h},{time = 500}}},
						{id = "oadx+-judgef-ms", loop = -1, timer = 47 ,offsets = {3,32}, dst = {{time = 0, x = judge2_x - 22, y = judge_y, w = oadx_judge_w, h = oadx_judge_h},{time = 500}}}
					},
					numbers = {
						{id = "oadx+-judgen-pg", loop = -1, timer = 447, dst = {{time = 0, x = judgen_x, y = -85, w = oadx_judgen_w, h = oadx_judge_h},{time = 500}}},
						{id = "oadx+-judgen-gr", loop = -1, timer = 447, dst = {{time = 0, x = judgen_x, y = -85, w = oadx_judgen_w, h = oadx_judge_h},{time = 500}}},
						{id = "oadx+-judgen-gd", loop = -1, timer = 447, dst = {{time = 0, x = judgen_x + 22, y = -85, w = oadx_judgen_w, h = oadx_judge_h},{time = 500}}},
						{id = "oadx+-judgen-bd", loop = -1, timer = 447, dst = {{time = 0, x = judgen_x + 42, y = -85, w = oadx_judgen_w, h = oadx_judge_h},{time = 500}}},
						{id = "oadx+-judgen-pr", loop = -1, timer = 447, dst = {{time = 0, x = judgen_x + 22, y = -85, w = oadx_judgen_w, h = oadx_judge_h},{time = 500}}},
						{id = "oadx+-judgen-ms", loop = -1, timer = 447, dst = {{time = 0, x = judgen_x + 22, y = -85, w = oadx_judgen_w, h = oadx_judge_h},{time = 500}}}
					},
					shift = false
				},
				{
					id = "judge3",
					index = 2,
					images = {
						{id = "oadx+-judgef-pg", loop = -1, timer = 247 ,offsets = {3,32}, dst = {{time = 0, x = judge3_x, y = judge_y, w = oadx_judge_w, h = oadx_judge_h},{time = 500}}},
						{id = "oadx+-judgef-gr", loop = -1, timer = 247 ,offsets = {3,32}, dst = {{time = 0, x = judge3_x, y = judge_y, w = oadx_judge_w, h = oadx_judge_h},{time = 500}}},
						{id = "oadx+-judgef-gd", loop = -1, timer = 247 ,offsets = {3,32}, dst = {{time = 0, x = judge3_x - 22, y = judge_y, w = oadx_judge_w, h = oadx_judge_h},{time = 500}}},
						{id = "oadx+-judgef-bd", loop = -1, timer = 247 ,offsets = {3,32}, dst = {{time = 0, x = judge3_x - 45, y = judge_y, w = oadx_judge_w, h = oadx_judge_h},{time = 500}}},
						{id = "oadx+-judgef-pr", loop = -1, timer = 247 ,offsets = {3,32}, dst = {{time = 0, x = judge3_x - 22, y = judge_y, w = oadx_judge_w, h = oadx_judge_h},{time = 500}}},
						{id = "oadx+-judgef-ms", loop = -1, timer = 247 ,offsets = {3,32}, dst = {{time = 0, x = judge3_x - 22, y = judge_y, w = oadx_judge_w, h = oadx_judge_h},{time = 500}}}
					},
					numbers = {
						{id = "oadx+-judgen-pg", loop = -1, timer = 448, dst = {{time = 0, x = judgen_x, y = -85, w = oadx_judgen_w, h = oadx_judge_h},{time = 500}}},
						{id = "oadx+-judgen-gr", loop = -1, timer = 448, dst = {{time = 0, x = judgen_x, y = -85, w = oadx_judgen_w, h = oadx_judge_h},{time = 500}}},
						{id = "oadx+-judgen-gd", loop = -1, timer = 448, dst = {{time = 0, x = judgen_x + 22, y = -85, w = oadx_judgen_w, h = oadx_judge_h},{time = 500}}},
						{id = "oadx+-judgen-bd", loop = -1, timer = 448, dst = {{time = 0, x = judgen_x + 45, y = -85, w = oadx_judgen_w, h = oadx_judge_h},{time = 500}}},
						{id = "oadx+-judgen-pr", loop = -1, timer = 448, dst = {{time = 0, x = judgen_x + 22, y = -85, w = oadx_judgen_w, h = oadx_judge_h},{time = 500}}},
						{id = "oadx+-judgen-ms", loop = -1, timer = 448, dst = {{time = 0, x = judgen_x + 22, y = -85, w = oadx_judgen_w, h = oadx_judge_h},{time = 500}}}
					},
					shift = false
				}		
			}
		end

		skin.bga = {id = "bga"}
		
		skin.pmchara = {
			{id = "dst-pomyuchara", src = "src-pomyuchara", color = 1, type = 0, side = 1},
			{id = "dst-pomyuchara-bg", src = "src-pomyuchara", color = 1, type = 1},
			{id = "dst-pomyuchara-name", src = "src-pomyuchara", color = 1, type = 2, side = 1}
		}

		skin.destination = {
			{id = -110, dst = {{x = 0, y = 0, w = 1920, h = 1080}}},
			{id = "background", stretch = 3, dst = {{x = 0, y = 0, w = 1920, h = 1080, a = 255 + background_opacity}}},
			
			{id = -110, op = {op_consts.DISP_12_NUMBER_3}, dst = {{x = 0, y = 0, w = 1920, h = 1080}}},
			{id = "bga", op = {op_consts.DISP_12_NUMBER_3}, stretch = 3, dst = {{x = 0, y = 0, w = 1920, h = 1080, a = 255 + bga_opacity}}},
			{id = "no-bga-image", timer = 41, op = {170,op_consts.DISP_12_NUMBER_3}, stretch = 3, dst = {{x = 0, y = 0, w = 1920, h = 1080, a = 255 + bga_opacity}}},
			
			{id = -110, op = {op_consts.DISP_12_NUMBER_2}, dst = {{x = bga_x, y = bga1_y, w = bga_width, h = bga_height}}},
			{id = "bga", op = {op_consts.DISP_12_NUMBER_2}, stretch = 1, dst = {{x = bga_x, y = bga1_y, w = bga_width, h = bga_height, a = 255 + bga_opacity}}},
			{id = -110, op = {op_consts.DISP_12_NUMBER_2}, dst = {{x = bga_x, y = bga2_y, w = bga_width, h = bga_height}}},
			{id = "bga", op = {op_consts.DISP_12_NUMBER_2}, stretch = 1, dst = {{x = bga_x, y = bga2_y, w = bga_width, h = bga_height, a = 255 + bga_opacity}}},
			{id = -110, op = {op_consts.DISP_12_NUMBER_2}, dst = {{x = bga_x, y = bga3_y, w = bga_width, h = bga_height}}},
			{id = "bga", op = {op_consts.DISP_12_NUMBER_2}, stretch = 1, dst = {{x = bga_x, y = bga3_y, w = bga_width, h = bga_height, a = 255 + bga_opacity}}},
			{id = -110, op = {op_consts.DISP_12_NUMBER_2}, dst = {{x = bga_x, y = bga4_y, w = bga_width, h = bga_height}}},
			{id = "bga", op = {op_consts.DISP_12_NUMBER_2}, stretch = 1, dst = {{x = bga_x, y = bga4_y, w = bga_width, h = bga_height, a = 255 + bga_opacity}}},
			{id = "no-bga-image", timer = 41, op = {170,op_consts.DISP_12_NUMBER_2}, stretch = 1, dst = {{x = bga_x, y = bga1_y, w = bga_width, h = bga_height, a = 255 + bga_opacity}}},
			{id = "no-bga-image", timer = 41, op = {170,op_consts.DISP_12_NUMBER_2}, stretch = 1, dst = {{x = bga_x, y = bga2_y, w = bga_width, h = bga_height, a = 255 + bga_opacity}}},
			{id = "no-bga-image", timer = 41, op = {170,op_consts.DISP_12_NUMBER_2}, stretch = 1, dst = {{x = bga_x, y = bga3_y, w = bga_width, h = bga_height, a = 255 + bga_opacity}}},
			{id = "no-bga-image", timer = 41, op = {170,op_consts.DISP_12_NUMBER_2}, stretch = 1, dst = {{x = bga_x, y = bga4_y, w = bga_width, h = bga_height, a = 255 + bga_opacity}}},
			
			{id = -110, op = {op_consts.DISP_11_NUMBER_2}, dst = {{x = title_x - (title_width / 2), y = title_y - 5, w = title_width, h = 40, a = 64}}},
			{id = "music-title", loop = 0, op = {op_consts.DISP_11_NUMBER_2},	dst = {{time = 0, x = title_x, y = title_y, w = title_width, h = 24, a = 0},				{time = 100, a = 255},	{time = 1900},{time = 2000, a = 0},{time = 8000}}},
			{id = "music-genre", loop = 0, op = {op_consts.DISP_11_NUMBER_2},	dst = {{time = 0, x = title_x, y = title_y, w = title_width, h = 24, a = 0},{time = 2000},{time = 2100, a = 255},	{time = 3900},{time = 4000, a = 0},{time = 8000}}},
			{id = "music-artist", loop = 0, op = {op_consts.DISP_11_NUMBER_2},	dst = {{time = 0, x = title_x, y = title_y, w = title_width, h = 24, a = 0},{time = 4000},{time = 4100, a = 255},	{time = 5900},{time = 6000, a = 0},{time = 8000}}},
			{id = "table", loop = 0, op = {op_consts.DISP_11_NUMBER_2},		dst = {{time = 0, x = title_x, y = title_y, w = title_width, h = 24, a = 0},{time = 6000},{time = 6100, a = 255},	{time = 7900},{time = 8000, a = 0}}},
			
			{id = "gauge", op = {op_consts.DISP_9_NUMBER_2},				dst = {{x = gauge_x, y = gauge_y, w = gauge_width, h = gauge_height}}},
			{id = "groovegauge", op = {op_consts.DISP_9_NUMBER_2},			dst = {{x = gauge_x + gauge_width - 131, y = gauge_y + 45, w = 24, h = 24}}},
			{id = "dot", op = {op_consts.DISP_9_NUMBER_2},					dst = {{x = gauge_x + gauge_width - 56, y = gauge_y + 45, w = 5, h = 5}}},
			{id = "groovegauge-afterdot", op = {op_consts.DISP_9_NUMBER_2},	dst = {{x = gauge_x + gauge_width - 48, y = gauge_y + 45, w = 24, h = 24}}},
			
			{id = "bpm-s", op = {op_consts.DISP_10_NUMBER_2},	dst = {{x = bpm_x + 132, y = bpm_y + 30, w = 39, h = 17}}},
			{id = "nowbpm", op = {op_consts.DISP_10_NUMBER_2},	dst = {{x = bpm_x + 104, y = bpm_y, w = 24, h = 24}}},

			{id = "bpm-s", op = {op_consts.DISP_10_NUMBER_3},	dst = {{x = bpm_x + 81, y = bpm_y + 30, w = 39, h = 17}}},
			{id = "minbpm", op = {op_consts.DISP_10_NUMBER_3},	dst = {{x = bpm_x, y = bpm_y, w = 13, h = 17}}},
			{id = "nowbpm", op = {op_consts.DISP_10_NUMBER_3},	dst = {{x = bpm_x + 52, y = bpm_y, w = 24, h = 24}}},
			{id = "maxbpm", op = {op_consts.DISP_10_NUMBER_3},	dst = {{x = bpm_x + 148, y = bpm_y, w = 13, h = 17}}},

			{id = "scoregraph-frame", op = {op_consts.DISP_3_NUMBER_2},		dst = {{x = graph_x, y = graph_y, w = 221, h = 708}}},
			{id = "graph-now-p", op = {op_consts.DISP_3_NUMBER_2},			dst = {{x = graph_x + 45, y = graph_y + 3, w = 40, h = 702}}},
			{id = "graph-now", op = {op_consts.DISP_3_NUMBER_2},			dst = {{x = graph_x + 45, y = graph_y + 3, w = 40, h = 702}}},
			{id = "graph-best-f", op = {op_consts.DISP_3_NUMBER_2},			dst = {{x = graph_x + 110, y = graph_y + 3, w = 40, h = 702}}},
			{id = "graph-best", op = {op_consts.DISP_3_NUMBER_2},			dst = {{x = graph_x + 110, y = graph_y + 3, w = 40, h = 702}}},
			{id = "graph-target-f", op = {op_consts.DISP_3_NUMBER_2},		dst = {{x = graph_x + 175, y = graph_y + 3, w = 40, h = 702}}},
			{id = "graph-target", op = {op_consts.DISP_3_NUMBER_2},			dst = {{x = graph_x + 175, y = graph_y + 3, w = 40, h = 702}}},
			{id = "scoregraph-line", op = {222,op_consts.DISP_3_NUMBER_2},	dst = {{x = graph_x + 11, y = graph_y + 470, w = 209, h = 1}}},
			{id = "scoregraph-line", op = {221,op_consts.DISP_3_NUMBER_2},	dst = {{x = graph_x + 21, y = graph_y + 548, w = 199, h = 1}}},
			{id = "scoregraph-line", op = {220,op_consts.DISP_3_NUMBER_2},	dst = {{x = graph_x + 31, y = graph_y + 626, w = 189, h = 1}}},

			{id = -110, op = {op_consts.DISP_14_NUMBER_2},	dst = {{x = pmc_x, y = pmc_y, w = pmc_w, h = pmc_h, a = 64}}},
			{id = "character", op = {op_consts.DISP_14_NUMBER_2}, stretch = 3,	dst = {{x = pmc_x, y = pmc_y, w = pmc_w, h = pmc_h}}},
			{id = "pomyu-frame-image", op = {op_consts.DISP_14_NUMBER_2}, 		dst = {{x = pmc_x, y = pmc_frame_image_y, w = pmc_w, h = 10}}},			
			{id = "pomyu-frame-line", op = {op_consts.DISP_14_NUMBER_2}, 		dst = {{x = pmc_x, y = pmc_line_image_y, w = pmc_w, h = 3}}},			

			{id = "exscore-s", op = {op_consts.DISP_4_NUMBER_2},	dst = {{x = exscore_x, y = exscore_y, w = 78, h = 17}}},
			{id = "exscore", op = {op_consts.DISP_4_NUMBER_2},	dst = {{x = exscore_x + 78, y = exscore_y, w = 13, h = 17}}},

			{id = "diffscore-s", op = {op_consts.DISP_5_NUMBER_2},		dst = {{x = diffscore_x, y = diffscore_y, w = 65, h = 36}}},
			{id = "diff-hiscore", op = {op_consts.DISP_5_NUMBER_2},		dst = {{x = diffscore_x + 65, y = diffscore_y, w = 13, h = 17}}},
			{id = "diff-tgtscore", op = {op_consts.DISP_5_NUMBER_2},	dst = {{x = diffscore_x + 65, y = diffscore_y + 19, w = 13, h = 17}}},
			
			{id = "rate-s", op = {op_consts.DISP_6_NUMBER_2},			dst = {{x = rate_x, y = rate_y, w = 65, h = 17}}},
			{id = "rate", op = {op_consts.DISP_6_NUMBER_2},				dst = {{x = rate_x + 65, y = rate_y, w = 13, h = 17}}},
			{id = "dot", op = {op_consts.DISP_6_NUMBER_2},				dst = {{x = rate_x + 104, y = rate_y, w = 5, h = 5}}},
			{id = "rate-afterdot", op = {op_consts.DISP_6_NUMBER_2},	dst = {{x = rate_x + 109, y = rate_y, w = 13, h = 17}}},
			
			{id = "judgecount-s", op = {op_consts.DISP_7_NUMBER_2},	dst = {{x = judgecount_x, y = judgecount_y, w = 39, h = 131}}},
			{id = "count-cb", op = {op_consts.DISP_7_NUMBER_2},		dst = {{x = judgecount_x + 39, y = judgecount_y, w = 13, h = 17}}},
			{id = "count-kp", op = {op_consts.DISP_7_NUMBER_2},		dst = {{x = judgecount_x + 39, y = judgecount_y + 19, w = 13, h = 17}}},
			{id = "count-pr", op = {op_consts.DISP_7_NUMBER_2},		dst = {{x = judgecount_x + 39, y = judgecount_y + 38, w = 13, h = 17}}},
			{id = "count-bd", op = {op_consts.DISP_7_NUMBER_2},		dst = {{x = judgecount_x + 39, y = judgecount_y + 57, w = 13, h = 17}}},
			{id = "count-gd", op = {op_consts.DISP_7_NUMBER_2},		dst = {{x = judgecount_x + 39, y = judgecount_y + 76, w = 13, h = 17}}},
			{id = "count-gr", op = {op_consts.DISP_7_NUMBER_2},		dst = {{x = judgecount_x + 39, y = judgecount_y + 95, w = 13, h = 17}}},
			{id = "count-pg", op = {op_consts.DISP_7_NUMBER_2},		dst = {{x = judgecount_x + 39, y = judgecount_y + 114, w = 13, h = 17}}},

			{id = "judgecount-s", op = {op_consts.DISP_7_NUMBER_3},		dst = {{x = judgecount_x, y = judgecount_y, w = 39, h = 131}}},
			{id = "count-cb", op = {op_consts.DISP_7_NUMBER_3},			dst = {{x = judgecount_x + 39, y = judgecount_y, w = 13, h = 17}}},
			{id = "count-kp", op = {op_consts.DISP_7_NUMBER_3},			dst = {{x = judgecount_x + 39, y = judgecount_y + 19, w = 13, h = 17}}},
			{id = "count-pr", op = {op_consts.DISP_7_NUMBER_3},			dst = {{x = judgecount_x + 39, y = judgecount_y + 38, w = 13, h = 17}}},
			{id = "count-bd", op = {op_consts.DISP_7_NUMBER_3},			dst = {{x = judgecount_x + 39, y = judgecount_y + 57, w = 13, h = 17}}},
			{id = "count-gd", op = {op_consts.DISP_7_NUMBER_3},			dst = {{x = judgecount_x + 39, y = judgecount_y + 76, w = 13, h = 17}}},
			{id = "count-gr", op = {op_consts.DISP_7_NUMBER_3},			dst = {{x = judgecount_x + 39, y = judgecount_y + 95, w = 13, h = 17}}},
			{id = "count-pg", op = {op_consts.DISP_7_NUMBER_3},			dst = {{x = judgecount_x + 39, y = judgecount_y + 114, w = 13, h = 17}}},
			{id = "count-kp-fast", op = {op_consts.DISP_7_NUMBER_3},	dst = {{x = judgecount_x + 104, y = judgecount_y + 19, w = 13, h = 17}}},
			{id = "count-pr-fast", op = {op_consts.DISP_7_NUMBER_3},	dst = {{x = judgecount_x + 104, y = judgecount_y + 38, w = 13, h = 17}}},
			{id = "count-bd-fast", op = {op_consts.DISP_7_NUMBER_3},	dst = {{x = judgecount_x + 104, y = judgecount_y + 57, w = 13, h = 17}}},
			{id = "count-gd-fast", op = {op_consts.DISP_7_NUMBER_3},	dst = {{x = judgecount_x + 104, y = judgecount_y + 76, w = 13, h = 17}}},
			{id = "count-gr-fast", op = {op_consts.DISP_7_NUMBER_3},	dst = {{x = judgecount_x + 104, y = judgecount_y + 95, w = 13, h = 17}}},
			{id = "count-pg-fast", op = {op_consts.DISP_7_NUMBER_3},	dst = {{x = judgecount_x + 104, y = judgecount_y + 114, w = 13, h = 17}}},
			{id = "count-kp-slow", op = {op_consts.DISP_7_NUMBER_3},	dst = {{x = judgecount_x + 169, y = judgecount_y + 19, w = 13, h = 17}}},
			{id = "count-pr-slow", op = {op_consts.DISP_7_NUMBER_3},	dst = {{x = judgecount_x + 169, y = judgecount_y + 38, w = 13, h = 17}}},
			{id = "count-bd-slow", op = {op_consts.DISP_7_NUMBER_3},	dst = {{x = judgecount_x + 169, y = judgecount_y + 57, w = 13, h = 17}}},
			{id = "count-gd-slow", op = {op_consts.DISP_7_NUMBER_3},	dst = {{x = judgecount_x + 169, y = judgecount_y + 76, w = 13, h = 17}}},
			{id = "count-gr-slow", op = {op_consts.DISP_7_NUMBER_3},	dst = {{x = judgecount_x + 169, y = judgecount_y + 95, w = 13, h = 17}}},
			{id = "count-pg-slow", op = {op_consts.DISP_7_NUMBER_3},	dst = {{x = judgecount_x + 169, y = judgecount_y + 114, w = 13, h = 17}}},

			{id = "maxcombo-s", op = {op_consts.DISP_8_NUMBER_2},	dst = {{x = maxcombo_x, y = maxcombo_y, w = 78, h = 17}}},
			{id = "maxcombo", op = {op_consts.DISP_8_NUMBER_2},	dst = {{x = maxcombo_x + 78, y = maxcombo_y, w = 13, h = 17}}},
		}
		
		-- ぽみゅキャラにオプション等が効かないので分けています
		local dst_pmc = {}
		if skin_config.option[op_consts.DISP_14_NAME] == op_consts.DISP_14_NUMBER_3 then 
			table.insert(dst_pmc, {id = -110, 					dst = {{x = pmc_x, y = pmc_y, w = pmc_w, h = pmc_h, a = 64}}})
		elseif skin_config.option[op_consts.DISP_14_NAME] == op_consts.DISP_14_NUMBER_4 then 
			table.insert(dst_pmc, {id = "dst-pomyuchara-bg", 		dst = {{x = pmc_x, y = pmc_y, w = pmc_w, h = pmc_h}}})
		end
		table.insert(dst_pmc, {id = "dst-pomyuchara",			dst = {{x = pmc_x, y = pmc_y, w = pmc_w, h = pmc_h}}})	
		table.insert(dst_pmc, {id = "pomyu-frame-image", 		dst = {{x = pmc_x, y = pmc_frame_image_y, w = pmc_w, h = 10}}})
		table.insert(dst_pmc, {id = "pomyu-frame-line", 		dst = {{x = pmc_x, y = pmc_line_image_y, w = pmc_w, h = 3}}})
		table.insert(dst_pmc, {id = -110,						dst = {{x = pmc_x, y = pmc_name_area_y, w = pmc_w, h = pmc_name_area_h, a = 64}}})
		table.insert(dst_pmc, {id = "dst-pomyuchara-name",	dst = {{x =  pmc_name_x, y = pmc_name_y, w = pmc_name_w, h = pmc_name_h}}})
		table.insert(dst_pmc, {id = "pomyu-frame-name", 		dst = {{x = pmc_x, y = pmc_frame_name_y, w = pmc_w, h = 10}}})
		table.insert(dst_pmc, {id = "pomyu-frame-line", 		dst = {{x = pmc_x, y = pmc_line_name_y, w = pmc_w, h = 3}}})
		if skin_config.option[op_consts.DISP_14_NAME] == op_consts.DISP_14_NUMBER_3 then
			append_all(skin.destination, dst_pmc)
		elseif skin_config.option[op_consts.DISP_14_NAME] == op_consts.DISP_14_NUMBER_4 then
			append_all(skin.destination, dst_pmc)
		end

		local playarea = {
			{id = "lane-bg", dst = {{x = lane_origin_x, y = lane_origin_y, w = lane_width_total, h = lane_height, a = 255 + lanebg_opacity}}},	
			{id = "lane-1", dst = {{x = lane_x[1], y = lane_origin_y, w = lane_width[1], h = lane_height, a = 255 + lane_opacity}}},
			{id = "lane-2", dst = {{x = lane_x[2], y = lane_origin_y, w = lane_width[2], h = lane_height, a = 255 + lane_opacity}}},
			{id = "lane-3", dst = {{x = lane_x[3], y = lane_origin_y, w = lane_width[3], h = lane_height, a = 255 + lane_opacity}}},
			{id = "lane-4", dst = {{x = lane_x[4], y = lane_origin_y, w = lane_width[4], h = lane_height, a = 255 + lane_opacity}}},
			{id = "lane-5", dst = {{x = lane_x[5], y = lane_origin_y, w = lane_width[5], h = lane_height, a = 255 + lane_opacity}}},
			{id = "lane-6", dst = {{x = lane_x[6], y = lane_origin_y, w = lane_width[6], h = lane_height, a = 255 + lane_opacity}}},
			{id = "lane-7", dst = {{x = lane_x[7], y = lane_origin_y, w = lane_width[7], h = lane_height, a = 255 + lane_opacity}}},
			{id = "lane-8", dst = {{x = lane_x[8], y = lane_origin_y, w = lane_width[8], h = lane_height, a = 255 + lane_opacity}}},
			{id = "lane-9", dst = {{x = lane_x[9], y = lane_origin_y, w = lane_width[9], h = lane_height, a = 255 + lane_opacity}}},
			
			{id = "lane-line", dst = {{x = line_x[2], y = lane_origin_y, w = lane_line_px, h = lane_height, a = 255 + lane_opacity}}},
			{id = "lane-line", dst = {{x = line_x[3], y = lane_origin_y, w = lane_line_px, h = lane_height, a = 255 + lane_opacity}}},
			{id = "lane-line", dst = {{x = line_x[4], y = lane_origin_y, w = lane_line_px, h = lane_height, a = 255 + lane_opacity}}},
			{id = "lane-line", dst = {{x = line_x[5], y = lane_origin_y, w = lane_line_px, h = lane_height, a = 255 + lane_opacity}}},
			{id = "lane-line", dst = {{x = line_x[6], y = lane_origin_y, w = lane_line_px, h = lane_height, a = 255 + lane_opacity}}},
			{id = "lane-line", dst = {{x = line_x[7], y = lane_origin_y, w = lane_line_px, h = lane_height, a = 255 + lane_opacity}}},
			{id = "lane-line", dst = {{x = line_x[8], y = lane_origin_y, w = lane_line_px, h = lane_height, a = 255 + lane_opacity}}},
			{id = "lane-line", dst = {{x = line_x[9], y = lane_origin_y, w = lane_line_px, h = lane_height, a = 255 + lane_opacity}}},
			
			{id = "lane-outline", dst = {{x = outline_x[1], y = lane_origin_y, w = lane_outline_px, h = lane_height, a = 255 + lane_opacity}}},
			{id = "lane-outline", dst = {{x = outline_x[2], y = lane_origin_y, w = lane_outline_px, h = lane_height, a = 255 + lane_opacity}}},
			{id = "lane-outline", dst = {{x = outline_x[1], y = outline_y, w = outline_width, h = lane_outline_px, a = 255 + lane_opacity}}},
			
			{id = "key", timer = 101, dst = {{x = keybeam_x[1], y = lane_origin_y - lane_outline_px - 90, w = keybeam_width.key1, h = 80}}},
			{id = "key", timer = 102, dst = {{x = keybeam_x[2], y = lane_origin_y - lane_outline_px - 90, w = keybeam_width.key2, h = 80}}},
			{id = "key", timer = 103, dst = {{x = keybeam_x[3], y = lane_origin_y - lane_outline_px - 90, w = keybeam_width.key3, h = 80}}},
			{id = "key", timer = 104, dst = {{x = keybeam_x[4], y = lane_origin_y - lane_outline_px - 90, w = keybeam_width.key4, h = 80}}},
			{id = "key", timer = 105, dst = {{x = keybeam_x[5], y = lane_origin_y - lane_outline_px - 90, w = keybeam_width.key5, h = 80}}},
			{id = "key", timer = 106, dst = {{x = keybeam_x[6], y = lane_origin_y - lane_outline_px - 90, w = keybeam_width.key6, h = 80}}},
			{id = "key", timer = 107, dst = {{x = keybeam_x[7], y = lane_origin_y - lane_outline_px - 90, w = keybeam_width.key7, h = 80}}},
			{id = "key", timer = 108, dst = {{x = keybeam_x[8], y = lane_origin_y - lane_outline_px - 90, w = keybeam_width.key8, h = 80}}},
			{id = "key", timer = 109, dst = {{x = keybeam_x[9], y = lane_origin_y - lane_outline_px - 90, w = keybeam_width.key9, h = 80}}},
			
			{id = "keybeam1", timer = 101, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, dst = {{x = lane_x[1], y = judgeline_y, w = lane_width[1], h = keybeam_height, a = 255 + keybeam_opacity}}},
			{id = "keybeam2", timer = 102, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, dst = {{x = lane_x[2], y = judgeline_y, w = lane_width[2], h = keybeam_height, a = 255 + keybeam_opacity}}},
			{id = "keybeam3", timer = 103, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, dst = {{x = lane_x[3], y = judgeline_y, w = lane_width[3], h = keybeam_height, a = 255 + keybeam_opacity}}},
			{id = "keybeam4", timer = 104, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, dst = {{x = lane_x[4], y = judgeline_y, w = lane_width[4], h = keybeam_height, a = 255 + keybeam_opacity}}},
			{id = "keybeam5", timer = 105, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, dst = {{x = lane_x[5], y = judgeline_y, w = lane_width[5], h = keybeam_height, a = 255 + keybeam_opacity}}},
			{id = "keybeam6", timer = 106, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, dst = {{x = lane_x[6], y = judgeline_y, w = lane_width[6], h = keybeam_height, a = 255 + keybeam_opacity}}},
			{id = "keybeam7", timer = 107, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, dst = {{x = lane_x[7], y = judgeline_y, w = lane_width[7], h = keybeam_height, a = 255 + keybeam_opacity}}},
			{id = "keybeam8", timer = 108, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, dst = {{x = lane_x[8], y = judgeline_y, w = lane_width[8], h = keybeam_height, a = 255 + keybeam_opacity}}},
			{id = "keybeam9", timer = 109, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, dst = {{x = lane_x[9], y = judgeline_y, w = lane_width[9], h = keybeam_height, a = 255 + keybeam_opacity}}},
			{id = "keybeam1", timer = 121, loop = -1, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, dst = {{time = 0, x = lane_x[1], y = judgeline_y, w = lane_width[1], h = keybeam_height, a = 255 + keybeam_opacity},{time = 40, x = keybeam_x[1], w = keybeam_width.key1, a = 0}}},
			{id = "keybeam2", timer = 122, loop = -1, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, dst = {{time = 0, x = lane_x[2], y = judgeline_y, w = lane_width[2], h = keybeam_height, a = 255 + keybeam_opacity},{time = 40, x = keybeam_x[2], w = keybeam_width.key2, a = 0}}},
			{id = "keybeam3", timer = 123, loop = -1, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, dst = {{time = 0, x = lane_x[3], y = judgeline_y, w = lane_width[3], h = keybeam_height, a = 255 + keybeam_opacity},{time = 40, x = keybeam_x[3], w = keybeam_width.key3, a = 0}}},
			{id = "keybeam4", timer = 124, loop = -1, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, dst = {{time = 0, x = lane_x[4], y = judgeline_y, w = lane_width[4], h = keybeam_height, a = 255 + keybeam_opacity},{time = 40, x = keybeam_x[4], w = keybeam_width.key4, a = 0}}},
			{id = "keybeam5", timer = 125, loop = -1, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, dst = {{time = 0, x = lane_x[5], y = judgeline_y, w = lane_width[5], h = keybeam_height, a = 255 + keybeam_opacity},{time = 40, x = keybeam_x[5], w = keybeam_width.key5, a = 0}}},
			{id = "keybeam6", timer = 126, loop = -1, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, dst = {{time = 0, x = lane_x[6], y = judgeline_y, w = lane_width[6], h = keybeam_height, a = 255 + keybeam_opacity},{time = 40, x = keybeam_x[6], w = keybeam_width.key6, a = 0}}},
			{id = "keybeam7", timer = 127, loop = -1, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, dst = {{time = 0, x = lane_x[7], y = judgeline_y, w = lane_width[7], h = keybeam_height, a = 255 + keybeam_opacity},{time = 40, x = keybeam_x[7], w = keybeam_width.key7, a = 0}}},
			{id = "keybeam8", timer = 128, loop = -1, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, dst = {{time = 0, x = lane_x[8], y = judgeline_y, w = lane_width[8], h = keybeam_height, a = 255 + keybeam_opacity},{time = 40, x = keybeam_x[8], w = keybeam_width.key6, a = 0}}},
			{id = "keybeam9", timer = 129, loop = -1, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, dst = {{time = 0, x = lane_x[9], y = judgeline_y, w = lane_width[9], h = keybeam_height, a = 255 + keybeam_opacity},{time = 40, x = keybeam_x[9], w = keybeam_width.key7, a = 0}}},
			
			{id = "glow", timer = 40, loop = 500, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, blend = 2,	dst = {{time = 0, x = lane_origin_x, y = judgeline_y, w = lane_width_total, h = glow_height, a = 0},{time = 500, a = 64}}},
			{id = "glow", timer = 140, loop = 0, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, blend = 2,		dst = {{time = 0, x = lane_origin_x, y = judgeline_y, w = lane_width_total, h = glow_height, a = 255},{time = 1000, a = 0}}},
			
			{id = "judgeline", timer = 40, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, dst = {{x = lane_origin_x, y = judgeline_y, w = lane_width_total, h = judgeline_height}}},
			{id = "load-progress", offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {80}, dst = {{x = lane_origin_x, y = judgeline_y, w = lane_width_total, h = judgeline_height}}},

			{id = "liftcover", stretch = 3, offsets = {offset_consts.OFFSET_1_ID}, dst = {{x = lane_origin_x, y = judgeline_y - lane_height, w = lane_width_total, h = lane_height}}},
			
			{id = "notes"},
			
			{id = "lanecover", stretch = 3,		dst = {{x = lane_origin_x, y = 1080, w = lane_width_total, h = lane_height}}},
			{id = "hiddencover", stretch = 3,	dst = {{x = lane_origin_x, y = lane_origin_y - lane_height, w = lane_width_total, h = lane_height}}},

			{id = "finishcover", timer = 143, loop = 1000, stretch = 3, dst = {{time = 0, x = lane_origin_x, y = 1080, w = lane_width_total, h = lane_height, acc = 2},{time = 1000, y = lane_origin_y}}},

			{id = "lanecover-white", offset = 4, op = {270}, dst = {{x = lane_center_x - 65, y = 1086, w = 13, h = 17}}},
			{id = "duration-green", offset = 4, op = {270}, dst = {{x = lane_center_x + 13, y = 1086, w = 13, h = 17}}},

			{id = "liftcover-white", offset = 3, op = {270,272}, dst = {{x = lane_center_x - 65, y = lane_origin_y - 23, w = 13, h = 17}}},
			{id = "duration-green", offset = 3, op = {270,272}, dst = {{x = lane_center_x + 13, y = lane_origin_y - 23, w = 13, h = 17}}},


			{id = "bomb1", timer = 51, loop = -1, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_1}, dst = {{time = 0, x = bomb_x[1], y = bomb_y, w = bomb_size.w, h = bomb_size.h},{time = 250}}},
			{id = "bomb2", timer = 52, loop = -1, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_1}, dst = {{time = 0, x = bomb_x[2], y = bomb_y, w = bomb_size.w, h = bomb_size.h},{time = 250}}},
			{id = "bomb3", timer = 53, loop = -1, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_1}, dst = {{time = 0, x = bomb_x[3], y = bomb_y, w = bomb_size.w, h = bomb_size.h},{time = 250}}},
			{id = "bomb4", timer = 54, loop = -1, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_1}, dst = {{time = 0, x = bomb_x[4], y = bomb_y, w = bomb_size.w, h = bomb_size.h},{time = 250}}},
			{id = "bomb5", timer = 55, loop = -1, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_1}, dst = {{time = 0, x = bomb_x[5], y = bomb_y, w = bomb_size.w, h = bomb_size.h},{time = 250}}},
			{id = "bomb6", timer = 56, loop = -1, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_1}, dst = {{time = 0, x = bomb_x[6], y = bomb_y, w = bomb_size.w, h = bomb_size.h},{time = 250}}},
			{id = "bomb7", timer = 57, loop = -1, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_1}, dst = {{time = 0, x = bomb_x[7], y = bomb_y, w = bomb_size.w, h = bomb_size.h},{time = 250}}},
			{id = "bomb8", timer = 58, loop = -1, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_1}, dst = {{time = 0, x = bomb_x[8], y = bomb_y, w = bomb_size.w, h = bomb_size.h},{time = 250}}},
			{id = "bomb9", timer = 59, loop = -1, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_1}, dst = {{time = 0, x = bomb_x[9], y = bomb_y, w = bomb_size.w, h = bomb_size.h},{time = 250}}},
			
			{id = "hold1", timer = 71, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_1}, dst = {{time = 0, x = bomb_x[1], y = bomb_y, w = bomb_size.w, h = bomb_size.h}}},
			{id = "hold2", timer = 72, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_1}, dst = {{time = 0, x = bomb_x[2], y = bomb_y, w = bomb_size.w, h = bomb_size.h}}},
			{id = "hold3", timer = 73, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_1}, dst = {{time = 0, x = bomb_x[3], y = bomb_y, w = bomb_size.w, h = bomb_size.h}}},
			{id = "hold4", timer = 74, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_1}, dst = {{time = 0, x = bomb_x[4], y = bomb_y, w = bomb_size.w, h = bomb_size.h}}},
			{id = "hold5", timer = 75, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_1}, dst = {{time = 0, x = bomb_x[5], y = bomb_y, w = bomb_size.w, h = bomb_size.h}}},
			{id = "hold6", timer = 76, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_1}, dst = {{time = 0, x = bomb_x[6], y = bomb_y, w = bomb_size.w, h = bomb_size.h}}},
			{id = "hold7", timer = 77, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_1}, dst = {{time = 0, x = bomb_x[7], y = bomb_y, w = bomb_size.w, h = bomb_size.h}}},
			{id = "hold8", timer = 78, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_1}, dst = {{time = 0, x = bomb_x[8], y = bomb_y, w = bomb_size.w, h = bomb_size.h}}},
			{id = "hold9", timer = 79, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_1}, dst = {{time = 0, x = bomb_x[9], y = bomb_y, w = bomb_size.w, h = bomb_size.h}}},
			
			{id = "hold1-b", timer = 71, loop = -1, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_1}, dst = {{time = 0, x = bomb_x[1], y = bomb_y, w = bomb_size.w, h = bomb_size.h},{time = 250}}},
			{id = "hold2-b", timer = 72, loop = -1, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_1}, dst = {{time = 0, x = bomb_x[2], y = bomb_y, w = bomb_size.w, h = bomb_size.h},{time = 250}}},
			{id = "hold3-b", timer = 73, loop = -1, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_1}, dst = {{time = 0, x = bomb_x[3], y = bomb_y, w = bomb_size.w, h = bomb_size.h},{time = 250}}},
			{id = "hold4-b", timer = 74, loop = -1, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_1}, dst = {{time = 0, x = bomb_x[4], y = bomb_y, w = bomb_size.w, h = bomb_size.h},{time = 250}}},
			{id = "hold5-b", timer = 75, loop = -1, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_1}, dst = {{time = 0, x = bomb_x[5], y = bomb_y, w = bomb_size.w, h = bomb_size.h},{time = 250}}},
			{id = "hold6-b", timer = 76, loop = -1, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_1}, dst = {{time = 0, x = bomb_x[6], y = bomb_y, w = bomb_size.w, h = bomb_size.h},{time = 250}}},
			{id = "hold7-b", timer = 77, loop = -1, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_1}, dst = {{time = 0, x = bomb_x[7], y = bomb_y, w = bomb_size.w, h = bomb_size.h},{time = 250}}},
			{id = "hold8-b", timer = 78, loop = -1, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_1}, dst = {{time = 0, x = bomb_x[8], y = bomb_y, w = bomb_size.w, h = bomb_size.h},{time = 250}}},
			{id = "hold9-b", timer = 79, loop = -1, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_1}, dst = {{time = 0, x = bomb_x[9], y = bomb_y, w = bomb_size.w, h = bomb_size.h},{time = 250}}},

			{id = "oadxbomb1", timer = 51, filter = 1, loop = -1, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_2}, dst = {{time = 0, x = oadx_bomb_x[1], y = oadx_bomb_y, w = oadx_bomb_size.w, h = oadx_bomb_size.h},{time = 250}}},
			{id = "oadxbomb2", timer = 52, filter = 1, loop = -1, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_2}, dst = {{time = 0, x = oadx_bomb_x[2], y = oadx_bomb_y, w = oadx_bomb_size.w, h = oadx_bomb_size.h},{time = 250}}},
			{id = "oadxbomb3", timer = 53, filter = 1, loop = -1, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_2}, dst = {{time = 0, x = oadx_bomb_x[3], y = oadx_bomb_y, w = oadx_bomb_size.w, h = oadx_bomb_size.h},{time = 250}}},
			{id = "oadxbomb4", timer = 54, filter = 1, loop = -1, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_2}, dst = {{time = 0, x = oadx_bomb_x[4], y = oadx_bomb_y, w = oadx_bomb_size.w, h = oadx_bomb_size.h},{time = 250}}},
			{id = "oadxbomb5", timer = 55, filter = 1, loop = -1, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_2}, dst = {{time = 0, x = oadx_bomb_x[5], y = oadx_bomb_y, w = oadx_bomb_size.w, h = oadx_bomb_size.h},{time = 250}}},
			{id = "oadxbomb6", timer = 56, filter = 1, loop = -1, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_2}, dst = {{time = 0, x = oadx_bomb_x[6], y = oadx_bomb_y, w = oadx_bomb_size.w, h = oadx_bomb_size.h},{time = 250}}},
			{id = "oadxbomb7", timer = 57, filter = 1, loop = -1, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_2}, dst = {{time = 0, x = oadx_bomb_x[7], y = oadx_bomb_y, w = oadx_bomb_size.w, h = oadx_bomb_size.h},{time = 250}}},
			{id = "oadxbomb8", timer = 58, filter = 1, loop = -1, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_2}, dst = {{time = 0, x = oadx_bomb_x[8], y = oadx_bomb_y, w = oadx_bomb_size.w, h = oadx_bomb_size.h},{time = 250}}},
			{id = "oadxbomb9", timer = 59, filter = 1, loop = -1, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_2}, dst = {{time = 0, x = oadx_bomb_x[9], y = oadx_bomb_y, w = oadx_bomb_size.w, h = oadx_bomb_size.h},{time = 250}}},
			
			{id = "oadxhold1", timer = 71, filter = 1, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_2}, dst = {{time = 0, x = oadx_bomb_x[1], y = oadx_bomb_y, w = oadx_bomb_size.w, h = oadx_bomb_size.h}}},
			{id = "oadxhold2", timer = 72, filter = 1, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_2}, dst = {{time = 0, x = oadx_bomb_x[2], y = oadx_bomb_y, w = oadx_bomb_size.w, h = oadx_bomb_size.h}}},
			{id = "oadxhold3", timer = 73, filter = 1, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_2}, dst = {{time = 0, x = oadx_bomb_x[3], y = oadx_bomb_y, w = oadx_bomb_size.w, h = oadx_bomb_size.h}}},
			{id = "oadxhold4", timer = 74, filter = 1, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_2}, dst = {{time = 0, x = oadx_bomb_x[4], y = oadx_bomb_y, w = oadx_bomb_size.w, h = oadx_bomb_size.h}}},
			{id = "oadxhold5", timer = 75, filter = 1, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_2}, dst = {{time = 0, x = oadx_bomb_x[5], y = oadx_bomb_y, w = oadx_bomb_size.w, h = oadx_bomb_size.h}}},
			{id = "oadxhold6", timer = 76, filter = 1, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_2}, dst = {{time = 0, x = oadx_bomb_x[6], y = oadx_bomb_y, w = oadx_bomb_size.w, h = oadx_bomb_size.h}}},
			{id = "oadxhold7", timer = 77, filter = 1, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_2}, dst = {{time = 0, x = oadx_bomb_x[7], y = oadx_bomb_y, w = oadx_bomb_size.w, h = oadx_bomb_size.h}}},
			{id = "oadxhold8", timer = 78, filter = 1, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_2}, dst = {{time = 0, x = oadx_bomb_x[8], y = oadx_bomb_y, w = oadx_bomb_size.w, h = oadx_bomb_size.h}}},
			{id = "oadxhold9", timer = 79, filter = 1, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_2}, dst = {{time = 0, x = oadx_bomb_x[9], y = oadx_bomb_y, w = oadx_bomb_size.w, h = oadx_bomb_size.h}}},

			{id = "oadxbomb1", timer = 51, filter = 1, loop = -1, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_3}, dst = {{time = 0, x = oadx_bomb_x[1], y = oadx_bomb_y, w = oadx_bomb_size.w, h = oadx_bomb_size.h},{time = 250}}},
			{id = "oadxbomb2", timer = 52, filter = 1, loop = -1, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_3}, dst = {{time = 0, x = oadx_bomb_x[2], y = oadx_bomb_y, w = oadx_bomb_size.w, h = oadx_bomb_size.h},{time = 250}}},
			{id = "oadxbomb3", timer = 53, filter = 1, loop = -1, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_3}, dst = {{time = 0, x = oadx_bomb_x[3], y = oadx_bomb_y, w = oadx_bomb_size.w, h = oadx_bomb_size.h},{time = 250}}},
			{id = "oadxbomb4", timer = 54, filter = 1, loop = -1, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_3}, dst = {{time = 0, x = oadx_bomb_x[4], y = oadx_bomb_y, w = oadx_bomb_size.w, h = oadx_bomb_size.h},{time = 250}}},
			{id = "oadxbomb5", timer = 55, filter = 1, loop = -1, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_3}, dst = {{time = 0, x = oadx_bomb_x[5], y = oadx_bomb_y, w = oadx_bomb_size.w, h = oadx_bomb_size.h},{time = 250}}},
			{id = "oadxbomb6", timer = 56, filter = 1, loop = -1, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_3}, dst = {{time = 0, x = oadx_bomb_x[6], y = oadx_bomb_y, w = oadx_bomb_size.w, h = oadx_bomb_size.h},{time = 250}}},
			{id = "oadxbomb7", timer = 57, filter = 1, loop = -1, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_3}, dst = {{time = 0, x = oadx_bomb_x[7], y = oadx_bomb_y, w = oadx_bomb_size.w, h = oadx_bomb_size.h},{time = 250}}},
			{id = "oadxbomb8", timer = 58, filter = 1, loop = -1, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_3}, dst = {{time = 0, x = oadx_bomb_x[8], y = oadx_bomb_y, w = oadx_bomb_size.w, h = oadx_bomb_size.h},{time = 250}}},
			{id = "oadxbomb9", timer = 59, filter = 1, loop = -1, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_3}, dst = {{time = 0, x = oadx_bomb_x[9], y = oadx_bomb_y, w = oadx_bomb_size.w, h = oadx_bomb_size.h},{time = 250}}},
			
			{id = "oadxhold1", timer = 71, filter = 1, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_3}, dst = {{time = 0, x = oadx_bomb_x[1], y = oadx_bomb_y, w = oadx_bomb_size.w, h = oadx_bomb_size.h}}},
			{id = "oadxhold2", timer = 72, filter = 1, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_3}, dst = {{time = 0, x = oadx_bomb_x[2], y = oadx_bomb_y, w = oadx_bomb_size.w, h = oadx_bomb_size.h}}},
			{id = "oadxhold3", timer = 73, filter = 1, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_3}, dst = {{time = 0, x = oadx_bomb_x[3], y = oadx_bomb_y, w = oadx_bomb_size.w, h = oadx_bomb_size.h}}},
			{id = "oadxhold4", timer = 74, filter = 1, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_3}, dst = {{time = 0, x = oadx_bomb_x[4], y = oadx_bomb_y, w = oadx_bomb_size.w, h = oadx_bomb_size.h}}},
			{id = "oadxhold5", timer = 75, filter = 1, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_3}, dst = {{time = 0, x = oadx_bomb_x[5], y = oadx_bomb_y, w = oadx_bomb_size.w, h = oadx_bomb_size.h}}},
			{id = "oadxhold6", timer = 76, filter = 1, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_3}, dst = {{time = 0, x = oadx_bomb_x[6], y = oadx_bomb_y, w = oadx_bomb_size.w, h = oadx_bomb_size.h}}},
			{id = "oadxhold7", timer = 77, filter = 1, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_3}, dst = {{time = 0, x = oadx_bomb_x[7], y = oadx_bomb_y, w = oadx_bomb_size.w, h = oadx_bomb_size.h}}},
			{id = "oadxhold8", timer = 78, filter = 1, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_3}, dst = {{time = 0, x = oadx_bomb_x[8], y = oadx_bomb_y, w = oadx_bomb_size.w, h = oadx_bomb_size.h}}},
			{id = "oadxhold9", timer = 79, filter = 1, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_3}, dst = {{time = 0, x = oadx_bomb_x[9], y = oadx_bomb_y, w = oadx_bomb_size.w, h = oadx_bomb_size.h}}},


			{id = "judge1"},
			{id = "judge-fast", loop = -1, timer = 46 ,op = {op_consts.DISP_1_NUMBER_2,1242}, offsets = {3,32,33}, dst = {{time = 0, x = judgedetail1_x, y = judgedetail_y, w = 72, h = 20},{time = 500}}},
			{id = "judge-slow", loop = -1, timer = 46 ,op = {op_consts.DISP_1_NUMBER_2,1243}, offsets = {3,32,33}, dst = {{time = 0, x = judgedetail1_x, y = judgedetail_y, w = 72, h = 20},{time = 500}}},
			{id = "ghost-mybest", loop = -1, timer = 46, op = {op_consts.DISP_2_NUMBER_2}, offsets = {3,32,33}, dst = {{time = 0, x = ghost_x, y = ghost_y, w = 18, h = 20},{time = 500}}},
			{id = "ghost-target", loop = -1, timer = 46, op = {op_consts.DISP_2_NUMBER_3}, offsets = {3,32,33}, dst = {{time = 0, x = ghost_x, y = ghost_y, w = 18, h = 20},{time = 500}}},
			
			{id = "judge2"},
			{id = "judge-fast", loop = -1, timer = 47 ,op = {op_consts.DISP_1_NUMBER_2,1262}, offsets = {3,32,33}, dst = {{time = 0, x = judgedetail2_x, y = judgedetail_y, w = 72, h = 20},{time = 500}}},
			{id = "judge-slow", loop = -1, timer = 47 ,op = {op_consts.DISP_1_NUMBER_2,1263}, offsets = {3,32,33}, dst = {{time = 0, x = judgedetail2_x, y = judgedetail_y, w = 72, h = 20},{time = 500}}},
			{id = "ghost-mybest", loop = -1, timer = 47, op = {op_consts.DISP_2_NUMBER_2}, offsets = {3,32,33}, dst = {{time = 0, x = ghost_x, y = ghost_y, w = 18, h = 20},{time = 500}}},
			{id = "ghost-target", loop = -1, timer = 47, op = {op_consts.DISP_2_NUMBER_3}, offsets = {3,32,33}, dst = {{time = 0, x = ghost_x, y = ghost_y, w = 18, h = 20},{time = 500}}},
			
			{id = "judge3"},
			{id = "judge-fast", loop = -1, timer = 247 ,op = {op_consts.DISP_1_NUMBER_2,1362}, offsets = {3,32,33}, dst = {{time = 0, x = judgedetail3_x, y = judgedetail_y, w = 72, h = 20},{time = 500}}},
			{id = "judge-slow", loop = -1, timer = 247 ,op = {op_consts.DISP_1_NUMBER_2,1363}, offsets = {3,32,33}, dst = {{time = 0, x = judgedetail3_x, y = judgedetail_y, w = 72, h = 20},{time = 500}}},
			{id = "ghost-mybest", loop = -1, timer = 247, op = {op_consts.DISP_2_NUMBER_2}, offsets = {3,32,33}, dst = {{time = 0, x = ghost_x, y = ghost_y, w = 18, h = 20},{time = 500}}},
			{id = "ghost-target", loop = -1, timer = 247, op = {op_consts.DISP_2_NUMBER_3}, offsets = {3,32,33}, dst = {{time = 0, x = ghost_x, y = ghost_y, w = 18, h = 20},{time = 500}}},
			
			
			{id = "song-progress", blend = 2, dst = {{x = songprogress_x - 27, y = songprogress_y + songprogress_height - 41, w = 64, h = 64}}},
			{id = "song-progress", timer = 140, loop = 0, blend = 2, dst = {{time = 0, x = songprogress_x - 27, y = songprogress_y + songprogress_height - 41, w = 64, h = 64, a = 255},{time = 1000, a = 0}}},
			
			{id = "fc-effect",	loop = -1, timer = 48, stretch = 3, blend = 2, dst = {{time = 0, x = lane_origin_x, y = lane_origin_y, w = lane_width_total, h = lane_height, a = 128},{time = 2100, y = lane_origin_y + 100, a = 0}}},
			{id = "keybeam-w",	loop = -1, timer = 48, blend = 2, dst = {{time = 0, x = lane_origin_x, y = lane_origin_y, w = lane_width_total, h = 0, a = 255, acc = 2},{time = 2000, h = lane_height * 2, a = 0}}},
			{id = "fullcombo",	loop = -1, timer = 48, dst = {{time = 550, x = lane_center_x - 180, y = judge_y, w = 360, h = 36, a = 0},{time = 650, a = 255},{time = 1600},{time = 1800, y = judge_y - 18, a = 0}}},

			{id = "ready", loop = -1, timer = 40, offset = 3, dst = {{time = 0, x = lane_center_x - 162, y = judge_y, w = 324, h = 36, a = 0},{time = 100, a = 255},{time = 800},{time = 1000, y = judge_y - 18, a = 0}}},

			{id = -110, loop = 500, timer = 3, dst = {{time = 0, x = 0, y = 1080, w = 1920, h = 1080},{time = 500, y = 0}}},
			{id = -110, loop = 500, timer = 2, dst = {{time = 0, x = 0, y = 0, w = 1920, h = 1080, a = 0},{time = 500, a = 255}}},
		}
		append_all(skin.destination, playarea)

		return skin
	end

	return {
		header = header,
		body = body
	}
	
end

return main