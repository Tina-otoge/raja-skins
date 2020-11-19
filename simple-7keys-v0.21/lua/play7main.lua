main_state = require("main_state")
timer_util = require("timer_util")
local op_consts = require("lua.option")
local offset_consts = require("lua.offset")
local function append_all(list, t)
	if t then
		for i, v in pairs(t) do
			table.insert(list, v)
		end
	end
end

function main()

	local header = {
		type = 0,
		name = "simple-7keys-FHD 0.21 beta",
		w = 1920,
		h = 1080,
		playstart = 1000,
		scene = 3600000,
		input = 500,
		close = 1500,
		fadeout = 1000,

		property = {
		
			{name = "--Option----------------------------------------", item = {{name = "-", op = op_consts.SEPARATE_1}}},
			{name = op_consts.OP_2_NAME, item = {
				{name = op_consts.OP_2_ITEM_NAME_1, op = op_consts.OP_2_ITEM_NUMBER_1},
				{name = op_consts.OP_2_ITEM_NAME_2, op = op_consts.OP_2_ITEM_NUMBER_2}
			}, def = op_consts.OP_2_ITEM_NAME_1},
			
			{name = op_consts.OP_3_NAME, item = {
				{name = op_consts.OP_3_ITEM_NAME_1, op = op_consts.OP_3_ITEM_NUMBER_1},
				{name = op_consts.OP_3_ITEM_NAME_2, op = op_consts.OP_3_ITEM_NUMBER_2},
				{name = op_consts.OP_3_ITEM_NAME_3, op = op_consts.OP_3_ITEM_NUMBER_3}
			}, def = op_consts.OP_3_ITEM_NAME_1},	
			
			{name = op_consts.OP_5_NAME, item = {
				{name = op_consts.OP_5_ITEM_NAME_1, op = op_consts.OP_5_ITEM_NUMBER_1},
				{name = op_consts.OP_5_ITEM_NAME_2, op = op_consts.OP_5_ITEM_NUMBER_2}
			}, def = op_consts.OP_5_ITEM_NAME_1},
			
			{name = op_consts.OP_6_NAME, item = {
				{name = op_consts.OP_6_ITEM_NAME_1, op = op_consts.OP_6_ITEM_NUMBER_1},
				{name = op_consts.OP_6_ITEM_NAME_2, op = op_consts.OP_6_ITEM_NUMBER_2},
				{name = op_consts.OP_6_ITEM_NAME_3, op = op_consts.OP_6_ITEM_NUMBER_3}
			}, def = op_consts.OP_6_ITEM_NAME_1},
			
			{name = op_consts.OP_7_NAME, item = {
				{name = op_consts.OP_7_ITEM_NAME_1, op = op_consts.OP_7_ITEM_NUMBER_1},
				{name = op_consts.OP_7_ITEM_NAME_2, op = op_consts.OP_7_ITEM_NUMBER_2},
				{name = op_consts.OP_7_ITEM_NAME_3, op = op_consts.OP_7_ITEM_NUMBER_3},
				{name = op_consts.OP_7_ITEM_NAME_4, op = op_consts.OP_7_ITEM_NUMBER_4},
				{name = op_consts.OP_7_ITEM_NAME_5, op = op_consts.OP_7_ITEM_NUMBER_5}
			}, def = op_consts.OP_7_ITEM_NAME_1},
			
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
				{name = "1P",						op = op_consts.DISP_3_NUMBER_2},
				{name = "2P",						op = op_consts.DISP_3_NUMBER_3}
			}, def = "1P"},
			
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
			
			{name = "推定ランクを表示する Rank", item = {
				{name = "OFF",						op = op_consts.DISP_15_NUMBER_1},
				{name = "ON",						op = op_consts.DISP_15_NUMBER_2}
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
			
			{name = "タイミングビジュアライザーを表示する TimingVisualizer", item = {
				{name = "OFF",						op = op_consts.DISP_16_NUMBER_1},
				{name = "ON",						op = op_consts.DISP_16_NUMBER_2},
			}, def = "OFF"},
			
			{name = "マスコットを表示する Mascot", item = {
				{name = "OFF",						op = op_consts.DISP_13_NUMBER_1},
				{name = "ON(静止画)",				op = op_consts.DISP_13_NUMBER_2},
				{name = "MOVING(動くマスコット)",	op = op_consts.DISP_13_NUMBER_3}
			}, def = "OFF"},
			
			{name = "--File Select----------------------------------", item = {
				{name = "-", op = op_consts.SEPARATE_3}
			}}
		},
		
		filepath = {
			{name = "設定ファイル settings",							path = "customize/settings/*.lua", def = "default_1P.lua"},
			{name = "背景の画像 Background",							path = "customize/background/*", def = "default.png"},
			{name = "レーンの背景の画像 Lane Background",				path = "customize/lanebackground/*", def = "default.png"},
			{name = "1レーン目の色 Lane Color Key1",					path = "customize/lanecolor/*.png|1|", def = "01_black.png"},
			{name = "2レーン目の色 Lane Color Key2",					path = "customize/lanecolor/*.png|2|", def = "01_black.png"},
			{name = "3レーン目の色 Lane Color Key3",					path = "customize/lanecolor/*.png|3|", def = "01_black.png"},
			{name = "4レーン目の色 Lane Color Key4",					path = "customize/lanecolor/*.png|4|", def = "01_black.png"},
			{name = "5レーン目の色 Lane Color Key5",					path = "customize/lanecolor/*.png|5|", def = "01_black.png"},
			{name = "6レーン目の色 Lane Color Key6",					path = "customize/lanecolor/*.png|6|", def = "01_black.png"},
			{name = "7レーン目の色 Lane Color Key7",					path = "customize/lanecolor/*.png|7|", def = "01_black.png"},
			{name = "スクラッチレーンの色 Lane Color Scratch",			path = "customize/lanecolor/*.png|8|", def = "01_black.png"},
			{name = "レーン間の線の色 Lane Line Color",					path = "customize/lanecolor/*.png|9|", def = "01_black.png"},
			{name = "レーンの外枠の色 Lane Outline Color",				path = "customize/lanecolor/*.png|10|", def = "99_off.png"},
			{name = "1レーン目のノーツの画像 Notes Key1",				path = "customize/notes/*.png|1|", def = "simple_gray.png"},
			{name = "2レーン目のノーツの画像 Notes Key2",				path = "customize/notes/*.png|2|", def = "simple_blue.png"},
			{name = "3レーン目のノーツの画像 Notes Key3",				path = "customize/notes/*.png|3|", def = "simple_gray.png"},
			{name = "4レーン目のノーツの画像 Notes Key4",				path = "customize/notes/*.png|4|", def = "simple_blue.png"},
			{name = "5レーン目のノーツの画像 Notes Key5",				path = "customize/notes/*.png|5|", def = "simple_gray.png"},
			{name = "6レーン目のノーツの画像 Notes Key6",				path = "customize/notes/*.png|6|", def = "simple_blue.png"},
			{name = "7レーン目のノーツの画像 Notes Key7",				path = "customize/notes/*.png|7|", def = "simple_gray.png"},
			{name = "スクラッチレーンのノーツの画像 Notes Scratch",		path = "customize/notes/*.png|8|", def = "simple_orange.png"},
			{name = "1レーン目のキービームの画像 Laser Key1",			path = "customize/laser/*.png|1|", def = "default_w.png"},		
			{name = "2レーン目のキービームの画像 Laser Key2",			path = "customize/laser/*.png|2|", def = "default_b.png"},		
			{name = "3レーン目のキービームの画像 Laser Key3",			path = "customize/laser/*.png|3|", def = "default_w.png"},		
			{name = "4レーン目のキービームの画像 Laser Key4",			path = "customize/laser/*.png|4|", def = "default_b.png"},		
			{name = "5レーン目のキービームの画像 Laser Key5",			path = "customize/laser/*.png|5|", def = "default_w.png"},		
			{name = "6レーン目のキービームの画像 Laser Key6",			path = "customize/laser/*.png|6|", def = "default_b.png"},		
			{name = "7レーン目のキービームの画像 Laser Key7",			path = "customize/laser/*.png|7|", def = "default_w.png"},		
			{name = "スクラッチレーンのキービームの画像 Laser Scratch",	path = "customize/laser/*.png|8|", def = "default_s.png"},		
			{name = "判定ライン付近のグローの色 Glow Color",			path = "customize/glow/*.png", def = "04_aqua.png"},
			{name = "判定ラインの色 Judgeline Color",					path = "customize/judgeline/*.png", def = "01_red.png"},
			{name = "判定文字 Judge",									path = "customize/judge/*", def = "default"},
			{name = "曲進行度のバーの色 Song Progress Color",			path = "customize/progress/*.png", def = "04_aqua.png"},			
			{name = "鍵盤デザイン device",								path = "customize/device/*", def = "default"},
			{name = "マスコットの画像(静止画) Mascot",					path = "customize/mascot/*.png", def = "off.png"},
			{name = "動くマスコットの画像 Moving Mascot",				path = "customize/moving_mascot/*.png", def = "off.png"},
			{name = "BGAが存在しない時に表示する画像 No BGA Image",		path = "customize/no_bga_image/*"},
			
			{name = "ボムの画像(グレ) Bomb",							path = "customize/bomb/*|1|", def = "default"},
			{name = "ボムの画像(ピカグレ) Bomb PG",						path = "customize/bomb/*|2|", def = "default_pg"},
			{name = "ボムの画像(ホールド始点終点) Bomb HOLD",			path = "customize/bomb/*|3|", def = "default_hold"},
			{name = "ボムの画像(ホールド中) HOLD Effect",				path = "customize/bomb/*|4|", def = "default_effect"},	
			
			{name = "レーンカバーの画像 Lanecover",						path = "customize/cover/*|1|", def = "default.png"},
			{name = "HIDDENカバーの画像 Hiddencover",					path = "customize/cover/*|2|", def = "default.png"},
			{name = "リフトカバーの画像 Liftcover",						path = "customize/cover/*|3|", def = "default.png"},
			{name = "フィニッシュカバーの画像 Finishcover",				path = "customize/cover/*|4|", def = "off.png"},

			{name = "フォント(ttf) Font",								path = "font/*.ttf", def = "mplus-1c-heavy.ttf"},			

			{name = "OADX+ノーツの画像 OADX+ Notes",					path = "customize/oadx+/notes/*.png", def = "off.png"},
			{name = "OADX+キービームの画像 OADX+ Laser",				path = "customize/oadx+/laser/*.png", def = "off.png"},		
			{name = "OADX+判定文字の画像 OADX+ Judge",					path = "customize/oadx+/judge/*.png", def = "off.png"},
			{name = "OADXボムの画像 OADX Bomb",							path = "customize/oadx/bomb/*.png", def = "off.png"},	
		},
		
		offset = {
			{name = "--offset (Relative Value)-----------------------",	id = offset_consts.SEPARATE_3},
			{name = "判定ラインの表示位置 Judgeline Position",	id = offset_consts.OFFSET_1_ID, y = true}
		}
	}

	local function body()

		local skin = {}
		for k, v in pairs(header) do
			skin[k] = v
		end
		-- 設定を取得する
		local settings_path = skin_config.get_path("customize/settings/*.lua")
		dofile(settings_path)
		local judge_path = skin_config.get_path("customize/judge/*") .. "/judge.lua"
		dofile(judge_path)
		local device_path = skin_config.get_path("customize/device/*") .. "/device.lua"
		dofile(device_path)
		local bomb_path_1 = skin_config.get_path("customize/bomb/*|1|") .. "/bomb.lua"
		local bomb_div1 = dofile(bomb_path_1)
		local bomb_path_2 = skin_config.get_path("customize/bomb/*|2|") .. "/bomb.lua"
		local bomb_div2 = dofile(bomb_path_2)
		local bomb_path_3 = skin_config.get_path("customize/bomb/*|3|") .. "/bomb.lua"
		local bomb_div3 = dofile(bomb_path_3)
		local bomb_path_4 = skin_config.get_path("customize/bomb/*|4|") .. "/bomb.lua"
		local bomb_div4 = dofile(bomb_path_4)
		
		-- フォントのパス
		local font_get_path = skin_config.get_path("font/*.ttf")
		local font_sub = string.find(font_get_path, "font")
		local font_path = string.sub(font_get_path, font_sub)
			
		lane_origin_x = lane_origin_x + lane_outline_px
		lane_origin_y = lane_origin_y + lane_outline_px
		lanes_width = lanes_width - (lane_outline_px * 2)
		local lane_height = 1080 - lane_origin_y

		-- キー・キービーム
		local key_height = KEY_HEIGHT
		local key_y = lane_origin_y - lane_outline_px - key_height
		local key_w_width = {}
		local keybeam_key_on_width = {}
		local keybeam_key_off_width = {}
		for i, v in ipairs(lane_width) do
			keybeam_key_on_width[i] = v - (keybeam_variable_key_on * 2)
			keybeam_key_off_width[i] = v - (keybeam_variable_key_off * 2)
			key_w_width[i] = v + (lane_line_px * 2)
		end
		
		-- ボム
		local bomb_y = lane_origin_y - (bomb_height / 2)

		-- OADXボム
		local oadx_bomb_width = 181
		local oadx_bomb_height = 192
		if skin_config.option[op_consts.OP_3_NAME] == op_consts.OP_3_ITEM_NUMBER_3 then oadx_bomb_height = 144 end
		oadx_bomb_width = oadx_bomb_width * oadx_bomb_magnification
		oadx_bomb_height = oadx_bomb_height * oadx_bomb_magnification	
		local oadx_bomb_y = lane_origin_y - (oadx_bomb_height / 2) - (oadx_bomb_height / 100 * 7.29166666666667)
				
		-- 各x座標の計算
		local lane_x = {}
		local lane_center_x = {}
		local note_x = {}
		local line_x = {}
		local outline_x = {}
		local keybeam_key_on_x = {}
		local keybeam_key_off_x = {}
		local bomb_x = {}
		local oadx_bomb_x = {}
		local key_w_x = {}
		do
			local x = lane_origin_x
			for i, v in ipairs(lane_order) do
				lane_x[v] = x
				key_w_x[v] = x - lane_line_px
				line_x[i] = x - lane_line_px
				keybeam_key_on_x[v] = x + keybeam_variable_key_on
				keybeam_key_off_x[v] = x + keybeam_variable_key_off
				local width = lane_width[v]
				lane_center_x[v] = x + (width / 2)
				note_x[v] = x + (width / 2) - (note_width[v] / 2)
				bomb_x[v] = x + (width / 2) - (bomb_width / 2)
				oadx_bomb_x[v] = x + (width / 2) - (oadx_bomb_width / 2) + (oadx_bomb_width / 100 * 6.35359116022099)
				x = x + width + lane_line_px					
			end
			outline_x[1] = lane_origin_x - lane_outline_px
			outline_x[2] = x - lane_line_px
		end
		local under_outline_y = lane_origin_y - lane_outline_px
		local under_outline_width = lanes_width + (lane_outline_px * 2)
		
		-- ターンテーブル位置調節
		local sc_image_x = lane_x[8]
		local sc_image_width = lane_width[8]
		if lane_order[1] == 8 then
			sc_image_x = sc_image_x - (lane_width[8] / 2)
			sc_image_width = sc_image_width + (lane_width[8] / 2)
		elseif lane_order[8] == 8 then
			sc_image_width = sc_image_width + (lane_width[8] / 2)
		end
		
		-- 判定文字のサイズ
		local judge_f_width = JUDGEF_WIDTH
		local judge_f_height = JUDGEF_HEIGHT
		
		-- 判定数字のサイズ
		local judge_n_width = JUDGEN_WIDTH
		local judge_n_height = JUDGEN_HEIGHT
		
		-- 判定数字の表示位置
		local judge_n_x = judge_f_width + JUDGE_SPACE
		if skin_config.option[op_consts.OP_6_NAME] == op_consts.OP_6_ITEM_NUMBER_2 then
			judge_f_width = 174
			judge_f_height = 79
			judge_n_width = 38
			judge_n_height = 79
			judge_n_x =  181
		end
		if skin_config.option[op_consts.OP_6_NAME] == op_consts.OP_6_ITEM_NUMBER_3 then
			judge_f_width = 231
			judge_f_height = 79
			judge_n_width = 51
			judge_n_height = 79
			judge_n_x =  240
		end
		local judge_n_y = 0
		
		if overwrite_judge_f_width then judge_f_width = overwrite_judge_f_width end
		if overwrite_judge_f_height then judge_f_height = overwrite_judge_f_height end
		if overwrite_judge_n_width then judge_n_width = overwrite_judge_n_width end
		if overwrite_judge_n_height then judge_n_height = overwrite_judge_n_height end
		
		-- 判定文字の表示位置
		local judge_f_x = lanes_center_x - ((judge_f_width + JUDGE_SPACE) / 2)
		if skin_config.option[op_consts.OP_6_NAME] == op_consts.OP_6_ITEM_NUMBER_2 then
			judge_f_x = lanes_center_x - 120
		end
		local judge_f_y = judge_y
		
		-- 判定形式
		local judge_height = judge_f_height
		if judge_f_height < judge_n_height then judge_height = judge_n_height end
		local judge_shift = true
		if skin_config.option[op_consts.OP_6_NAME] ~= op_consts.OP_6_ITEM_NUMBER_2 then
			if JUDGE_FORMAT == 2 then
				judge_shift = false
				judge_f_x = lanes_center_x - (judge_f_width / 2)
				judge_n_x = judge_f_width / 2
				judge_n_y = judge_f_height + JUDGE_SPACE
				judge_height = judge_f_height + judge_n_height + JUDGE_SPACE
				
			elseif JUDGE_FORMAT == 3 then
				judge_shift = false
				judge_f_x = lanes_center_x - (judge_f_width / 2)
				judge_n_x = judge_f_width / 2
				judge_f_y = judge_f_y + judge_n_height + JUDGE_SPACE
				judge_n_y = (judge_n_height + JUDGE_SPACE) * -1
				judge_height = judge_f_height + judge_n_height + JUDGE_SPACE
			end
		end
		
		local judgedetail_x = lanes_center_x - 108
		local judgedetail_y = judge_y + judge_height + 25
		
		local ghost_x = lanes_center_x + 36
		local ghost_y = judge_y + judge_height + 25
		
		if overwrite_judgedetail_x then judgedetail_x = overwrite_judgedetail_x end
		if overwrite_judgedetail_y then judgedetail_y = overwrite_judgedetail_y end
		if overwrite_ghost_x then ghost_x = overwrite_ghost_x end
		if overwrite_ghost_y then ghost_y = overwrite_ghost_y end
		
		local tv_x = lane_origin_x
		local tv_y = lane_origin_y - 80
		local tv_w = lanes_width
		local tv_h = 60
		if timingvisualizer_x then tv_x = timingvisualizer_x end
		if timingvisualizer_y then tv_y = timingvisualizer_y end
		if timingvisualizer_w then tv_w = timingvisualizer_w end
		if timingvisualizer_h then tv_h = timingvisualizer_h end

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
			{id = "src-lane-s",				path = "customize/lanecolor/*.png|8|"},
			{id = "src-line",				path = "customize/lanecolor/*.png|9|"},
			{id = "src-outline",			path = "customize/lanecolor/*.png|10|"},
			{id = "src-glow",				path = "customize/glow/*.png"},
			{id = "src-judgeline",			path = "customize/judgeline/*.png"},
			{id = "src-laser-1",			path = "customize/laser/*.png|1|"},
			{id = "src-laser-2",			path = "customize/laser/*.png|2|"},
			{id = "src-laser-3",			path = "customize/laser/*.png|3|"},
			{id = "src-laser-4",			path = "customize/laser/*.png|4|"},
			{id = "src-laser-5",			path = "customize/laser/*.png|5|"},
			{id = "src-laser-6",			path = "customize/laser/*.png|6|"},
			{id = "src-laser-7",			path = "customize/laser/*.png|7|"},
			{id = "src-laser-s",			path = "customize/laser/*.png|8|"},
			{id = "src-notes-1",			path = "customize/notes/*.png|1|"},
			{id = "src-notes-2",			path = "customize/notes/*.png|2|"},
			{id = "src-notes-3",			path = "customize/notes/*.png|3|"},
			{id = "src-notes-4",			path = "customize/notes/*.png|4|"},
			{id = "src-notes-5",			path = "customize/notes/*.png|5|"},
			{id = "src-notes-6",			path = "customize/notes/*.png|6|"},
			{id = "src-notes-7",			path = "customize/notes/*.png|7|"},
			{id = "src-notes-s",			path = "customize/notes/*.png|8|"},
			{id = "src-bomb",				path = "customize/bomb/*|1|" .. "/BOMB.png"},
			{id = "src-bomb-pg",			path = "customize/bomb/*|2|" .. "/BOMB.png"},
			{id = "src-bomb-hold",			path = "customize/bomb/*|3|" .. "/BOMB.png"},
			{id = "src-hold-effect",		path = "customize/bomb/*|4|" .. "/BOMB.png"},
			{id = "src-lanecover",			path = "customize/cover/*|1|"},	
			{id = "src-hiddencover",		path = "customize/cover/*|2|"},
			{id = "src-liftcover",			path = "customize/cover/*|3|"},
			{id = "src-finishcover",		path = "customize/cover/*|4|"},		
			{id = "src-pg",					path = "customize/judge/*" .. "/F_PG.png"},
			{id = "src-gr",					path = "customize/judge/*" .. "/F_GR.png"},
			{id = "src-gd",					path = "customize/judge/*" .. "/F_GD.png"},
			{id = "src-bd",					path = "customize/judge/*" .. "/F_BD.png"},
			{id = "src-pr",					path = "customize/judge/*" .. "/F_PR.png"},
			{id = "src-pgn",				path = "customize/judge/*" .. "/N_PG.png"},
			{id = "src-grn",				path = "customize/judge/*" .. "/N_GR.png"},
			{id = "src-gdn",				path = "customize/judge/*" .. "/N_GD.png"},

			{id = "src-frame-l",			path = "customize/frame/*" .. "/FRAME_L.png"},
			{id = "src-frame-r",			path = "customize/frame/*" .. "/FRAME_R.png"},
			
			{id = "src-key-w",				path = "customize/device/*" .. "/W.png"},
			{id = "src-key-b",				path = "customize/device/*" .. "/B.png"},
			{id = "src-key-wf",				path = "customize/device/*" .. "/WF.png"},
			{id = "src-key-bf",				path = "customize/device/*" .. "/BF.png"},
			{id = "src-sc-base",			path = "customize/device/*" .. "/TABLE_BASE.png"},
			{id = "src-sc-table",			path = "customize/device/*" .. "/TABLE.png"},
			{id = "src-sc-record",			path = "customize/device/*" .. "/RECORD.png"},
			
			{id = "src-progress",			path = "customize/progress/*.png"},
			{id = "src-mascot",				path = "customize/mascot/*.png"},
			{id = "src-movingmascot",		path = "customize/moving_mascot/*.png"},
			{id = "src-nobgaimage",			path = "customize/no_bga_image/*"},
			{id = "src-judgedetail",		path = "parts/judgedetail.png"},
			{id = "src-barline",			path = "parts/bar_line.png"},
			{id = "src-number-s",			path = "parts/number_s.png"},
			{id = "src-number-m",			path = "parts/number_m.png"},
			{id = "src-number-gauge",		path = "parts/number_gauge.png"},
			{id = "src-scoregraph",			path = "parts/scoregraph.png"},
			{id = "src-scoregraph-frame",	path = "parts/scoregraph_frame.png"},
			{id = "src-scoregraph-line",	path = "parts/scoregraph_line.png"},
			{id = "src-string",				path = "parts/string.png"},
			{id = "src-rank",				path = "parts/rank.png"},
			{id = "src-gauge",				path = "parts/gauge.png"},
			{id = "src-fceffect",			path = "parts/fceffect.png"},
			{id = "src-fullcombo",			path = "parts/fullcombo.png"},
			{id = "src-ready",				path = "parts/ready.png"},
			
			{id = "src-oadx+laser",			path = "customize/oadx+/laser/*.png"},
			{id = "src-oadx+notes",			path = "customize/oadx+/notes/*.png"},			
			{id = "src-oadxbomb",			path = "customize/oadx/bomb/*.png"},
			{id = "src-oadx+judge",			path = "customize/oadx+/judge/*.png"},
		}
		
		skin.font =  {{id = 0, path = font_path}}
		
		skin.image = {
			{id = "background", src = "src-background", x = 0, y = 0, w = -1, h = -1},
			
			{id = "no-bga-image", src = "src-nobgaimage", x = 0, y = 0, w = -1, h = -1},

			{id = "scoregraph-frame", src = "src-scoregraph-frame", x = 0, y = 0, w = -1, h = -1},
			{id = "scoregraph-line", src = "src-scoregraph-line", x = 0, y = 0, w = 1, h = 1},
			
			{id = "exscore-s", src = "src-string", x = 0, y = 184, w = 78, h = 17},
			{id = "diffscore-s", src = "src-string", x = 0, y = 131, w = 65, h = 36},
			{id = "rate-s", src = "src-string", x = 0, y = 167, w = 65, h = 17},
			{id = "judgecount-s", src = "src-string", x = 0, y = 0, w = 39, h = 131},
			{id = "bpm-s", src = "src-string", x = 0, y = 201, w = 45, h = 17},
			{id = "maxcombo-s", src = "src-string", x = 0, y = 223, w = 78, h = 17},
			{id = "dot", src = "src-string", x = 0, y = 218, w = 5, h = 5},
			
			{id = "f", src = "src-rank", x = 0, y = 0, w = 120, h = 48},
			{id = "e", src = "src-rank", x = 0, y = 48, w = 120, h = 48},
			{id = "d", src = "src-rank", x = 0, y = 96, w = 120, h = 48},
			{id = "c", src = "src-rank", x = 0, y = 144, w = 120, h = 48},
			{id = "b", src = "src-rank", x = 0, y = 192, w = 120, h = 48},
			{id = "a", src = "src-rank", x = 0, y = 240, w = 120, h = 48},
			{id = "aa", src = "src-rank", x = 0, y = 288, w = 120, h = 48},
			{id = "aaa", src = "src-rank", x = 0, y = 336, w = 120, h = 48},			
			
			{id = "dot-gauge", src = "src-number-gauge", x = 286, y = 0, w = 8, h = 28},
			
			{id = "sc-base", src = "src-sc-base", x = 0, y = 0, w = -1, h = -1},
			{id = "sc-table", src = "src-sc-table", x = 0, y = 0, w = -1, h = -1},
			{id = "sc-record", src = "src-sc-record", x = 0, y = 0, w = -1, h = -1},
			{id = "key-w", src = "src-key-w", x = 0, y = 0, w = -1, h = -1},
			{id = "key-b", src = "src-key-b", x = 0, y = 0, w = -1, h = -1},
			{id = "key-wf", src = "src-key-wf", x = 0, y = 0, w = -1, h = -1},
			{id = "key-bf", src = "src-key-bf", x = 0, y = 0, w = -1, h = -1},
			
			{id = "lane-bg", src = "src-lanebg", x = 0, y = 0, w = -1, h = -1},		
			{id = "lane-1", src = "src-lane-1", x = 0, y = 0, w = -1, h = -1},
			{id = "lane-2", src = "src-lane-2", x = 0, y = 0, w = -1, h = -1},
			{id = "lane-3", src = "src-lane-3", x = 0, y = 0, w = -1, h = -1},
			{id = "lane-4", src = "src-lane-4", x = 0, y = 0, w = -1, h = -1},
			{id = "lane-5", src = "src-lane-5", x = 0, y = 0, w = -1, h = -1},
			{id = "lane-6", src = "src-lane-6", x = 0, y = 0, w = -1, h = -1},
			{id = "lane-7", src = "src-lane-7", x = 0, y = 0, w = -1, h = -1},
			{id = "lane-s", src = "src-lane-s", x = 0, y = 0, w = -1, h = -1},
			{id = "lane-line", src = "src-line", x = 0, y = 0, w = -1, h = -1},
			{id = "lane-outline", src = "src-outline", x = 0, y = 8, w = -1, h = -1},
			{id = "glow", src = "src-glow", x = 0, y = 0, w = -1, h = -1},
			{id = "judgeline", src = "src-judgeline", x = 0, y = 0, w = 1, h = 1},
					
			{id = "keybeam-1", src = "src-laser-1", x = 0, y = 0, w = 16, h = 255},
			{id = "keybeam-2", src = "src-laser-2", x = 0, y = 0, w = 16, h = 255},
			{id = "keybeam-3", src = "src-laser-3", x = 0, y = 0, w = 16, h = 255},
			{id = "keybeam-4", src = "src-laser-4", x = 0, y = 0, w = 16, h = 255},
			{id = "keybeam-5", src = "src-laser-5", x = 0, y = 0, w = 16, h = 255},
			{id = "keybeam-6", src = "src-laser-6", x = 0, y = 0, w = 16, h = 255},
			{id = "keybeam-7", src = "src-laser-7", x = 0, y = 0, w = 16, h = 255},
			{id = "keybeam-s", src = "src-laser-s", x = 0, y = 0, w = 16, h = 255},
			{id = "keybeam-1-pg", src = "src-laser-1", x = 16, y = 0, w = 16, h = 255},
			{id = "keybeam-2-pg", src = "src-laser-2", x = 16, y = 0, w = 16, h = 255},
			{id = "keybeam-3-pg", src = "src-laser-3", x = 16, y = 0, w = 16, h = 255},
			{id = "keybeam-4-pg", src = "src-laser-4", x = 16, y = 0, w = 16, h = 255},
			{id = "keybeam-5-pg", src = "src-laser-5", x = 16, y = 0, w = 16, h = 255},
			{id = "keybeam-6-pg", src = "src-laser-6", x = 16, y = 0, w = 16, h = 255},
			{id = "keybeam-7-pg", src = "src-laser-7", x = 16, y = 0, w = 16, h = 255},
			{id = "keybeam-s-pg", src = "src-laser-s", x = 16, y = 0, w = 16, h = 255},
			
			{id = "oadx+keybeam-w", src = "src-oadx+laser", x = 0, y = 0, w = 25, h = 321},
			{id = "oadx+keybeam-b", src = "src-oadx+laser", x = 27, y = 0, w = 21, h = 321},
			{id = "oadx+keybeam-s", src = "src-oadx+laser", x = 50, y = 0, w = 48, h = 321},
			
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
			
			{id = "oadx+-judgef-pg", src = "src-oadx+judge", x = 0, y = 0, w = 77, h = 105, divy = 3, cycle = 125},
			{id = "oadx+-judgef-gr", src = "src-oadx+judge", x = 0, y = 105, w = 77, h = 70, divy = 2, cycle = 75},
			{id = "oadx+-judgef-gd", src = "src-oadx+judge", x = 247, y = 0, w = 77, h = 70, divy = 2, cycle = 75},
			{id = "oadx+-judgef-bd", src = "src-oadx+judge", x = 324, y = 0, w = 77, h = 70, divy = 2, cycle = 75},
			{id = "oadx+-judgef-pr", src = "src-oadx+judge", x = 401, y = 0, w = 77, h = 70, divy = 2, cycle = 75},
			{id = "oadx+-judgef-ms", src = "src-oadx+judge", x = 401, y = 0, w = 77, h = 70, divy = 2, cycle = 75},

			{id = "judgef-pg", src = "src-pg", x = 0, y = 0, w = -1, h = -1, divy = DIVY_F_PG, cycle = JUDGE_ANIMATION_CYCLE_PG},
			{id = "judgef-gr", src = "src-gr", x = 0, y = 0, w = -1, h = -1, divy = DIVY_F_GR, cycle = JUDGE_ANIMATION_CYCLE_GR},
			{id = "judgef-gd", src = "src-gd", x = 0, y = 0, w = -1, h = -1, divy = DIVY_F_GD, cycle = JUDGE_ANIMATION_CYCLE_GD},
			{id = "judgef-bd", src = "src-bd", x = 0, y = 0, w = -1, h = -1, divy = DIVY_F_BD, cycle = JUDGE_ANIMATION_CYCLE_BD},
			{id = "judgef-pr", src = "src-pr", x = 0, y = 0, w = -1, h = -1, divy = DIVY_F_PR, cycle = JUDGE_ANIMATION_CYCLE_PR},
			{id = "judgef-ms", src = "src-pr", x = 0, y = 0, w = -1, h = -1, divy = DIVY_F_PR, cycle = JUDGE_ANIMATION_CYCLE_PR},

			{id = "judge-fast", src = "src-judgedetail", x = 0, y = 40, w = 72, h = 20},
			{id = "judge-slow", src = "src-judgedetail", x = 72, y = 40, w = 72, h = 20},

			{id = "song-progress-bg", src = "src-progress", x = 0, y = 0, w = 1, h = 1},		
			
			{id = "fc-effect", src = "src-fceffect", x = 0, y = 0, w = -1, h = -1},
			{id = "fullcombo", src = "src-fullcombo", x = 0, y = 0, w = -1, h = -1},

			{id = "mascot", src = "src-mascot", x = 0, y = 0, w = -1, h = -1},
			{id = "moving-mascot", src = "src-movingmascot", x = 0, y = 0, w = 1344, h = 271, divx = 8, cycle = 1000},
			
			{id = "ready", src = "src-ready", x = 0, y = 0, w = -1, h = -1}
		}
		do
			local bomb_id = {"s",1,2,3,4,5,6,7}
			
			local v_x1 = 0
			if bomb_div1.BOMB_X then v_x1 = bomb_div1.BOMB_X end
			local v_x2 = 0
			if bomb_div2.BOMB_X then v_x2 = bomb_div2.BOMB_X end
			local v_x3 = 0
			if bomb_div3.BOMB_X then v_x3 = bomb_div3.BOMB_X end
			local v_x4 = 0
			if bomb_div4.BOMB_X then v_x4 = bomb_div4.BOMB_X end
			
			local v_y1 = 0
			if bomb_div1.BOMB_Y then v_y1 = bomb_div1.BOMB_Y end
			local v_y2 = 0
			if bomb_div2.BOMB_Y then v_y2 = bomb_div2.BOMB_Y end
			local v_y3 = 0
			if bomb_div3.BOMB_Y then v_y3 = bomb_div3.BOMB_Y end
			local v_y4 = 0
			if bomb_div4.BOMB_Y then v_y4 = bomb_div4.BOMB_Y end

			local v_w1 = -1
			if bomb_div1.BOMB_W then v_w1 = bomb_div1.BOMB_W end
			local v_w2 = -1
			if bomb_div2.BOMB_W then v_w2 = bomb_div2.BOMB_W end
			local v_w3 = -1
			if bomb_div3.BOMB_W then v_w3 = bomb_div3.BOMB_W end
			local v_w4 = -1
			if bomb_div4.BOMB_W then v_w4 = bomb_div4.BOMB_W end
					
			local v_h1 = -1
			if bomb_div1.BOMB_H then v_h1 = bomb_div1.BOMB_H end
			local v_h2 = -1
			if bomb_div2.BOMB_H then v_h2 = bomb_div2.BOMB_H end
			local v_h3 = -1
			if bomb_div3.BOMB_H then v_h3 = bomb_div3.BOMB_H end
			local v_h4 = -1
			if bomb_div4.BOMB_H then v_h4 = bomb_div4.BOMB_H end
			
			for i, v in ipairs(bomb_id) do
				table.insert(skin.image, {id = "bomb-" .. v, src = "src-bomb",				x = v_x1, y = v_y1, w = v_w1, h = v_h1, divx = bomb_div1.BOMB_DIVX, divy = bomb_div1.BOMB_DIVY, timer = 49 + i, cycle = bomb_animation_cycle + 1})
				table.insert(skin.image, {id = "bomb-pg-" .. v, src = "src-bomb-pg",		x = v_x2, y = v_y2, w = v_w2, h = v_h2, divx = bomb_div2.BOMB_DIVX, divy = bomb_div2.BOMB_DIVY, timer = 49 + i, cycle = bomb_animation_cycle + 1})
				table.insert(skin.image, {id = "hold" .. v, src = "src-hold-effect",		x = v_x4, y = v_y4, w = v_w4, h = v_h4, divx = bomb_div4.BOMB_DIVX, divy = bomb_div4.BOMB_DIVY, timer = 69 + i, cycle = hold_animation_cycle})
				table.insert(skin.image, {id = "hold" .. v .. "-b", src = "src-bomb-hold",	x = v_x3, y = v_y3, w = v_w3, h = v_h3, divx = bomb_div3.BOMB_DIVX, divy = bomb_div3.BOMB_DIVY, timer = 69 + i, cycle = bomb_animation_cycle + 1})
				table.insert(skin.image, {id = "oadxbomb" .. v, src = "src-oadxbomb",		x = 0, y = 0, w = -1, h = 192, divx = 16, timer = 49 + i, cycle = 251})
				table.insert(skin.image, {id = "oadxhold" .. v, src = "src-oadxbomb",		x = 0, y = 0, w = -1, h = 192, divx = 16, timer = 69 + i, cycle = 80})
			end
		end
		
		if skin_config.option[op_consts.OP_7_NAME] == op_consts.OP_7_ITEM_NUMBER_1 then
			do
				local note_id = {"s",1,2,3,4,5,6,7}
				for i, v in ipairs(note_id) do
					table.insert(skin.image, {id = "note-" .. v, src = "src-notes-" .. v, x = 0, y = 0, w = 128, h = 40})							-- ノート
					table.insert(skin.image, {id = "lns-" .. v, src = "src-notes-" .. v, x = 0, y = 80, w = 128, h = 40})							-- ロングノート始点
					table.insert(skin.image, {id = "lne-" .. v, src = "src-notes-" .. v, x = 0, y = 40, w = 128, h = 40})							-- ロングノート終点
					table.insert(skin.image, {id = "lnb-" .. v, src = "src-notes-" .. v, x = 0, y = 132, w = 128, h = 24, divy = 24, cycle = 266})	-- ロングノートアクティブ
					table.insert(skin.image, {id = "lna-" .. v, src = "src-notes-" .. v, x = 0, y = 120, w = 128, h = 12})							-- ロングノート非アクティブ
					table.insert(skin.image, {id = "hcns-" .. v, src = "src-notes-" .. v, x = 0, y = 196, w = 128, h = 40})						-- ヘルチャージノート始点
					table.insert(skin.image, {id = "hcne-" .. v, src = "src-notes-" .. v, x = 0, y = 156, w = 128, h = 40})						-- ヘルチャージノート終点
					table.insert(skin.image, {id = "hcnb-" .. v, src = "src-notes-" .. v, x = 0, y = 248, w = 128, h = 24, divy = 24, cycle = 266})	-- ヘルチャージノートアクティブ
					table.insert(skin.image, {id = "hcna-" .. v, src = "src-notes-" .. v, x = 0, y = 236, w = 128, h = 12})						-- ヘルチャージノート非アクティブ
					table.insert(skin.image, {id = "hcnr-" .. v, src = "src-notes-" .. v, x = 0, y = 272, w = 128, h = 24, divy = 24, cycle = 100})	-- ヘルチャージノートダメージ
					table.insert(skin.image, {id = "hcnd-" .. v, src = "src-notes-" .. v, x = 0, y = 248, w = 128, h = 24, divy = 24, cycle = 266})	-- ヘルチャージノートリアクティブ
					table.insert(skin.image, {id = "mine-" .. v, src = "src-notes-" .. v, x = 0, y = 296, w = 128, h = 40})						-- 地雷
				end
			end
		else
			do
				local v_x = {}
				local v_y = {}
				local v_w = {}
				local v_h = {}
				
				if skin_config.option[op_consts.OP_7_NAME] == op_consts.OP_7_ITEM_NUMBER_2 then
					v_x = {62, 80, 31}
					v_y = {0, 57, 38, 77, 76, 19}
					v_w = {17, 13, 30}
					v_h = {18, 17, 1}
				elseif  skin_config.option[op_consts.OP_7_NAME] == op_consts.OP_7_ITEM_NUMBER_3 then
					v_x = {178, 201, 136}
					v_y = {0, 57, 38, 77, 76, 19}
					v_w = {22, 17, 41}
					v_h = {18, 17, 1}
				elseif  skin_config.option[op_consts.OP_7_NAME] == op_consts.OP_7_ITEM_NUMBER_4 then
					v_x = {100, 127, 50}
					v_y = {95, 152, 133, 172, 171, 114}
					v_w = {26, 22, 49}
					v_h = {18, 17, 1}
				elseif  skin_config.option[op_consts.OP_7_NAME] == op_consts.OP_7_ITEM_NUMBER_5 then
					v_x = {258, 289, 204}
					v_y = {95, 152, 133, 172, 171, 114}
					v_w = {30, 23, 53}
					v_h = {18, 17, 1}
				end
				
				table.insert(skin.image, {id = "note-w", src = "src-oadx+notes", x = v_x[1], y = v_y[1], w = v_w[1], h = v_h[1]})							-- ノート
				table.insert(skin.image, {id = "note-b", src = "src-oadx+notes", x = v_x[2], y = v_y[1], w = v_w[2], h = v_h[1]})							-- ノート
				table.insert(skin.image, {id = "note-s", src = "src-oadx+notes", x = v_x[3], y = v_y[1], w = v_w[3], h = v_h[1]})							-- ノート
				
				table.insert(skin.image, {id = "lns-w", src = "src-oadx+notes", x = v_x[1], y = v_y[2], w = v_w[1], h = v_h[1]})							-- ロングノート始点
				table.insert(skin.image, {id = "lns-b", src = "src-oadx+notes", x = v_x[2], y = v_y[2], w = v_w[2], h = v_h[1]})							-- ロングノート始点
				table.insert(skin.image, {id = "lns-s", src = "src-oadx+notes", x = v_x[3], y = v_y[2], w = v_w[3], h = v_h[1]})							-- ロングノート始点
				
				table.insert(skin.image, {id = "lne-w", src = "src-oadx+notes", x = v_x[1], y = v_y[3], w = v_w[1], h = v_h[1]})							-- ロングノート終点
				table.insert(skin.image, {id = "lne-b", src = "src-oadx+notes", x = v_x[2], y = v_y[3], w = v_w[2], h = v_h[1]})							-- ロングノート終点
				table.insert(skin.image, {id = "lne-s", src = "src-oadx+notes", x = v_x[3], y = v_y[3], w = v_w[3], h = v_h[1]})							-- ロングノート終点

				table.insert(skin.image, {id = "lnb-w", src = "src-oadx+notes", x = v_x[1], y = v_y[4], w = v_w[1], h = v_h[2], divy = v_h[2], cycle = 250})	-- ロングノートアクティブ
				table.insert(skin.image, {id = "lnb-b", src = "src-oadx+notes", x = v_x[2], y = v_y[4], w = v_w[2], h = v_h[2], divy = v_h[2], cycle = 250})	-- ロングノートアクティブ
				table.insert(skin.image, {id = "lnb-s", src = "src-oadx+notes", x = v_x[3], y = v_y[4], w = v_w[3], h = v_h[2], divy = v_h[2], cycle = 250})	-- ロングノートアクティブ

				table.insert(skin.image, {id = "lna-w", src = "src-oadx+notes", x = v_x[1], y = v_y[5], w = v_w[1], h = v_h[3]})							-- ロングノート非アクティブ
				table.insert(skin.image, {id = "lna-b", src = "src-oadx+notes", x = v_x[2], y = v_y[5], w = v_w[2], h = v_h[3]})							-- ロングノート非アクティブ
				table.insert(skin.image, {id = "lna-s", src = "src-oadx+notes", x = v_x[3], y = v_y[5], w = v_w[3], h = v_h[3]})							-- ロングノート非アクティブ

				table.insert(skin.image, {id = "mine-w", src = "src-oadx+notes", x = v_x[1], y = v_y[6], w = v_w[1], h = v_h[1]})						-- 地雷
				table.insert(skin.image, {id = "mine-b", src = "src-oadx+notes", x = v_x[2], y = v_y[6], w = v_w[2], h = v_h[1]})						-- 地雷
				table.insert(skin.image, {id = "mine-s", src = "src-oadx+notes", x = v_x[3], y = v_y[6], w = v_w[3], h = v_h[1]})						-- 地雷
			end
		end
		
		skin.imageset = {
			{id = "keybeam1", ref = 501, images = {"keybeam-1","keybeam-1-pg"}},
			{id = "keybeam2", ref = 502, images = {"keybeam-2","keybeam-2-pg"}},
			{id = "keybeam3", ref = 503, images = {"keybeam-3","keybeam-3-pg"}},
			{id = "keybeam4", ref = 504, images = {"keybeam-4","keybeam-4-pg"}},
			{id = "keybeam5", ref = 505, images = {"keybeam-5","keybeam-5-pg"}},
			{id = "keybeam6", ref = 506, images = {"keybeam-6","keybeam-6-pg"}},
			{id = "keybeam7", ref = 507, images = {"keybeam-7","keybeam-7-pg"}},
			{id = "keybeams", ref = 500, images = {"keybeam-s","keybeam-s-pg"}},
			{id = "bomb1", ref = 501, images = {"bomb-1","bomb-pg-1"}},
			{id = "bomb2", ref = 502, images = {"bomb-2","bomb-pg-2"}},
			{id = "bomb3", ref = 503, images = {"bomb-3","bomb-pg-3"}},
			{id = "bomb4", ref = 504, images = {"bomb-4","bomb-pg-4"}},
			{id = "bomb5", ref = 505, images = {"bomb-5","bomb-pg-5"}},
			{id = "bomb6", ref = 506, images = {"bomb-6","bomb-pg-6"}},
			{id = "bomb7", ref = 507, images = {"bomb-7","bomb-pg-7"}},
			{id = "bombs", ref = 500, images = {"bomb-s","bomb-pg-s"}}
		}
		
		skin.value = {
			{id = "ghost-target", src = "src-judgedetail", x = 0, y = 0, w = 216, h = 40, divx = 12, divy = 2, digit = 6, align = 1, ref = 153},
			{id = "ghost-mybest", src = "src-judgedetail", x = 0, y = 0, w = 216, h = 40, divx = 12, divy = 2, digit = 6, align = 1, ref = 152},
			
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

			{id = "groovegauge",			src = "src-number-gauge", x = 0, y = 0, w = 260, h = 28, divx = 10, digit = 3, ref = 107},
			{id = "groovegauge-afterdot",	src = "src-number-gauge", x = 0, y = 0, w = 286, h = 28, divx = 11, digit = 1, ref = 407},

			{id = "minbpm", src = "src-number-s", x = 0, y = 85, w = 130, h = 17, divx = 10, digit = 4, align = 2, ref = 91},
			{id = "nowbpm", src = "src-number-m", x = 0, y = 0, w = 240, h = 24, divx = 10, digit = 4, align = 2, ref = 160},
			{id = "maxbpm", src = "src-number-s", x = 0, y = 85, w = 130, h = 17, divx = 10, digit = 4, align = 2, ref = 90},

			{id = "lanecover-white",	src = "src-number-s", x = 0, y = 0, w = 130, h = 17, divx = 10, digit = 4, align = 2, ref = 14},
			{id = "liftcover-white",	src = "src-number-s", x = 0, y = 0, w = 130, h = 17, divx = 10, digit = 4, align = 2, ref = 314},
			{id = "duration-green",		src = "src-number-s", x = 0, y = 102, w = 130, h = 17, divx = 10, digit = 4, align = 2, ref = 313},
			
			{id = "judgen-pg", src = "src-pgn",	x = 0, y = 0, w = -1, h = -1, divx = 10, divy = DIVY_N_PG, digit = 6, ref = 75, cycle = JUDGE_ANIMATION_CYCLE_PG},
			{id = "judgen-gr", src = "src-grn",	x = 0, y = 0, w = -1, h = -1, divx = 10, divy = DIVY_N_GR, digit = 6, ref = 75, cycle = JUDGE_ANIMATION_CYCLE_GR},
			{id = "judgen-gd", src = "src-gdn",	x = 0, y = 0, w = -1, h = -1, divx = 10, divy = DIVY_N_GD, digit = 6, ref = 75, cycle = JUDGE_ANIMATION_CYCLE_GD},
			{id = "judgen-bd", src = "src-gdn",	x = 0, y = 0, w = -1, h = -1, divx = 10, divy = DIVY_N_GD, digit = 6, ref = 75, cycle = JUDGE_ANIMATION_CYCLE_GD},
			{id = "judgen-pr", src = "src-gdn",	x = 0, y = 0, w = -1, h = -1, divx = 10, divy = DIVY_N_GD, digit = 6, ref = 75, cycle = JUDGE_ANIMATION_CYCLE_GD},
			{id = "judgen-ms", src = "src-gdn",	x = 0, y = 0, w = -1, h = -1, divx = 10, divy = DIVY_N_GD, digit = 6, ref = 75, cycle = JUDGE_ANIMATION_CYCLE_GD},
			
			{id = "oadx+-judgen-pg", src = "src-oadx+judge", x = 77, y = 0, w = 170, h = 105, divx = 10, divy = 3, digit = 6, ref = 75, cycle = 125},
			{id = "oadx+-judgen-gr", src = "src-oadx+judge", x = 77, y = 105, w = 170, h = 70, divx = 10, divy = 2, digit = 6, ref = 75, cycle = 75},
			{id = "oadx+-judgen-gd", src = "src-oadx+judge", x = 77, y = 105, w = 170, h = 70, divx = 10, divy = 2, digit = 6, ref = 75, cycle = 75},
			{id = "oadx+-judgen-bd", src = "src-oadx+judge", x = 77, y = 105, w = 170, h = 70, divx = 10, divy = 2, digit = 6, ref = 75, cycle = 75},
			{id = "oadx+-judgen-pr", src = "src-oadx+judge", x = 77, y = 105, w = 170, h = 70, divx = 10, divy = 2, digit = 6, ref = 75, cycle = 75},
			{id = "oadx+-judgen-ms", src = "src-oadx+judge", x = 77, y = 105, w = 170, h = 70, divx = 10, divy = 2, digit = 6, ref = 75, cycle = 75},
		}
		
		skin.text = {
			{id = "music-title",	font = 0, size = 24, align = 1, ref = 12, overflow = 1},
			{id = "music-genre",	font = 0, size = 24, align = 1, ref = 13, overflow = 1},
			{id = "music-artist",	font = 0, size = 24, align = 1, ref = 16, overflow = 1},
			{id = "table",			font = 0, size = 24, align = 1, ref = 1003, overflow = 1}
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
		
		skin.timingvisualizer = {{
			id = "timingvisualizer",
			lineColor = "00FF00FF",
			centerColor = "FFFFFFFF",
			PGColor = "00008888",
			GRColor = "00880088",
			GDColor = "88880088",
			BDColor = "88000088",
			PRColor = "00000088"
		}}
		
		-- 本体のバージョンによって入れ替わる事があるので注意
		if skin_config.option[op_consts.OP_7_NAME] == op_consts.OP_7_ITEM_NUMBER_1 then
			skin.note = {
				id = "notes",
				note =			{"note-1","note-2","note-3","note-4","note-5","note-6","note-7","note-s"},
				lnend =			{"lne-1","lne-2","lne-3","lne-4","lne-5","lne-6","lne-7","lne-s"},
				lnstart =		{"lns-1","lns-2","lns-3","lns-4","lns-5","lns-6","lns-7","lns-s"},
				lnbody =		{"lnb-1","lnb-2","lnb-3","lnb-4","lnb-5","lnb-6","lnb-7","lnb-s"},
				lnactive =		{"lna-1","lna-2","lna-3","lna-4","lna-5","lna-6","lna-7","lna-s"},
				hcnend =		{"hcne-1","hcne-2","hcne-3","hcne-4","hcne-5","hcne-6","hcne-7","hcne-s"},
				hcnstart =		{"hcns-1","hcns-2","hcns-3","hcns-4","hcns-5","hcns-6","hcns-7","hcns-s"},
				hcnbody =		{"hcnb-1","hcnb-2","hcnb-3","hcnb-4","hcnb-5","hcnb-6","hcnb-7","hcnb-s"},
				hcnactive =		{"hcna-1","hcna-2","hcna-3","hcna-4","hcna-5","hcna-6","hcna-7","hcna-s"},
				hcndamage =		{"hcnd-1","hcnd-2","hcnd-3","hcnd-4","hcnd-5","hcnd-6","hcnd-7","hcnd-s"},
				hcnreactive =	{"hcnr-1","hcnr-2","hcnr-3","hcnr-4","hcnr-5","hcnr-6","hcnr-7","hcnr-s"},
				mine =			{"mine-1","mine-2","mine-3","mine-4","mine-5","mine-6","mine-7","mine-s"},
				hidden = {},
				processed = {},
				size = note_height,
				dst = {},
				group =	{{id = "section-line", offset = 3, dst = {{x = lane_origin_x, y = lane_origin_y, w = lanes_width, h = 1, r = 128, g = 128, b = 128, a = barline_opacity}}}},
				time =	{{id = "section-line", offset = 3, dst = {{x = lane_origin_x, y = lane_origin_y, w = lanes_width, h = 1, r = 64,  g = 192, b = 192, a = barline_opacity}}}},
				bpm =	{{id = "section-line", offset = 3, dst = {{x = lane_origin_x, y = lane_origin_y, w = lanes_width, h = 2, r = 0,   g = 192, b = 0,   a = barline_opacity}}}},
				stop =	{{id = "section-line", offset = 3, dst = {{x = lane_origin_x, y = lane_origin_y, w = lanes_width, h = 2, r = 192, g = 192, b = 0,   a = barline_opacity}}}}
			}
			for i = 1, 8 do table.insert(skin.note.dst, {x = note_x[i], y = lane_origin_y, w = note_width[i], h = lane_height}) end
		else
			local oadx_notes_offset = 0
			for i, v in pairs(note_height) do
				if oadx_notes_offset < v then oadx_notes_offset = v end
			end
			oadx_notes_offset = oadx_notes_offset / 3

			skin.note = {
				id = "notes",
				note =			{"note-w","note-b","note-w","note-b","note-w","note-b","note-w","note-s"},
				lnend =			{"lne-w","lne-b","lne-w","lne-b","lne-w","lne-b","lne-w","lne-s"},
				lnstart =		{"lns-w","lns-b","lns-w","lns-b","lns-w","lns-b","lns-w","lns-s"},
				lnbody =		{"lnb-w","lnb-b","lnb-w","lnb-b","lnb-w","lnb-b","lnb-w","lnb-s"},
				lnactive =		{"lna-w","lna-b","lna-w","lna-b","lna-w","lna-b","lna-w","lna-s"},
				hcnend =		{"lne-w","lne-b","lne-w","lne-b","lne-w","lne-b","lne-w","lne-s"},
				hcnstart =		{"lns-w","lns-b","lns-w","lns-b","lns-w","lns-b","lns-w","lns-s"},
				hcnbody =		{"lnb-w","lnb-b","lnb-w","lnb-b","lnb-w","lnb-b","lnb-w","lnb-s"},
				hcnactive =		{"lna-w","lna-b","lna-w","lna-b","lna-w","lna-b","lna-w","lna-s"},
				hcndamage =		{"lnb-w","lnb-b","lnb-w","lnb-b","lnb-w","lnb-b","lnb-w","lnb-s"},
				hcnreactive =	{"lna-w","lna-b","lna-w","lna-b","lna-w","lna-b","lna-w","lna-s"},
				mine =			{"mine-w","mine-b","mine-w","mine-b","mine-w","mine-b","mine-w","mine-s"},
				hidden = {},
				processed = {},
				size = note_height,
				dst = {},
				group =	{{id = "section-line", offset = 3, dst = {{x = lane_origin_x, y = lane_origin_y, w = lanes_width, h = 1, r = 128, g = 128, b = 128, a = barline_opacity}}}},
				time =	{{id = "section-line", offset = 3, dst = {{x = lane_origin_x, y = lane_origin_y, w = lanes_width, h = 1, r = 64,  g = 192, b = 192, a = barline_opacity}}}},
				bpm =	{{id = "section-line", offset = 3, dst = {{x = lane_origin_x, y = lane_origin_y, w = lanes_width, h = 2, r = 0,   g = 192, b = 0,   a = barline_opacity}}}},
				stop =	{{id = "section-line", offset = 3, dst = {{x = lane_origin_x, y = lane_origin_y, w = lanes_width, h = 2, r = 192, g = 192, b = 0,   a = barline_opacity}}}}
			}
			for i = 1, 8 do table.insert(skin.note.dst, {x = note_x[i], y = lane_origin_y - oadx_notes_offset, w = note_width[i], h = lane_height}) end
		end
		
		skin.gauge = {
			id = "gauge",
			nodes = {"gauge-n1","gauge-n2","gauge-n3","gauge-n4","gauge-e1","gauge-e2","gauge-e3","gauge-e4"},
			parts = gauge_scale
		}
		
		local judge_images = {}
		local judge_numbers = {}
		do
			local judge_types = {"pg","gr","gd","bd","pr","ms"}
			if skin_config.option[op_consts.OP_6_NAME] == op_consts.OP_6_ITEM_NUMBER_1 then
				for i, v in ipairs(judge_types) do
					if v == "bd" then judge_f_x = lanes_center_x - (judge_f_width / 2) end
					table.insert(judge_images, {id = "judgef-" .. v, filter = 1, loop = -1, timer = 46, offsets = {3,32}, dst = {{time = 0, x = judge_f_x, y = judge_f_y, w = judge_f_width, h = judge_f_height},{time = 500}}})
					table.insert(judge_numbers, {id = "judgen-" .. v, filter = 1, loop = -1, timer = 46, dst = {{time = 0, x = judge_n_x, y = judge_n_y, w = judge_n_width, h = judge_n_height},{time = 500}}})
				end	
			elseif skin_config.option[op_consts.OP_6_NAME] == op_consts.OP_6_ITEM_NUMBER_2 then
				for i, v in ipairs(judge_types) do
					table.insert(judge_images, {id = "oadx+-judgef-" .. v, loop = -1, filter = 1, timer = 46 ,offsets = {3,32}, dst = {{time = 0, x = judge_f_x, y = judge_y, w = judge_f_width, h = judge_f_height},{time = 500}}})
					table.insert(judge_numbers, {id = "oadx+-judgen-" .. v, loop = -1, filter = 1, timer = 46, dst = {{time = 0, x = judge_n_x, y = 0, w = judge_n_width, h = judge_n_height},{time = 500}}})
				end	
			elseif skin_config.option[op_consts.OP_6_NAME] == op_consts.OP_6_ITEM_NUMBER_3 then
				for i, v in ipairs(judge_types) do
					table.insert(judge_images, {id = "oadx+-judgef-" .. v, loop = -1, filter = 1, timer = 46 ,offsets = {3,32}, dst = {{time = 0, x = judge_f_x, y = judge_y, w = judge_f_width, h = judge_f_height},{time = 500}}})
					table.insert(judge_numbers, {id = "oadx+-judgen-" .. v, loop = -1, filter = 1, timer = 46, dst = {{time = 0, x = judge_n_x, y = 0, w = judge_n_width, h = judge_n_height},{time = 500}}})
				end	
			end
		end	
		skin.judge = {{id = "judge", index = 0, images = judge_images, numbers = judge_numbers, shift = judge_shift}}

		skin.bga = {id = "bga"}

		skin.destination = {
			-- 背景の表示
			{id = -110, dst = {{x = 0, y = 0, w = 1920, h = 1080}}},
			{id = "background", stretch = 3, dst = {{x = 0, y = 0, w = 1920, h = 1080, a = background_opacity}}},
			
			-- BGBGAの表示
			{id = -110, op = {op_consts.DISP_12_NUMBER_3}, dst = {{x = 0, y = 0, w = 1920, h = 1080}}},
			{id = "bga", op = {op_consts.DISP_12_NUMBER_3}, stretch = 3, dst = {{x = 0, y = 0, w = 1920, h = 1080, a = bga_opacity}}},
			{id = "no-bga-image", timer = 41, op = {170, op_consts.DISP_12_NUMBER_3}, stretch = 3, dst = {{x = 0, y = 0, w = 1920, h = 1080, a = bga_opacity}}},
			
			-- BGAの表示
			{id = -110, op = {op_consts.DISP_12_NUMBER_2}, dst = {{x = bga_x, y = bga_y, w = bga_width, h = bga_height}}},
			{id = "bga", op = {op_consts.DISP_12_NUMBER_2}, stretch = 1, dst = {{x = bga_x, y = bga_y, w = bga_width, h = bga_height, a = bga_opacity}}},
			{id = "no-bga-image", timer = 41, op = {170, op_consts.DISP_12_NUMBER_2}, stretch = 1, dst = {{x = bga_x, y = bga_y, w = bga_width, h = bga_height, a = bga_opacity}}},
			
			-- タイトルの表示
			{id = "music-title",	filter = 1, loop = 0, op = {op_consts.DISP_11_NUMBER_2},	dst = {{time = 0, x = title_x, y = title_y, w = title_width, h = 24, a = 0},				{time = 100, a = 255},	{time = 1900},{time = 2000, a = 0},{time = 8000}}},
			{id = "music-genre",	filter = 1, loop = 0, op = {op_consts.DISP_11_NUMBER_2},	dst = {{time = 0, x = title_x, y = title_y, w = title_width, h = 24, a = 0},{time = 2000},{time = 2100, a = 255},	{time = 3900},{time = 4000, a = 0},{time = 8000}}},
			{id = "music-artist",	filter = 1, loop = 0, op = {op_consts.DISP_11_NUMBER_2},	dst = {{time = 0, x = title_x, y = title_y, w = title_width, h = 24, a = 0},{time = 4000},{time = 4100, a = 255},	{time = 5900},{time = 6000, a = 0},{time = 8000}}},
			{id = "table",			filter = 1, loop = 0, op = {op_consts.DISP_11_NUMBER_2},	dst = {{time = 0, x = title_x, y = title_y, w = title_width, h = 24, a = 0},{time = 6000},{time = 6100, a = 255},	{time = 7900},{time = 8000, a = 0}}},
			
			-- BPMの表示
			{id = "bpm-s", op = {op_consts.DISP_10_NUMBER_2},	dst = {{x = bpm_x + 129, y = bpm_y + 30, w = 45, h = 17}}},
			{id = "nowbpm", op = {op_consts.DISP_10_NUMBER_2},	dst = {{x = bpm_x + 104, y = bpm_y, w = 24, h = 24}}},
			
			-- BPM(min+max)の表示
			{id = "bpm-s", op = {op_consts.DISP_10_NUMBER_3},	dst = {{x = bpm_x + 78, y = bpm_y + 30, w = 45, h = 17}}},
			{id = "minbpm", op = {op_consts.DISP_10_NUMBER_3},	dst = {{x = bpm_x, y = bpm_y, w = 13, h = 17}}},
			{id = "nowbpm", op = {op_consts.DISP_10_NUMBER_3},	dst = {{x = bpm_x + 52, y = bpm_y, w = 24, h = 24}}},
			{id = "maxbpm", op = {op_consts.DISP_10_NUMBER_3},	dst = {{x = bpm_x + 148, y = bpm_y, w = 13, h = 17}}},

			-- グルーヴゲージの表示
			{id = "gauge", op = {op_consts.DISP_9_NUMBER_2},				dst = {{x = gauge_x, y = gauge_y, w = gauge_width, h = gauge_height}}},
			{id = "groovegauge", op = {op_consts.DISP_9_NUMBER_2},			dst = {{x = gauge_num_x, y = gauge_num_y, w = 26, h = 28}}},
			{id = "dot-gauge", op = {op_consts.DISP_9_NUMBER_2},			dst = {{x = gauge_num_x + 78, y = gauge_num_y, w = 8, h = 28}}},
			{id = "groovegauge-afterdot", op = {op_consts.DISP_9_NUMBER_2},	dst = {{x = gauge_num_x + 86, y = gauge_num_y, w = 26, h = 28}}},		

			-- スコアグラフの表示(1P)
			{id = "scoregraph-frame", op = {op_consts.DISP_3_NUMBER_2},		dst = {{x = graph_x, y = graph_y, w = 221, h = 708}}},
			{id = "graph-now-p", op = {op_consts.DISP_3_NUMBER_2},			dst = {{x = graph_x + 45, y = graph_y + 3, w = 40, h = 702}}},
			{id = "graph-now", op = {op_consts.DISP_3_NUMBER_2},			dst = {{x = graph_x + 45, y = graph_y + 3, w = 40, h = 702}}},
			{id = "graph-best-f", op = {op_consts.DISP_3_NUMBER_2},			dst = {{x = graph_x + 110, y = graph_y + 3, w = 40, h = 702}}},
			{id = "graph-best", op = {op_consts.DISP_3_NUMBER_2},			dst = {{x = graph_x + 110, y = graph_y + 3, w = 40, h = 702}}},
			{id = "graph-target-f", op = {op_consts.DISP_3_NUMBER_2},		dst = {{x = graph_x + 175, y = graph_y + 3, w = 40, h = 702}}},
			{id = "graph-target", op = {op_consts.DISP_3_NUMBER_2},			dst = {{x = graph_x + 175, y = graph_y + 3, w = 40, h = 702}}},
			{id = "scoregraph-line", op = {222, op_consts.DISP_3_NUMBER_2},	dst = {{x = graph_x + 11, y = graph_y + 470, w = 209, h = 1}}},
			{id = "scoregraph-line", op = {221, op_consts.DISP_3_NUMBER_2},	dst = {{x = graph_x + 21, y = graph_y + 548, w = 199, h = 1}}},
			{id = "scoregraph-line", op = {220, op_consts.DISP_3_NUMBER_2},	dst = {{x = graph_x + 31, y = graph_y + 626, w = 189, h = 1}}},
			
			-- スコアグラフの表示(2P)
			{id = "scoregraph-frame", op = {op_consts.DISP_3_NUMBER_3},		dst = {{x = graph_x + 221, y = graph_y, w = -221, h = 708}}},
			{id = "graph-now-p", op = {op_consts.DISP_3_NUMBER_3},			dst = {{x = graph_x + 136, y = graph_y + 3, w = 40, h = 702}}},
			{id = "graph-now", op = {op_consts.DISP_3_NUMBER_3},			dst = {{x = graph_x + 136, y = graph_y + 3, w = 40, h = 702}}},
			{id = "graph-best-f", op = {op_consts.DISP_3_NUMBER_3},			dst = {{x = graph_x + 71, y = graph_y + 3, w = 40, h = 702}}},
			{id = "graph-best", op = {op_consts.DISP_3_NUMBER_3},			dst = {{x = graph_x + 71, y = graph_y + 3, w = 40, h = 702}}},
			{id = "graph-target-f", op = {op_consts.DISP_3_NUMBER_3},		dst = {{x = graph_x + 6, y = graph_y + 3, w = 40, h = 702}}},
			{id = "graph-target", op = {op_consts.DISP_3_NUMBER_3},			dst = {{x = graph_x + 6, y = graph_y + 3, w = 40, h = 702}}},
			{id = "scoregraph-line", op = {222, op_consts.DISP_3_NUMBER_3},	dst = {{x = graph_x + 1, y = graph_y + 470, w = 209, h = 1}}},
			{id = "scoregraph-line", op = {221, op_consts.DISP_3_NUMBER_3},	dst = {{x = graph_x + 1, y = graph_y + 548, w = 199, h = 1}}},
			{id = "scoregraph-line", op = {220, op_consts.DISP_3_NUMBER_3},	dst = {{x = graph_x + 1, y = graph_y + 626, w = 189, h = 1}}},

			-- マスコットの表示
			{id = "mascot", loop = 2000, op = {op_consts.DISP_13_NUMBER_2},	stretch = 9, dst = {{time = 0, x = mascot_x, y = mascot_y, w = 168, h = 271},{time = 2000}}},
			{id = "moving-mascot", loop = 2000, op = {op_consts.DISP_13_NUMBER_3},		 dst = {{time = 0, x = mascot_x, y = mascot_y, w = 168, h = 271},{time = 2000}}},

			-- EXスコアの表示
			{id = "exscore-s", op = {op_consts.DISP_4_NUMBER_2},	dst = {{x = exscore_x, y = exscore_y, w = 78, h = 17}}},
			{id = "exscore", op = {op_consts.DISP_4_NUMBER_2},		dst = {{x = exscore_x + 78, y = exscore_y, w = 13, h = 17}}},

			-- スコア差の表示
			{id = "diffscore-s", op = {op_consts.DISP_5_NUMBER_2},		dst = {{x = diffscore_x, y = diffscore_y, w = 65, h = 36}}},
			{id = "diff-hiscore", op = {op_consts.DISP_5_NUMBER_2},		dst = {{x = diffscore_x + 65, y = diffscore_y, w = 13, h = 17}}},
			{id = "diff-tgtscore", op = {op_consts.DISP_5_NUMBER_2},	dst = {{x = diffscore_x + 65, y = diffscore_y + 19, w = 13, h = 17}}},
			
			-- スコアレートの表示
			{id = "rate-s", op = {op_consts.DISP_6_NUMBER_2},			dst = {{x = rate_x, y = rate_y, w = 65, h = 17}}},
			{id = "rate", op = {op_consts.DISP_6_NUMBER_2},				dst = {{x = rate_x + 65, y = rate_y, w = 13, h = 17}}},
			{id = "dot", op = {op_consts.DISP_6_NUMBER_2},				dst = {{x = rate_x + 104, y = rate_y, w = 5, h = 5}}},
			{id = "rate-afterdot", op = {op_consts.DISP_6_NUMBER_2},	dst = {{x = rate_x + 109, y = rate_y, w = 13, h = 17}}},
			
			-- 推定ランクの表示
			{id = "f", op = {207, op_consts.DISP_15_NUMBER_2},		dst = {{x = rankpace_x, y = rankpace_y, w = 60, h = 24}}},
			{id = "e", op = {206, op_consts.DISP_15_NUMBER_2},		dst = {{x = rankpace_x, y = rankpace_y, w = 60, h = 24}}},
			{id = "d", op = {205, op_consts.DISP_15_NUMBER_2},		dst = {{x = rankpace_x, y = rankpace_y, w = 60, h = 24}}},
			{id = "c", op = {204, op_consts.DISP_15_NUMBER_2},		dst = {{x = rankpace_x, y = rankpace_y, w = 60, h = 24}}},
			{id = "b", op = {203, op_consts.DISP_15_NUMBER_2},		dst = {{x = rankpace_x, y = rankpace_y, w = 60, h = 24}}},
			{id = "a", op = {202, op_consts.DISP_15_NUMBER_2},		dst = {{x = rankpace_x, y = rankpace_y, w = 60, h = 24}}},
			{id = "aa", op = {201, op_consts.DISP_15_NUMBER_2},		dst = {{x = rankpace_x, y = rankpace_y, w = 60, h = 24}}},
			{id = "aaa", op = {200, op_consts.DISP_15_NUMBER_2},	dst = {{x = rankpace_x, y = rankpace_y, w = 60, h = 24}}},
			
			-- ジャッジカウントの表示
			{id = "judgecount-s", op = {op_consts.DISP_7_NUMBER_2},	dst = {{x = judgecount_x, y = judgecount_y, w = 39, h = 131}}},
			{id = "count-cb", op = {op_consts.DISP_7_NUMBER_2},		dst = {{x = judgecount_x + 39, y = judgecount_y, w = 13, h = 17}}},
			{id = "count-kp", op = {op_consts.DISP_7_NUMBER_2},		dst = {{x = judgecount_x + 39, y = judgecount_y + 19, w = 13, h = 17}}},
			{id = "count-pr", op = {op_consts.DISP_7_NUMBER_2},		dst = {{x = judgecount_x + 39, y = judgecount_y + 38, w = 13, h = 17}}},
			{id = "count-bd", op = {op_consts.DISP_7_NUMBER_2},		dst = {{x = judgecount_x + 39, y = judgecount_y + 57, w = 13, h = 17}}},
			{id = "count-gd", op = {op_consts.DISP_7_NUMBER_2},		dst = {{x = judgecount_x + 39, y = judgecount_y + 76, w = 13, h = 17}}},
			{id = "count-gr", op = {op_consts.DISP_7_NUMBER_2},		dst = {{x = judgecount_x + 39, y = judgecount_y + 95, w = 13, h = 17}}},
			{id = "count-pg", op = {op_consts.DISP_7_NUMBER_2},		dst = {{x = judgecount_x + 39, y = judgecount_y + 114, w = 13, h = 17}}},
			
			-- ジャッジカウント(+FAST/SLOW)の表示
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

			-- MAXコンボの表示
			{id = "maxcombo-s", op = {op_consts.DISP_8_NUMBER_2},	dst = {{x = maxcombo_x, y = maxcombo_y, w = 78, h = 17}}},
			{id = "maxcombo", op = {op_consts.DISP_8_NUMBER_2},	dst = {{x = maxcombo_x + 78, y = maxcombo_y, w = 13, h = 17}}},
			
			-- ターンテーブルの表示
			{id = "sc-base", filter = 1, stretch = 4,				dst = {{x = lane_x[8], y = key_y, w = lane_width[8], h = key_height}}},
			{id = "sc-table", filter = 1, stretch = 4,				dst = {{x = sc_image_x, y = key_y, w = sc_image_width, h = key_height}}},
			{id = "sc-record", filter = 1, stretch = 4, offset = 1, dst = {{x = sc_image_x, y = key_y, w = sc_image_width, h = key_height}}},

			-- 鍵盤の表示
			{id = "key-w", filter = 1,				 dst = {{x = key_w_x[1], y = key_y, w = key_w_width[1], h = key_height}}},
			{id = "key-b", filter = 1,				 dst = {{x = lane_x[2], y = key_y, w = lane_width[2], h = key_height}}},
			{id = "key-w", filter = 1,				 dst = {{x = key_w_x[3], y = key_y, w = key_w_width[3], h = key_height}}},
			{id = "key-b", filter = 1,				 dst = {{x = lane_x[4], y = key_y, w = lane_width[4], h = key_height}}},
			{id = "key-w", filter = 1,				 dst = {{x = key_w_x[5], y = key_y, w = key_w_width[5], h = key_height}}},
			{id = "key-b", filter = 1,				 dst = {{x = lane_x[6], y = key_y, w = lane_width[6], h = key_height}}},
			{id = "key-w", filter = 1,				 dst = {{x = key_w_x[7], y = key_y, w = key_w_width[7], h = key_height}}},
			
			-- キーフラッシュの表示
			{id = "key-wf", filter = 1, timer = 101, dst = {{x = key_w_x[1], y = key_y, w = key_w_width[1], h = key_height}}},
			{id = "key-bf", filter = 1, timer = 102, dst = {{x = lane_x[2], y = key_y, w = lane_width[2], h = key_height}}},
			{id = "key-wf", filter = 1, timer = 103, dst = {{x = key_w_x[3], y = key_y, w = key_w_width[3], h = key_height}}},
			{id = "key-bf", filter = 1, timer = 104, dst = {{x = lane_x[4], y = key_y, w = lane_width[4], h = key_height}}},
			{id = "key-wf", filter = 1, timer = 105, dst = {{x = key_w_x[5], y = key_y, w = key_w_width[5], h = key_height}}},
			{id = "key-bf", filter = 1, timer = 106, dst = {{x = lane_x[6], y = key_y, w = lane_width[6], h = key_height}}},
			{id = "key-wf", filter = 1, timer = 107, dst = {{x = key_w_x[7], y = key_y, w = key_w_width[7], h = key_height}}},
			
			-- レーンの表示
			{id = "lane-bg", dst = {{x = lane_origin_x, y = lane_origin_y, w = lanes_width, h = lane_height, a = lanebg_opacity}}},	
			{id = "lane-1", dst = {{x = lane_x[1], y = lane_origin_y, w = lane_width[1], h = lane_height, a = lane_opacity}}},
			{id = "lane-2", dst = {{x = lane_x[2], y = lane_origin_y, w = lane_width[2], h = lane_height, a = lane_opacity}}},
			{id = "lane-3", dst = {{x = lane_x[3], y = lane_origin_y, w = lane_width[3], h = lane_height, a = lane_opacity}}},
			{id = "lane-4", dst = {{x = lane_x[4], y = lane_origin_y, w = lane_width[4], h = lane_height, a = lane_opacity}}},
			{id = "lane-5", dst = {{x = lane_x[5], y = lane_origin_y, w = lane_width[5], h = lane_height, a = lane_opacity}}},
			{id = "lane-6", dst = {{x = lane_x[6], y = lane_origin_y, w = lane_width[6], h = lane_height, a = lane_opacity}}},
			{id = "lane-7", dst = {{x = lane_x[7], y = lane_origin_y, w = lane_width[7], h = lane_height, a = lane_opacity}}},
			{id = "lane-s", dst = {{x = lane_x[8], y = lane_origin_y, w = lane_width[8], h = lane_height, a = lane_opacity}}},
			{id = "lane-line", dst = {{x = line_x[2], y = lane_origin_y, w = lane_line_px, h = lane_height, a = lane_line_opacity}}},
			{id = "lane-line", dst = {{x = line_x[3], y = lane_origin_y, w = lane_line_px, h = lane_height, a = lane_line_opacity}}},
			{id = "lane-line", dst = {{x = line_x[4], y = lane_origin_y, w = lane_line_px, h = lane_height, a = lane_line_opacity}}},
			{id = "lane-line", dst = {{x = line_x[5], y = lane_origin_y, w = lane_line_px, h = lane_height, a = lane_line_opacity}}},
			{id = "lane-line", dst = {{x = line_x[6], y = lane_origin_y, w = lane_line_px, h = lane_height, a = lane_line_opacity}}},
			{id = "lane-line", dst = {{x = line_x[7], y = lane_origin_y, w = lane_line_px, h = lane_height, a = lane_line_opacity}}},
			{id = "lane-line", dst = {{x = line_x[8], y = lane_origin_y, w = lane_line_px, h = lane_height, a = lane_line_opacity}}},
			{id = "lane-outline", dst = {{x = outline_x[1], y = lane_origin_y, w = lane_outline_px, h = lane_height, a = lane_outline_opacity}}},
			{id = "lane-outline", dst = {{x = outline_x[2], y = lane_origin_y, w = lane_outline_px, h = lane_height, a = lane_outline_opacity}}},
			{id = "lane-outline", dst = {{x = outline_x[1], y = under_outline_y, w = under_outline_width, h = lane_outline_px, a = lane_outline_opacity}}},
			
			-- グローの表示
			{id = "glow", timer = 40, loop = 500, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, blend = 2,	dst = {{time = 0, x = lane_origin_x, y = lane_origin_y, w = lanes_width, h = glow_height, a = 0},{time = 500, a = glow_opacity / 4}}},
			{id = "glow", timer = 140, loop = 0, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, blend = 2,	dst = {{time = 0, x = lane_origin_x, y = lane_origin_y, w = lanes_width, h = glow_height, a = glow_opacity},{time = 1000, a = 0}}},
			
			-- 判定ラインの表示
			{id = "judgeline", timer = 40, offset = 3, offsets = {offset_consts.OFFSET_1_ID},		dst = {{x = lane_origin_x, y = lane_origin_y, w = lanes_width, h = judgeline_height, a = judgeline_opacity}}},
			{id = "load-progress", offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {80},	dst = {{x = lane_origin_x, y = lane_origin_y, w = lanes_width, h = judgeline_height, a = judgeline_opacity}}},
			
			-- キービームの表示
			-- キーオン
			{id = "keybeam1", timer = 101, loop = keybeam_time_key_on, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_5_ITEM_NUMBER_1},									dst = {{time = 0, x = keybeam_key_on_x[1], y = lane_origin_y, w = keybeam_key_on_width[1], h = keybeam_height, a = 0},{time = keybeam_time_key_on, x = lane_x[1], w = lane_width[1], a = keybeam_opacity}}},
			{id = "keybeam2", timer = 102, loop = keybeam_time_key_on, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_5_ITEM_NUMBER_1},									dst = {{time = 0, x = keybeam_key_on_x[2], y = lane_origin_y, w = keybeam_key_on_width[2], h = keybeam_height, a = 0},{time = keybeam_time_key_on, x = lane_x[2], w = lane_width[2], a = keybeam_opacity}}},
			{id = "keybeam3", timer = 103, loop = keybeam_time_key_on, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_5_ITEM_NUMBER_1},									dst = {{time = 0, x = keybeam_key_on_x[3], y = lane_origin_y, w = keybeam_key_on_width[3], h = keybeam_height, a = 0},{time = keybeam_time_key_on, x = lane_x[3], w = lane_width[3], a = keybeam_opacity}}},
			{id = "keybeam4", timer = 104, loop = keybeam_time_key_on, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_5_ITEM_NUMBER_1},									dst = {{time = 0, x = keybeam_key_on_x[4], y = lane_origin_y, w = keybeam_key_on_width[4], h = keybeam_height, a = 0},{time = keybeam_time_key_on, x = lane_x[4], w = lane_width[4], a = keybeam_opacity}}},
			{id = "keybeam5", timer = 105, loop = keybeam_time_key_on, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_5_ITEM_NUMBER_1},									dst = {{time = 0, x = keybeam_key_on_x[5], y = lane_origin_y, w = keybeam_key_on_width[5], h = keybeam_height, a = 0},{time = keybeam_time_key_on, x = lane_x[5], w = lane_width[5], a = keybeam_opacity}}},
			{id = "keybeam6", timer = 106, loop = keybeam_time_key_on, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_5_ITEM_NUMBER_1},									dst = {{time = 0, x = keybeam_key_on_x[6], y = lane_origin_y, w = keybeam_key_on_width[6], h = keybeam_height, a = 0},{time = keybeam_time_key_on, x = lane_x[6], w = lane_width[6], a = keybeam_opacity}}},
			{id = "keybeam7", timer = 107, loop = keybeam_time_key_on, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_5_ITEM_NUMBER_1},									dst = {{time = 0, x = keybeam_key_on_x[7], y = lane_origin_y, w = keybeam_key_on_width[7], h = keybeam_height, a = 0},{time = keybeam_time_key_on, x = lane_x[7], w = lane_width[7], a = keybeam_opacity}}},
			{id = "keybeams", timer = 100, loop = keybeam_time_key_on, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_5_ITEM_NUMBER_1, op_consts.OP_2_ITEM_NUMBER_1,},	dst = {{time = 0, x = keybeam_key_on_x[8], y = lane_origin_y, w = keybeam_key_on_width[8], h = keybeam_height, a = 0},{time = keybeam_time_key_on, x = lane_x[8], w = lane_width[8], a = keybeam_opacity}}},
			-- キーオフ
			{id = "keybeam1", timer = 121, loop = -1, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_5_ITEM_NUMBER_1},								dst = {{time = 0, x = lane_x[1], y = lane_origin_y, w = lane_width[1], h = keybeam_height, a = keybeam_opacity},{time = keybeam_time_key_off, x = keybeam_key_off_x[1], w = keybeam_key_off_width[1], a = 0}}},
			{id = "keybeam2", timer = 122, loop = -1, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_5_ITEM_NUMBER_1},								dst = {{time = 0, x = lane_x[2], y = lane_origin_y, w = lane_width[2], h = keybeam_height, a = keybeam_opacity},{time = keybeam_time_key_off, x = keybeam_key_off_x[2], w = keybeam_key_off_width[2], a = 0}}},
			{id = "keybeam3", timer = 123, loop = -1, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_5_ITEM_NUMBER_1},								dst = {{time = 0, x = lane_x[3], y = lane_origin_y, w = lane_width[3], h = keybeam_height, a = keybeam_opacity},{time = keybeam_time_key_off, x = keybeam_key_off_x[3], w = keybeam_key_off_width[3], a = 0}}},
			{id = "keybeam4", timer = 124, loop = -1, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_5_ITEM_NUMBER_1},								dst = {{time = 0, x = lane_x[4], y = lane_origin_y, w = lane_width[4], h = keybeam_height, a = keybeam_opacity},{time = keybeam_time_key_off, x = keybeam_key_off_x[4], w = keybeam_key_off_width[4], a = 0}}},
			{id = "keybeam5", timer = 125, loop = -1, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_5_ITEM_NUMBER_1},								dst = {{time = 0, x = lane_x[5], y = lane_origin_y, w = lane_width[5], h = keybeam_height, a = keybeam_opacity},{time = keybeam_time_key_off, x = keybeam_key_off_x[5], w = keybeam_key_off_width[5], a = 0}}},
			{id = "keybeam6", timer = 126, loop = -1, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_5_ITEM_NUMBER_1},								dst = {{time = 0, x = lane_x[6], y = lane_origin_y, w = lane_width[6], h = keybeam_height, a = keybeam_opacity},{time = keybeam_time_key_off, x = keybeam_key_off_x[6], w = keybeam_key_off_width[6], a = 0}}},
			{id = "keybeam7", timer = 127, loop = -1, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_5_ITEM_NUMBER_1},								dst = {{time = 0, x = lane_x[7], y = lane_origin_y, w = lane_width[7], h = keybeam_height, a = keybeam_opacity},{time = keybeam_time_key_off, x = keybeam_key_off_x[7], w = keybeam_key_off_width[7], a = 0}}},
			{id = "keybeams", timer = 120, loop = -1, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_5_ITEM_NUMBER_1, op_consts.OP_2_ITEM_NUMBER_1},	dst = {{time = 0, x = lane_x[8], y = lane_origin_y, w = lane_width[8], h = keybeam_height, a = keybeam_opacity},{time = keybeam_time_key_off, x = keybeam_key_off_x[8], w = keybeam_key_off_width[8], a = 0}}},
			-- スクラッチキービーム(MOMENT)
			{id = "keybeams", timer = 100, loop = -1, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_5_ITEM_NUMBER_1, op_consts.OP_2_ITEM_NUMBER_2}, dst = {
				{time = 0, x = keybeam_key_on_x[8], y = lane_origin_y, w = keybeam_key_on_width[8], h = keybeam_height, a = 0},
				{time = keybeam_time_key_on, x = lane_x[8], w = lane_width[8], a = keybeam_opacity},
				{time = keybeam_time_key_on + keybeam_time_key_off, x = keybeam_key_off_x[8], w = keybeam_key_off_width[8], a = 0}
			}},
			
			-- キービームの表示(OADX+)
			-- キーオン
			{id = "oadx+keybeam-w", timer = 101, loop = keybeam_time_key_on, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_5_ITEM_NUMBER_2},								dst = {{time = 0, x = keybeam_key_on_x[1], y = lane_origin_y, w = keybeam_key_on_width[1], h = keybeam_height, a = 0},{time = keybeam_time_key_on, x = lane_x[1], w = lane_width[1], a = keybeam_opacity}}},
			{id = "oadx+keybeam-b", timer = 102, loop = keybeam_time_key_on, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_5_ITEM_NUMBER_2},								dst = {{time = 0, x = keybeam_key_on_x[2], y = lane_origin_y, w = keybeam_key_on_width[2], h = keybeam_height, a = 0},{time = keybeam_time_key_on, x = lane_x[2], w = lane_width[2], a = keybeam_opacity}}},
			{id = "oadx+keybeam-w", timer = 103, loop = keybeam_time_key_on, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_5_ITEM_NUMBER_2},								dst = {{time = 0, x = keybeam_key_on_x[3], y = lane_origin_y, w = keybeam_key_on_width[3], h = keybeam_height, a = 0},{time = keybeam_time_key_on, x = lane_x[3], w = lane_width[3], a = keybeam_opacity}}},
			{id = "oadx+keybeam-b", timer = 104, loop = keybeam_time_key_on, offset = 3, offsets = {offset_consts.OFFSET_1_ID},	op = {op_consts.OP_5_ITEM_NUMBER_2},								dst = {{time = 0, x = keybeam_key_on_x[4], y = lane_origin_y, w = keybeam_key_on_width[4], h = keybeam_height, a = 0},{time = keybeam_time_key_on, x = lane_x[4], w = lane_width[4], a = keybeam_opacity}}},
			{id = "oadx+keybeam-w", timer = 105, loop = keybeam_time_key_on, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_5_ITEM_NUMBER_2},								dst = {{time = 0, x = keybeam_key_on_x[5], y = lane_origin_y, w = keybeam_key_on_width[5], h = keybeam_height, a = 0},{time = keybeam_time_key_on, x = lane_x[5], w = lane_width[5], a = keybeam_opacity}}},
			{id = "oadx+keybeam-b", timer = 106, loop = keybeam_time_key_on, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_5_ITEM_NUMBER_2},								dst = {{time = 0, x = keybeam_key_on_x[6], y = lane_origin_y, w = keybeam_key_on_width[6], h = keybeam_height, a = 0},{time = keybeam_time_key_on, x = lane_x[6], w = lane_width[6], a = keybeam_opacity}}},
			{id = "oadx+keybeam-w", timer = 107, loop = keybeam_time_key_on, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_5_ITEM_NUMBER_2},								dst = {{time = 0, x = keybeam_key_on_x[7], y = lane_origin_y, w = keybeam_key_on_width[7], h = keybeam_height, a = 0},{time = keybeam_time_key_on, x = lane_x[7], w = lane_width[7], a = keybeam_opacity}}},
			{id = "oadx+keybeam-s", timer = 100, loop = keybeam_time_key_on, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_5_ITEM_NUMBER_2, op_consts.OP_2_ITEM_NUMBER_1},	dst = {{time = 0, x = keybeam_key_on_x[8], y = lane_origin_y, w = keybeam_key_on_width[8], h = keybeam_height, a = 0},{time = keybeam_time_key_on, x = lane_x[8], w = lane_width[8], a = keybeam_opacity}}},
			-- キーオフ
			{id = "oadx+keybeam-w", timer = 121, loop = -1, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_5_ITEM_NUMBER_2},									dst = {{time = 0, x = lane_x[1], y = lane_origin_y, w = lane_width[1], h = keybeam_height, a = keybeam_opacity},{time = keybeam_time_key_off, x = keybeam_key_off_x[1], w = keybeam_key_off_width[1], a = 0}}},
			{id = "oadx+keybeam-b", timer = 122, loop = -1, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_5_ITEM_NUMBER_2},									dst = {{time = 0, x = lane_x[2], y = lane_origin_y, w = lane_width[2], h = keybeam_height, a = keybeam_opacity},{time = keybeam_time_key_off, x = keybeam_key_off_x[2], w = keybeam_key_off_width[2], a = 0}}},
			{id = "oadx+keybeam-w", timer = 123, loop = -1, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_5_ITEM_NUMBER_2},									dst = {{time = 0, x = lane_x[3], y = lane_origin_y, w = lane_width[3], h = keybeam_height, a = keybeam_opacity},{time = keybeam_time_key_off, x = keybeam_key_off_x[3], w = keybeam_key_off_width[3], a = 0}}},
			{id = "oadx+keybeam-b", timer = 124, loop = -1, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_5_ITEM_NUMBER_2},									dst = {{time = 0, x = lane_x[4], y = lane_origin_y, w = lane_width[4], h = keybeam_height, a = keybeam_opacity},{time = keybeam_time_key_off, x = keybeam_key_off_x[4], w = keybeam_key_off_width[4], a = 0}}},
			{id = "oadx+keybeam-w", timer = 125, loop = -1, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_5_ITEM_NUMBER_2},									dst = {{time = 0, x = lane_x[5], y = lane_origin_y, w = lane_width[5], h = keybeam_height, a = keybeam_opacity},{time = keybeam_time_key_off, x = keybeam_key_off_x[5], w = keybeam_key_off_width[5], a = 0}}},
			{id = "oadx+keybeam-b", timer = 126, loop = -1, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_5_ITEM_NUMBER_2},									dst = {{time = 0, x = lane_x[6], y = lane_origin_y, w = lane_width[6], h = keybeam_height, a = keybeam_opacity},{time = keybeam_time_key_off, x = keybeam_key_off_x[6], w = keybeam_key_off_width[6], a = 0}}},
			{id = "oadx+keybeam-w", timer = 127, loop = -1, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_5_ITEM_NUMBER_2},									dst = {{time = 0, x = lane_x[7], y = lane_origin_y, w = lane_width[7], h = keybeam_height, a = keybeam_opacity},{time = keybeam_time_key_off, x = keybeam_key_off_x[7], w = keybeam_key_off_width[7], a = 0}}},
			{id = "oadx+keybeam-s", timer = 120, loop = -1, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_5_ITEM_NUMBER_2, op_consts.OP_2_ITEM_NUMBER_1},	dst = {{time = 0, x = lane_x[8], y = lane_origin_y, w = lane_width[8], h = keybeam_height, a = keybeam_opacity},{time = keybeam_time_key_off, x = keybeam_key_off_x[8], w = keybeam_key_off_width[8], a = 0}}},
			-- スクラッチキービーム(MOMENT)
			{id = "oadx+keybeam-s", timer = 100, loop = -1, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_5_ITEM_NUMBER_2, op_consts.OP_2_ITEM_NUMBER_1}, dst = {
				{time = 0, x = keybeam_key_on_x[8], y = lane_origin_y, w = keybeam_key_on_width[8], h = keybeam_height, a = 0},
				{time = keybeam_time_key_on, x = lane_x[8], w = lane_width[8], a = keybeam_opacity},
				{time = keybeam_time_key_on + keybeam_time_key_off, x = keybeam_key_off_x[8], w = keybeam_key_off_width[8], a = 0}
			}},

			{id = "liftcover", stretch = 3, offsets = {offset_consts.OFFSET_1_ID}, dst = {{x = lane_origin_x, y = lane_origin_y - lane_height, w = lanes_width, h = lane_height}}},
			
			{id = "notes"},
			
			{id = "lanecover", stretch = 3,		dst = {{x = lane_origin_x, y = 1080, w = lanes_width, h = lane_height}}},
			{id = "hiddencover", stretch = 3,	dst = {{x = lane_origin_x, y = lane_origin_y - lane_height, w = lanes_width, h = lane_height}}},

			{id = "finishcover", timer = 143, loop = 1000, stretch = 3, dst = {{time = 0, x = lane_origin_x, y = 1080, w = lanes_width, h = lane_height, acc = 2},{time = 1000, y = lane_origin_y}}},

			{id = "timingvisualizer", op = {op_consts.DISP_16_NUMBER_2}, dst = {{x = tv_x, y = tv_y, w = tv_w, h = tv_h}}},
			
			{id = "lanecover-white", offset = 4, op = {270}, dst = {{x = lanes_center_x - 65, y = 1086, w = 13, h = 17}}},
			{id = "duration-green", offset = 4, op = {270}, dst = {{x = lanes_center_x + 13, y = 1086, w = 13, h = 17}}},

			{id = "liftcover-white", offset = 3, op = {270,272}, dst = {{x = lanes_center_x - 65, y = lane_origin_y - 23, w = 13, h = 17}}},
			{id = "duration-green", offset = 3, op = {270,272}, dst = {{x = lanes_center_x + 13, y = lane_origin_y - 23, w = 13, h = 17}}},
			
			{id = "bomb1", timer = 51, loop = -1, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_1}, dst = {{time = 0, x = bomb_x[1], y = bomb_y, w = bomb_width, h = bomb_height},{time = bomb_animation_cycle}}},
			{id = "bomb2", timer = 52, loop = -1, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_1}, dst = {{time = 0, x = bomb_x[2], y = bomb_y, w = bomb_width, h = bomb_height},{time = bomb_animation_cycle}}},
			{id = "bomb3", timer = 53, loop = -1, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_1}, dst = {{time = 0, x = bomb_x[3], y = bomb_y, w = bomb_width, h = bomb_height},{time = bomb_animation_cycle}}},
			{id = "bomb4", timer = 54, loop = -1, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_1}, dst = {{time = 0, x = bomb_x[4], y = bomb_y, w = bomb_width, h = bomb_height},{time = bomb_animation_cycle}}},
			{id = "bomb5", timer = 55, loop = -1, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_1}, dst = {{time = 0, x = bomb_x[5], y = bomb_y, w = bomb_width, h = bomb_height},{time = bomb_animation_cycle}}},
			{id = "bomb6", timer = 56, loop = -1, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_1}, dst = {{time = 0, x = bomb_x[6], y = bomb_y, w = bomb_width, h = bomb_height},{time = bomb_animation_cycle}}},
			{id = "bomb7", timer = 57, loop = -1, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_1}, dst = {{time = 0, x = bomb_x[7], y = bomb_y, w = bomb_width, h = bomb_height},{time = bomb_animation_cycle}}},
			{id = "bombs", timer = 50, loop = -1, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_1}, dst = {{time = 0, x = bomb_x[8], y = bomb_y, w = bomb_width, h = bomb_height},{time = bomb_animation_cycle}}},
			
			{id = "hold1", timer = 71, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_1}, dst = {{time = 0, x = bomb_x[1], y = bomb_y, w = bomb_width, h = bomb_height}}},
			{id = "hold2", timer = 72, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_1}, dst = {{time = 0, x = bomb_x[2], y = bomb_y, w = bomb_width, h = bomb_height}}},
			{id = "hold3", timer = 73, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_1}, dst = {{time = 0, x = bomb_x[3], y = bomb_y, w = bomb_width, h = bomb_height}}},
			{id = "hold4", timer = 74, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_1}, dst = {{time = 0, x = bomb_x[4], y = bomb_y, w = bomb_width, h = bomb_height}}},
			{id = "hold5", timer = 75, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_1}, dst = {{time = 0, x = bomb_x[5], y = bomb_y, w = bomb_width, h = bomb_height}}},
			{id = "hold6", timer = 76, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_1}, dst = {{time = 0, x = bomb_x[6], y = bomb_y, w = bomb_width, h = bomb_height}}},
			{id = "hold7", timer = 77, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_1}, dst = {{time = 0, x = bomb_x[7], y = bomb_y, w = bomb_width, h = bomb_height}}},
			{id = "holds", timer = 70, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_1}, dst = {{time = 0, x = bomb_x[8], y = bomb_y, w = bomb_width, h = bomb_height}}},
			
			{id = "hold1-b", timer = 71, loop = -1, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_1}, dst = {{time = 0, x = bomb_x[1], y = bomb_y, w = bomb_width, h = bomb_height},{time = bomb_animation_cycle}}},
			{id = "hold2-b", timer = 72, loop = -1, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_1}, dst = {{time = 0, x = bomb_x[2], y = bomb_y, w = bomb_width, h = bomb_height},{time = bomb_animation_cycle}}},
			{id = "hold3-b", timer = 73, loop = -1, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_1}, dst = {{time = 0, x = bomb_x[3], y = bomb_y, w = bomb_width, h = bomb_height},{time = bomb_animation_cycle}}},
			{id = "hold4-b", timer = 74, loop = -1, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_1}, dst = {{time = 0, x = bomb_x[4], y = bomb_y, w = bomb_width, h = bomb_height},{time = bomb_animation_cycle}}},
			{id = "hold5-b", timer = 75, loop = -1, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_1}, dst = {{time = 0, x = bomb_x[5], y = bomb_y, w = bomb_width, h = bomb_height},{time = bomb_animation_cycle}}},
			{id = "hold6-b", timer = 76, loop = -1, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_1}, dst = {{time = 0, x = bomb_x[6], y = bomb_y, w = bomb_width, h = bomb_height},{time = bomb_animation_cycle}}},
			{id = "hold7-b", timer = 77, loop = -1, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_1}, dst = {{time = 0, x = bomb_x[7], y = bomb_y, w = bomb_width, h = bomb_height},{time = bomb_animation_cycle}}},
			{id = "holds-b", timer = 70, loop = -1, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_1}, dst = {{time = 0, x = bomb_x[8], y = bomb_y, w = bomb_width, h = bomb_height},{time = bomb_animation_cycle}}},

			{id = "oadxbomb1", timer = 51, filter = 1, loop = -1, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_2}, dst = {{time = 0, x = oadx_bomb_x[1], y = oadx_bomb_y, w = oadx_bomb_width, h = oadx_bomb_height},{time = 250}}},
			{id = "oadxbomb2", timer = 52, filter = 1, loop = -1, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_2}, dst = {{time = 0, x = oadx_bomb_x[2], y = oadx_bomb_y, w = oadx_bomb_width, h = oadx_bomb_height},{time = 250}}},
			{id = "oadxbomb3", timer = 53, filter = 1, loop = -1, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_2}, dst = {{time = 0, x = oadx_bomb_x[3], y = oadx_bomb_y, w = oadx_bomb_width, h = oadx_bomb_height},{time = 250}}},
			{id = "oadxbomb4", timer = 54, filter = 1, loop = -1, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_2}, dst = {{time = 0, x = oadx_bomb_x[4], y = oadx_bomb_y, w = oadx_bomb_width, h = oadx_bomb_height},{time = 250}}},
			{id = "oadxbomb5", timer = 55, filter = 1, loop = -1, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_2}, dst = {{time = 0, x = oadx_bomb_x[5], y = oadx_bomb_y, w = oadx_bomb_width, h = oadx_bomb_height},{time = 250}}},
			{id = "oadxbomb6", timer = 56, filter = 1, loop = -1, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_2}, dst = {{time = 0, x = oadx_bomb_x[6], y = oadx_bomb_y, w = oadx_bomb_width, h = oadx_bomb_height},{time = 250}}},
			{id = "oadxbomb7", timer = 57, filter = 1, loop = -1, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_2}, dst = {{time = 0, x = oadx_bomb_x[7], y = oadx_bomb_y, w = oadx_bomb_width, h = oadx_bomb_height},{time = 250}}},
			{id = "oadxbombs", timer = 50, filter = 1, loop = -1, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_2}, dst = {{time = 0, x = oadx_bomb_x[8], y = oadx_bomb_y, w = oadx_bomb_width, h = oadx_bomb_height},{time = 250}}},
			
			{id = "oadxhold1", timer = 71, filter = 1, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_2}, dst = {{time = 0, x = oadx_bomb_x[1], y = oadx_bomb_y, w = oadx_bomb_width, h = oadx_bomb_height}}},
			{id = "oadxhold2", timer = 72, filter = 1, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_2}, dst = {{time = 0, x = oadx_bomb_x[2], y = oadx_bomb_y, w = oadx_bomb_width, h = oadx_bomb_height}}},
			{id = "oadxhold3", timer = 73, filter = 1, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_2}, dst = {{time = 0, x = oadx_bomb_x[3], y = oadx_bomb_y, w = oadx_bomb_width, h = oadx_bomb_height}}},
			{id = "oadxhold4", timer = 74, filter = 1, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_2}, dst = {{time = 0, x = oadx_bomb_x[4], y = oadx_bomb_y, w = oadx_bomb_width, h = oadx_bomb_height}}},
			{id = "oadxhold5", timer = 75, filter = 1, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_2}, dst = {{time = 0, x = oadx_bomb_x[5], y = oadx_bomb_y, w = oadx_bomb_width, h = oadx_bomb_height}}},
			{id = "oadxhold6", timer = 76, filter = 1, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_2}, dst = {{time = 0, x = oadx_bomb_x[6], y = oadx_bomb_y, w = oadx_bomb_width, h = oadx_bomb_height}}},
			{id = "oadxhold7", timer = 77, filter = 1, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_2}, dst = {{time = 0, x = oadx_bomb_x[7], y = oadx_bomb_y, w = oadx_bomb_width, h = oadx_bomb_height}}},
			{id = "oadxholds", timer = 70, filter = 1, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_2}, dst = {{time = 0, x = oadx_bomb_x[8], y = oadx_bomb_y, w = oadx_bomb_width, h = oadx_bomb_height}}},

			{id = "oadxbomb1", timer = 51, filter = 1, loop = -1, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_3}, dst = {{time = 0, x = oadx_bomb_x[1], y = oadx_bomb_y, w = oadx_bomb_width, h = oadx_bomb_height},{time = 250}}},
			{id = "oadxbomb2", timer = 52, filter = 1, loop = -1, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_3}, dst = {{time = 0, x = oadx_bomb_x[2], y = oadx_bomb_y, w = oadx_bomb_width, h = oadx_bomb_height},{time = 250}}},
			{id = "oadxbomb3", timer = 53, filter = 1, loop = -1, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_3}, dst = {{time = 0, x = oadx_bomb_x[3], y = oadx_bomb_y, w = oadx_bomb_width, h = oadx_bomb_height},{time = 250}}},
			{id = "oadxbomb4", timer = 54, filter = 1, loop = -1, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_3}, dst = {{time = 0, x = oadx_bomb_x[4], y = oadx_bomb_y, w = oadx_bomb_width, h = oadx_bomb_height},{time = 250}}},
			{id = "oadxbomb5", timer = 55, filter = 1, loop = -1, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_3}, dst = {{time = 0, x = oadx_bomb_x[5], y = oadx_bomb_y, w = oadx_bomb_width, h = oadx_bomb_height},{time = 250}}},
			{id = "oadxbomb6", timer = 56, filter = 1, loop = -1, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_3}, dst = {{time = 0, x = oadx_bomb_x[6], y = oadx_bomb_y, w = oadx_bomb_width, h = oadx_bomb_height},{time = 250}}},
			{id = "oadxbomb7", timer = 57, filter = 1, loop = -1, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_3}, dst = {{time = 0, x = oadx_bomb_x[7], y = oadx_bomb_y, w = oadx_bomb_width, h = oadx_bomb_height},{time = 250}}},
			{id = "oadxbombs", timer = 50, filter = 1, loop = -1, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_3}, dst = {{time = 0, x = oadx_bomb_x[8], y = oadx_bomb_y, w = oadx_bomb_width, h = oadx_bomb_height},{time = 250}}},
			
			{id = "oadxhold1", timer = 71, filter = 1, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_3}, dst = {{time = 0, x = oadx_bomb_x[1], y = oadx_bomb_y, w = oadx_bomb_width, h = oadx_bomb_height}}},
			{id = "oadxhold2", timer = 72, filter = 1, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_3}, dst = {{time = 0, x = oadx_bomb_x[2], y = oadx_bomb_y, w = oadx_bomb_width, h = oadx_bomb_height}}},
			{id = "oadxhold3", timer = 73, filter = 1, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_3}, dst = {{time = 0, x = oadx_bomb_x[3], y = oadx_bomb_y, w = oadx_bomb_width, h = oadx_bomb_height}}},
			{id = "oadxhold4", timer = 74, filter = 1, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_3}, dst = {{time = 0, x = oadx_bomb_x[4], y = oadx_bomb_y, w = oadx_bomb_width, h = oadx_bomb_height}}},
			{id = "oadxhold5", timer = 75, filter = 1, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_3}, dst = {{time = 0, x = oadx_bomb_x[5], y = oadx_bomb_y, w = oadx_bomb_width, h = oadx_bomb_height}}},
			{id = "oadxhold6", timer = 76, filter = 1, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_3}, dst = {{time = 0, x = oadx_bomb_x[6], y = oadx_bomb_y, w = oadx_bomb_width, h = oadx_bomb_height}}},
			{id = "oadxhold7", timer = 77, filter = 1, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_3}, dst = {{time = 0, x = oadx_bomb_x[7], y = oadx_bomb_y, w = oadx_bomb_width, h = oadx_bomb_height}}},
			{id = "oadxholds", timer = 70, filter = 1, blend = 2, offset = 3, offsets = {offset_consts.OFFSET_1_ID}, op = {op_consts.OP_3_ITEM_NUMBER_3}, dst = {{time = 0, x = oadx_bomb_x[8], y = oadx_bomb_y, w = oadx_bomb_width, h = oadx_bomb_height}}},

			{id = "judge"},

			{id = "judge-fast", loop = -1, timer = 46 ,op = {op_consts.DISP_1_NUMBER_2,1242}, offsets = {3,32,33}, dst = {{time = 0, x = judgedetail_x, y = judgedetail_y, w = 72, h = 20},{time = 500}}},
			{id = "judge-slow", loop = -1, timer = 46 ,op = {op_consts.DISP_1_NUMBER_2,1243}, offsets = {3,32,33}, dst = {{time = 0, x = judgedetail_x, y = judgedetail_y, w = 72, h = 20},{time = 500}}},
			
			{id = "ghost-mybest", loop = -1, timer = 46, op = {op_consts.DISP_2_NUMBER_2}, offsets = {3,32,33}, dst = {{time = 0, x = ghost_x, y = ghost_y, w = 18, h = 20},{time = 500}}},
			{id = "ghost-target", loop = -1, timer = 46, op = {op_consts.DISP_2_NUMBER_3}, offsets = {3,32,33}, dst = {{time = 0, x = ghost_x, y = ghost_y, w = 18, h = 20},{time = 500}}},
			
			{id = "song-progress", blend = 2, dst = {{x = songprogress_x, y = songprogress_y, w = 64, h = 64}}},
			{id = "song-progress", timer = 140, loop = 0, blend = 2, dst = {{time = 0, x = songprogress_x, y = songprogress_y, w = 64, h = 64, a = 255},{time = 1000, a = 0}}},
			
			{id = "fc-effect",	loop = -1, timer = 48, stretch = 3, blend = 2, dst = {{time = 0, x = lane_origin_x, y = lane_origin_y, w = lanes_width, h = lane_height, a = 128},{time = 2100, y = lane_origin_y + 100, a = 0}}},
			{id = "keybeam-w",	loop = -1, timer = 48, blend = 2, dst = {{time = 0, x = lane_origin_x, y = lane_origin_y, w = lanes_width, h = 0, a = 255, acc = 2},{time = 2000, h = lane_height * 2, a = 0}}},
			{id = "fullcombo",	loop = -1, timer = 48, dst = {{time = 550, x = lanes_center_x - 180, y = judge_y, w = 360, h = 36, a = 0},{time = 650, a = 255},{time = 1600},{time = 1800, y = judge_y - 18, a = 0}}},
			
			{id = "ready", loop = -1, timer = 40, offset = 3, dst = {{time = 0, x = lanes_center_x - 162, y = judge_y, w = 324, h = 36, a = 0},{time = 100, a = 255},{time = 800},{time = 1000, y = judge_y - 18, a = 0}}},

			{id = -110, loop = 500, timer = 3, dst = {{time = 0, x = 0, y = 1080, w = 1920, h = 1080},{time = 500, y = 0}}},
			{id = -110, loop = 500, timer = 2, dst = {{time = 0, x = 0, y = 0, w = 1920, h = 1080, a = 0},{time = 500, a = 255}}}
		}
				
		return skin
	end
	
	

	return {
		header = header,
		body = body
	}
	
end

return main