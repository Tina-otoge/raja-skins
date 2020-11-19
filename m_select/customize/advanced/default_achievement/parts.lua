local parts = {}

local function load()
	
	local src1_id = "src-default-achievement-parts"
	local src1_path = "customize/advanced/default_achievement/parts.png"
	local font1_id = "font-default-commonparts-VL-Gothic-Regular"
	
	local button_position = {x = 590, y = 990}
	local panel_position = {x = 28, y = 243}
	local detail_position = {
		x = {
			panel_position.x + 826,
			panel_position.x + 858,
			panel_position.x + 865
		},
		y = {
			panel_position.y + 434,
			panel_position.y + 395,
			panel_position.y + 380,
			panel_position.y + 344,
			panel_position.y + 326,
			panel_position.y + 305,
			panel_position.y + 287,
			panel_position.y + 269,
			panel_position.y + 251,
			panel_position.y + 215,
			panel_position.y + 197,
			panel_position.y + 179,
			panel_position.y + 161,
			panel_position.y + 143,
			panel_position.y + 125,
			panel_position.y + 107,
			panel_position.y + 71
		}
	}
	
	local panel_on = get_customTimer_id()
	local panel_off = get_customTimer_id()
	
	local mydata = {
		score = 0,
		combo = 0,
		perfect = 0,
		clear = 0
	}
	
	local tgt_score = {c = 0, b = 0, a = 0}
	local tgt_combo = {c = 0, b = 0, a = 0}
	local tgt_perfect = {c = 0, b = 0, a = 0}
	local tgt_clear = {c = 0, b = 0, a = 0}
	
	local flag = {
		panel = false,
		noplay = false,
		score_c = false,
		score_b = false,
		score_a = false,
		combo_c = false,
		combo_b = false,
		combo_a = false,
		perfect_c = false,
		perfect_b = false,
		perfect_a = false,
		clear_c = false,
		clear_b = false,
		clear_a = false
	}
		
	local function panel_open_close()
		flag.panel = not flag.panel
		if flag.panel then
			main_state.set_timer(panel_on, main_state.time())
			main_state.set_timer(panel_off, main_state.timer_off_value)
		else
			main_state.set_timer(panel_off, main_state.time())
			main_state.set_timer(panel_on, main_state.timer_off_value)
		end
	end
	
	parts.source = {{id = src1_id, path = src1_path}}

	parts.image = {
		{id = "panel_button_off",	src = src1_id, x = 720, y = 594, w = 50, h = 50, act = (function() return panel_open_close() end)},
		{id = "panel_button_rect",	src = src1_id, x = 770, y = 594, w = 50, h = 50},
		{id = "panel_button_on",	src = src1_id, x = 820, y = 594, w = 50, h = 50},
	
		{id = "panel",		src = src1_id, x = 0, y = 0, w = 1024, h = 594},
		{id = "clear",		src = src1_id, x = 480, y = 594, w = 120, h = 18},
		{id = "not_clear",	src = src1_id, x = 600, y = 594, w = 64, h = 64},
		
		{id = "5keys",		src = src1_id, x = 0, y = 594, w = 120, h = 18},
		{id = "7keys",		src = src1_id, x = 0, y = 612, w = 120, h = 18},
		{id = "9keys",		src = src1_id, x = 0, y = 630, w = 120, h = 18},
		{id = "10keys",		src = src1_id, x = 0, y = 648, w = 120, h = 18},
		{id = "14keys",		src = src1_id, x = 0, y = 666, w = 120, h = 18},
		{id = "24keys",		src = src1_id, x = 0, y = 684, w = 120, h = 18},
		{id = "48keys",		src = src1_id, x = 0, y = 702, w = 120, h = 18},
		
		{id = "veryeasy",	src = src1_id, x = 120, y = 594, w = 120, h = 18},
		{id = "easy",		src = src1_id, x = 120, y = 612, w = 120, h = 18},
		{id = "normal",		src = src1_id, x = 120, y = 630, w = 120, h = 18},
		{id = "hard",		src = src1_id, x = 120, y = 648, w = 120, h = 18},
		{id = "veryhard",	src = src1_id, x = 120, y = 666, w = 120, h = 18},
		
		{id = "state_clear",	src = src1_id, x = 240, y = 594, w = 120, h = 198, divy = 11, len = 11, ref = 370},
		{id = "no_play",		src = src1_id, x = 240, y = 594, w = 120, h = 18},
		
		{id = "f",		src = src1_id, x = 360, y = 594, w = 120, h = 18},
		{id = "e",		src = src1_id, x = 360, y = 612, w = 120, h = 18},
		{id = "d",		src = src1_id, x = 360, y = 630, w = 120, h = 18},
		{id = "c",		src = src1_id, x = 360, y = 648, w = 120, h = 18},
		{id = "b",		src = src1_id, x = 360, y = 666, w = 120, h = 18},
		{id = "a",		src = src1_id, x = 360, y = 684, w = 120, h = 18},
		{id = "aa",		src = src1_id, x = 360, y = 702, w = 120, h = 18},
		{id = "aaa",	src = src1_id, x = 360, y = 720, w = 120, h = 18},
		
		{id = "0",		src = src1_id, x = 600, y = 684, w = 14, h = 21},
		{id = "000",	src = src1_id, x = 872, y = 666, w = 33, h = 18},
		{id = "00",		src = src1_id, x = 894, y = 666, w = 22, h = 18},
		{id = "dot",	src = src1_id, x = 721, y = 666, w = 8, h = 18},
		{id = "00000",	src = src1_id, x = 850, y = 666, w = 55, h = 18}
	}
	
	parts.value = {	
		{id = "data", src = src1_id, x = 600, y = 666, w = 121, h = 18, divx = 11, digit = 2, value = function()
			if flag.panel then			
				local notes_count = main_state.number(74)
				
				if notes_count > 0 then
					local rank_unit = (notes_count * 2) / 9
					local combo_unit = notes_count / 8
					tgt_score.c = math.ceil(rank_unit * 4)
					tgt_score.b = math.ceil(rank_unit * 6)
					tgt_score.a = math.ceil(rank_unit * 8)
					tgt_combo.c = math.ceil(combo_unit * 2)
					tgt_combo.b = math.ceil(combo_unit * 4)
					tgt_combo.a = math.ceil(combo_unit * 6)
					tgt_perfect.c = 50
					tgt_perfect.b = 65
					tgt_perfect.a = 80
					tgt_clear.c = 1
					tgt_clear.b = 5
					tgt_clear.a = 10
				else
					tgt_score.c = 50
					tgt_score.b = 100
					tgt_score.a = 200
					tgt_combo.c = 50
					tgt_combo.b = 100
					tgt_combo.a = 200
					tgt_perfect.c = 50
					tgt_perfect.b = 65
					tgt_perfect.a = 80
					tgt_clear.c = 1
					tgt_clear.b = 5
					tgt_clear.a = 10
				end
				
				mydata.score = main_state.number(71)
				
				if mydata.score >= 0 then
					flag.noplay = false
					mydata.combo = main_state.number(75)
					mydata.perfect = main_state.number(85)
					mydata.clear = main_state.number(78)
				else
					flag.noplay = true
					mydata.score = 0
					mydata.combo = 0
					mydata.perfect = 0
					mydata.clear = 0
				end
				
				if mydata.score >= tgt_score.a then
					flag.score_a = true
					flag.score_b = true
					flag.score_c = true
				elseif mydata.score >= tgt_score.b then
					flag.score_a = false
					flag.score_b = true
					flag.score_c = true
				elseif mydata.score >= tgt_score.c then
					flag.score_a = false
					flag.score_b = false
					flag.score_c = true
				else
					flag.score_a = false
					flag.score_b = false
					flag.score_c = false
				end
				
				if mydata.combo >= tgt_combo.a then
					flag.combo_a = true
					flag.combo_b = true
					flag.combo_c = true
				elseif mydata.combo >= tgt_combo.b then
					flag.combo_a = false
					flag.combo_b = true
					flag.combo_c = true
				elseif mydata.combo >= tgt_combo.c then
					flag.combo_a = false
					flag.combo_b = false
					flag.combo_c = true
				else
					flag.combo_a = false
					flag.combo_b = false
					flag.combo_c = false
				end
				
				if mydata.perfect >= tgt_perfect.a then
					flag.perfect_a = true
					flag.perfect_b = true
					flag.perfect_c = true
				elseif mydata.perfect >= tgt_perfect.b then
					flag.perfect_a = false
					flag.perfect_b = true
					flag.perfect_c = true
				elseif mydata.perfect >= tgt_perfect.c then
					flag.perfect_a = false
					flag.perfect_b = false
					flag.perfect_c = true
				else
					flag.perfect_a = false
					flag.perfect_b = false
					flag.perfect_c = false
				end
				
				if mydata.clear >= tgt_clear.a then
					flag.clear_a = true
					flag.clear_b = true
					flag.clear_c = true
				elseif mydata.clear >= tgt_clear.b then
					flag.clear_a = false
					flag.clear_b = true
					flag.clear_c = true
				elseif mydata.clear >= tgt_clear.c then
					flag.clear_a = false
					flag.clear_b = false
					flag.clear_c = true
				else
					flag.clear_a = false
					flag.clear_b = false
					flag.clear_c = false
				end
			end
			
			return 0
		end},
		
		{id = "mydata_score",	src = src1_id, x = 600, y = 684, w = 140, h = 21, divx = 10, digit = 5, ref = 71},
		{id = "mydata_combo",	src = src1_id, x = 600, y = 684, w = 140, h = 21, divx = 10, digit = 5, ref = 75},
		{id = "mydata_perfect",	src = src1_id, x = 600, y = 684, w = 140, h = 21, divx = 10, digit = 5, ref = 85},
		{id = "mydata_clear",	src = src1_id, x = 600, y = 684, w = 140, h = 21, divx = 10, digit = 5, ref = 78},
		
		{id = "tgt_score_c",	src = src1_id, x = 600, y = 666, w = 110, h = 18, divx = 10, digit = 6, align = 2, value = function() return tgt_score.c end},
		{id = "tgt_score_b",	src = src1_id, x = 600, y = 666, w = 110, h = 18, divx = 10, digit = 6, align = 2, value = function() return tgt_score.b end},
		{id = "tgt_score_a",	src = src1_id, x = 600, y = 666, w = 110, h = 18, divx = 10, digit = 6, align = 2, value = function() return tgt_score.a end},
		{id = "tgt_combo_c",	src = src1_id, x = 600, y = 666, w = 110, h = 18, divx = 10, digit = 6, align = 2, value = function() return tgt_combo.c end},
		{id = "tgt_combo_b",	src = src1_id, x = 600, y = 666, w = 110, h = 18, divx = 10, digit = 6, align = 2, value = function() return tgt_combo.b end},
		{id = "tgt_combo_a",	src = src1_id, x = 600, y = 666, w = 110, h = 18, divx = 10, digit = 6, align = 2, value = function() return tgt_combo.a end},
		{id = "tgt_perfect_c",	src = src1_id, x = 600, y = 666, w = 110, h = 18, divx = 10, digit = 6, align = 2, value = function() return tgt_perfect.c end},
		{id = "tgt_perfect_b",	src = src1_id, x = 600, y = 666, w = 110, h = 18, divx = 10, digit = 6, align = 2, value = function() return tgt_perfect.b end},
		{id = "tgt_perfect_a",	src = src1_id, x = 600, y = 666, w = 110, h = 18, divx = 10, digit = 6, align = 2, value = function() return tgt_perfect.a end},
		{id = "tgt_clear_c",	src = src1_id, x = 600, y = 666, w = 110, h = 18, divx = 10, digit = 6, align = 2, value = function() return tgt_clear.c end},
		{id = "tgt_clear_b",	src = src1_id, x = 600, y = 666, w = 110, h = 18, divx = 10, digit = 6, align = 2, value = function() return tgt_clear.b end},
		{id = "tgt_clear_a",	src = src1_id, x = 600, y = 666, w = 110, h = 18, divx = 10, digit = 6, align = 2, value = function() return tgt_clear.a end},
		
		{id = "detail_level",			src = src1_id, x = 600, y = 666, w = 121, h = 18, divx = 11, digit = 2, ref = 96},
		{id = "detail_rate",			src = src1_id, x = 600, y = 666, w = 121, h = 18, divx = 11, digit = 3, ref = 102},
		{id = "detail_rate_afterdot",	src = src1_id, x = 729, y = 666, w = 121, h = 18, divx = 11, digit = 2, ref = 103},
		{id = "detail_exscore",			src = src1_id, x = 600, y = 666, w = 121, h = 18, divx = 11, digit = 5, ref = 71},
		{id = "detail_maxcombo",		src = src1_id, x = 600, y = 666, w = 121, h = 18, divx = 11, digit = 5, ref = 75},
		{id = "detail_misscount",		src = src1_id, x = 600, y = 666, w = 121, h = 18, divx = 11, digit = 5, ref = 76},
		
		{id = "detail_perfect",			src = src1_id, x = 600, y = 666, w = 121, h = 18, divx = 11, digit = 5, ref = 80},
		{id = "detail_great",			src = src1_id, x = 600, y = 666, w = 121, h = 18, divx = 11, digit = 5, ref = 81},
		{id = "detail_good",			src = src1_id, x = 600, y = 666, w = 121, h = 18, divx = 11, digit = 5, ref = 82},
		{id = "detail_bad",				src = src1_id, x = 600, y = 666, w = 121, h = 18, divx = 11, digit = 5, ref = 83},
		{id = "detail_poor",			src = src1_id, x = 600, y = 666, w = 121, h = 18, divx = 11, digit = 5, ref = 84},
		{id = "detail_miss",			src = src1_id, x = 600, y = 666, w = 121, h = 18, divx = 11, digit = 5, ref = 420},
		{id = "detail_combobreak",		src = src1_id, x = 600, y = 666, w = 121, h = 18, divx = 11, digit = 5, ref = 425},
		
		{id = "detail_playcount",		src = src1_id, x = 600, y = 666, w = 121, h = 18, divx = 11, digit = 5, ref = 77}
	}
	
	parts.text = {
		{id = "play_tgt", font = font1_id, size = 24, align = 0, constantText = "プレイ目標"},
		{id = "list_title", font = font1_id, size = 24, align = 0, overflow = 1, ref = 10}
	}
	
	parts.customTimers = {
		{id = panel_on},
		{id = panel_off}
	}
	
	parts.destination = {
		{id = "data", timer = panel_on, dst = {{x = 0, y = 0, w = 0, h = 0, a = 0}}},
		
		{id = "panel_button_off",					dst = {{x = button_position.x, y = button_position.y, w = 50, h = 50}}},
		{id = "panel_button_rect",					dst = {{x = button_position.x, y = button_position.y, w = 50, h = 50}}, mouseRect = {x = 0, y = 0, w = 50, h = 50}},
		{id = "panel_button_on", timer = panel_on,	dst = {{x = button_position.x, y = button_position.y, w = 50, h = 50}}},
	
		{id = "panel", timer = panel_on, loop = 300, dst = {
			{time = 0, x = -1080, y = panel_position.y, w = 1024, h = 594, acc = 2},
			{time = 300, x = panel_position.x}
		}},
		{id = "panel", timer = panel_off, loop = -1, dst = {
			{time = 0, x = panel_position.x, y = panel_position.y, w = 1024, h = 594, acc = 2},
			{time = 300, x = -1080, y = panel_position.y},			
		}},
		
		{id = "play_tgt", timer = panel_on, loop = 350, dst = {{time = 0, x = panel_position.x + 88, y = panel_position.y + 527, w = 129, h = 24, a = 0},{time = 250},{time = 350, a = 255}}},
		{id = "list_title", timer = panel_on, loop = 350, dst = {{time = 0, x = panel_position.x + 218, y = panel_position.y + 527, w = 720, h = 24, a = 0},{time = 250},{time = 350, a = 255}}},
		
		{id = "mydata_score",	timer = panel_on, loop = 350, dst = {{time = 0, x = panel_position.x + 228, y = panel_position.y + 420, w = 14, h = 21, a = 0},{time = 250},{time = 350, a = 255}}},
		{id = "mydata_combo",	timer = panel_on, loop = 350, dst = {{time = 0, x = panel_position.x + 228, y = panel_position.y + 312, w = 14, h = 21, a = 0},{time = 250},{time = 350, a = 255}}},
		{id = "mydata_perfect",	timer = panel_on, loop = 350, dst = {{time = 0, x = panel_position.x + 204, y = panel_position.y + 204, w = 14, h = 21, a = 0},{time = 250},{time = 350, a = 255}}},
		{id = "mydata_clear",	timer = panel_on, loop = 350, dst = {{time = 0, x = panel_position.x + 204, y = panel_position.y + 96, w = 14, h = 21, a = 0},{time = 250},{time = 350, a = 255}}},
		
		{id = "0",	timer = panel_on, draw = function() return flag.noplay end, loop = 350, dst = {{time = 0, x = panel_position.x + 284, y = panel_position.y + 420, w = 14, h = 21, a = 0},{time = 250},{time = 350, a = 255}}},
		{id = "0",	timer = panel_on, draw = function() return flag.noplay end, loop = 350, dst = {{time = 0, x = panel_position.x + 284, y = panel_position.y + 312, w = 14, h = 21, a = 0},{time = 250},{time = 350, a = 255}}},
		{id = "0",	timer = panel_on, draw = function() return flag.noplay end, loop = 350, dst = {{time = 0, x = panel_position.x + 260, y = panel_position.y + 204, w = 14, h = 21, a = 0},{time = 250},{time = 350, a = 255}}},
		{id = "0",	timer = panel_on, draw = function() return flag.noplay end, loop = 350, dst = {{time = 0, x = panel_position.x + 260, y = panel_position.y + 96, w = 14, h = 21, a = 0},{time = 250},{time = 350, a = 255}}},
		
		{id = "tgt_score_c", timer = panel_on, loop = 350, dst = {{time = 0, x = panel_position.x + 339, y = panel_position.y + 407, w = 11, h = 18, a = 0},{time = 250},{time = 350, a = 255}}},
		{id = "tgt_score_b", timer = panel_on, loop = 350, dst = {{time = 0, x = panel_position.x + 459, y = panel_position.y + 407, w = 11, h = 18, a = 0},{time = 250},{time = 350, a = 255}}},
		{id = "tgt_score_a", timer = panel_on, loop = 350, dst = {{time = 0, x = panel_position.x + 579, y = panel_position.y + 407, w = 11, h = 18, a = 0},{time = 250},{time = 350, a = 255}}},
		
		{id = "tgt_combo_c", timer = panel_on, loop = 350, dst = {{time = 0, x = panel_position.x + 339, y = panel_position.y + 299, w = 11, h = 18, a = 0},{time = 250},{time = 350, a = 255}}},
		{id = "tgt_combo_b", timer = panel_on, loop = 350, dst = {{time = 0, x = panel_position.x + 459, y = panel_position.y + 299, w = 11, h = 18, a = 0},{time = 250},{time = 350, a = 255}}},
		{id = "tgt_combo_a", timer = panel_on, loop = 350, dst = {{time = 0, x = panel_position.x + 579, y = panel_position.y + 299, w = 11, h = 18, a = 0},{time = 250},{time = 350, a = 255}}},
		
		{id = "tgt_perfect_c", timer = panel_on, loop = 350, dst = {{time = 0, x = panel_position.x + 339, y = panel_position.y + 191, w = 11, h = 18, a = 0},{time = 250},{time = 350, a = 255}}},
		{id = "tgt_perfect_b", timer = panel_on, loop = 350, dst = {{time = 0, x = panel_position.x + 459, y = panel_position.y + 191, w = 11, h = 18, a = 0},{time = 250},{time = 350, a = 255}}},
		{id = "tgt_perfect_a", timer = panel_on, loop = 350, dst = {{time = 0, x = panel_position.x + 579, y = panel_position.y + 191, w = 11, h = 18, a = 0},{time = 250},{time = 350, a = 255}}},
		
		{id = "tgt_clear_c", timer = panel_on, loop = 350, dst = {{time = 0, x = panel_position.x + 339, y = panel_position.y + 83, w = 11, h = 18, a = 0},{time = 250},{time = 350, a = 255}}},
		{id = "tgt_clear_b", timer = panel_on, loop = 350, dst = {{time = 0, x = panel_position.x + 459, y = panel_position.y + 83, w = 11, h = 18, a = 0},{time = 250},{time = 350, a = 255}}},
		{id = "tgt_clear_a", timer = panel_on, loop = 350, dst = {{time = 0, x = panel_position.x + 579, y = panel_position.y + 83, w = 11, h = 18, a = 0},{time = 250},{time = 350, a = 255}}},
		
		{id = "clear",		timer = panel_on, draw = function() return flag.score_c end, loop = 350, dst = {{time = 0, x = panel_position.x + 338, y = panel_position.y + 472, w = 120, h = 18, a = 0},{time = 250},{time = 350, a = 255}}},
		{id = "clear",		timer = panel_on, draw = function() return flag.score_b end, loop = 350, dst = {{time = 0, x = panel_position.x + 458, y = panel_position.y + 472, w = 120, h = 18, a = 0},{time = 250},{time = 350, a = 255}}},
		{id = "clear",		timer = panel_on, draw = function() return flag.score_a end, loop = 350, dst = {{time = 0, x = panel_position.x + 578, y = panel_position.y + 472, w = 120, h = 18, a = 0},{time = 250},{time = 350, a = 255}}},
		
		{id = "clear",		timer = panel_on, draw = function() return flag.combo_c end, loop = 350, dst = {{time = 0, x = panel_position.x + 338, y = panel_position.y + 364, w = 120, h = 18, a = 0},{time = 250},{time = 350, a = 255}}},
		{id = "clear",		timer = panel_on, draw = function() return flag.combo_b end, loop = 350, dst = {{time = 0, x = panel_position.x + 458, y = panel_position.y + 364, w = 120, h = 18, a = 0},{time = 250},{time = 350, a = 255}}},
		{id = "clear",		timer = panel_on, draw = function() return flag.combo_a end, loop = 350, dst = {{time = 0, x = panel_position.x + 578, y = panel_position.y + 364, w = 120, h = 18, a = 0},{time = 250},{time = 350, a = 255}}},
		
		{id = "clear",		timer = panel_on, draw = function() return flag.perfect_c end, loop = 350, dst = {{time = 0, x = panel_position.x + 338, y = panel_position.y + 256, w = 120, h = 18, a = 0},{time = 250},{time = 350, a = 255}}},
		{id = "clear",		timer = panel_on, draw = function() return flag.perfect_b end, loop = 350, dst = {{time = 0, x = panel_position.x + 458, y = panel_position.y + 256, w = 120, h = 18, a = 0},{time = 250},{time = 350, a = 255}}},
		{id = "clear",		timer = panel_on, draw = function() return flag.perfect_a end, loop = 350, dst = {{time = 0, x = panel_position.x + 578, y = panel_position.y + 256, w = 120, h = 18, a = 0},{time = 250},{time = 350, a = 255}}},
		
		{id = "clear",		timer = panel_on, draw = function() return flag.clear_c end, loop = 350, dst = {{time = 0, x = panel_position.x + 338, y = panel_position.y + 148, w = 120, h = 18, a = 0},{time = 250},{time = 350, a = 255}}},
		{id = "clear",		timer = panel_on, draw = function() return flag.clear_b end, loop = 350, dst = {{time = 0, x = panel_position.x + 458, y = panel_position.y + 148, w = 120, h = 18, a = 0},{time = 250},{time = 350, a = 255}}},
		{id = "clear",		timer = panel_on, draw = function() return flag.clear_a end, loop = 350, dst = {{time = 0, x = panel_position.x + 578, y = panel_position.y + 148, w = 120, h = 18, a = 0},{time = 250},{time = 350, a = 255}}},
		
		{id = "not_clear",	timer = panel_on, draw = function() return not flag.score_c end, loop = 350, dst = {{time = 0, x = panel_position.x + 340, y = panel_position.y + 404, w = 64, h = 64, a = 0},{time = 250},{time = 350, a = 255}}},
		{id = "not_clear",	timer = panel_on, draw = function() return not flag.score_b end, loop = 350, dst = {{time = 0, x = panel_position.x + 460, y = panel_position.y + 404, w = 64, h = 64, a = 0},{time = 250},{time = 350, a = 255}}},
		{id = "not_clear",	timer = panel_on, draw = function() return not flag.score_a end, loop = 350, dst = {{time = 0, x = panel_position.x + 580, y = panel_position.y + 404, w = 64, h = 64, a = 0},{time = 250},{time = 350, a = 255}}},
		
		{id = "not_clear",	timer = panel_on, draw = function() return not flag.combo_c end, loop = 350, dst = {{time = 0, x = panel_position.x + 340, y = panel_position.y + 296, w = 64, h = 64, a = 0},{time = 250},{time = 350, a = 255}}},
		{id = "not_clear",	timer = panel_on, draw = function() return not flag.combo_b end, loop = 350, dst = {{time = 0, x = panel_position.x + 460, y = panel_position.y + 296, w = 64, h = 64, a = 0},{time = 250},{time = 350, a = 255}}},
		{id = "not_clear",	timer = panel_on, draw = function() return not flag.combo_a end, loop = 350, dst = {{time = 0, x = panel_position.x + 580, y = panel_position.y + 296, w = 64, h = 64, a = 0},{time = 250},{time = 350, a = 255}}},
		
		{id = "not_clear",	timer = panel_on, draw = function() return not flag.perfect_c end, loop = 350, dst = {{time = 0, x = panel_position.x + 340, y = panel_position.y + 188, w = 64, h = 64, a = 0},{time = 250},{time = 350, a = 255}}},
		{id = "not_clear",	timer = panel_on, draw = function() return not flag.perfect_b end, loop = 350, dst = {{time = 0, x = panel_position.x + 460, y = panel_position.y + 188, w = 64, h = 64, a = 0},{time = 250},{time = 350, a = 255}}},
		{id = "not_clear",	timer = panel_on, draw = function() return not flag.perfect_a end, loop = 350, dst = {{time = 0, x = panel_position.x + 580, y = panel_position.y + 188, w = 64, h = 64, a = 0},{time = 250},{time = 350, a = 255}}},
		
		{id = "not_clear",	timer = panel_on, draw = function() return not flag.clear_c end, loop = 350, dst = {{time = 0, x = panel_position.x + 340, y = panel_position.y + 80, w = 64, h = 64, a = 0},{time = 250},{time = 350, a = 255}}},
		{id = "not_clear",	timer = panel_on, draw = function() return not flag.clear_b end, loop = 350, dst = {{time = 0, x = panel_position.x + 460, y = panel_position.y + 80, w = 64, h = 64, a = 0},{time = 250},{time = 350, a = 255}}},
		{id = "not_clear",	timer = panel_on, draw = function() return not flag.clear_a end, loop = 350, dst = {{time = 0, x = panel_position.x + 580, y = panel_position.y + 80, w = 64, h = 64, a = 0},{time = 250},{time = 350, a = 255}}},
		
		{id = "5keys",		timer = panel_on, op = {161}, loop = 350, dst = {{time = 0, x = detail_position.x[1], y = detail_position.y[1], w = 120, h = 18, a = 0},{time = 250},{time = 350, a = 255}}},
		{id = "7keys",		timer = panel_on, op = {160}, loop = 350, dst = {{time = 0, x = detail_position.x[1], y = detail_position.y[1], w = 120, h = 18, a = 0},{time = 250},{time = 350, a = 255}}},
		{id = "9keys",		timer = panel_on, op = {164}, loop = 350, dst = {{time = 0, x = detail_position.x[1], y = detail_position.y[1], w = 120, h = 18, a = 0},{time = 250},{time = 350, a = 255}}},
		{id = "10keys",		timer = panel_on, op = {163}, loop = 350, dst = {{time = 0, x = detail_position.x[1], y = detail_position.y[1], w = 120, h = 18, a = 0},{time = 250},{time = 350, a = 255}}},
		{id = "14keys",		timer = panel_on, op = {162}, loop = 350, dst = {{time = 0, x = detail_position.x[1], y = detail_position.y[1], w = 120, h = 18, a = 0},{time = 250},{time = 350, a = 255}}},
		{id = "24keys",		timer = panel_on, op = {1160}, loop = 350, dst = {{time = 0, x = detail_position.x[1], y = detail_position.y[1], w = 120, h = 18, a = 0},{time = 250},{time = 350, a = 255}}},
		{id = "48keys",		timer = panel_on, op = {1161}, loop = 350, dst = {{time = 0, x = detail_position.x[1], y = detail_position.y[1], w = 120, h = 18, a = 0},{time = 250},{time = 350, a = 255}}},
		
		{id = "detail_level",	timer = panel_on, loop = 350, dst = {{time = 0, x = detail_position.x[1], y = detail_position.y[2], w = 11, h = 18, a = 0},{time = 250},{time = 350, a = 255}}},
		
		{id = "veryeasy",	timer = panel_on, op = {184}, loop = 350, dst = {{time = 0, x = detail_position.x[1], y = detail_position.y[3], w = 120, h = 18, a = 0},{time = 250},{time = 350, a = 255}}},
		{id = "easy",		timer = panel_on, op = {183}, loop = 350, dst = {{time = 0, x = detail_position.x[1], y = detail_position.y[3], w = 120, h = 18, a = 0},{time = 250},{time = 350, a = 255}}},
		{id = "normal",		timer = panel_on, op = {182}, loop = 350, dst = {{time = 0, x = detail_position.x[1], y = detail_position.y[3], w = 120, h = 18, a = 0},{time = 250},{time = 350, a = 255}}},
		{id = "hard",		timer = panel_on, op = {181}, loop = 350, dst = {{time = 0, x = detail_position.x[1], y = detail_position.y[3], w = 120, h = 18, a = 0},{time = 250},{time = 350, a = 255}}},
		{id = "veryhard",	timer = panel_on, op = {180}, loop = 350, dst = {{time = 0, x = detail_position.x[1], y = detail_position.y[3], w = 120, h = 18, a = 0},{time = 250},{time = 350, a = 255}}},
		
		{id = "state_clear",	timer = panel_on, loop = 350, dst = {{time = 0, x = detail_position.x[1], y = detail_position.y[4], w = 120, h = 18, a = 0},{time = 250},{time = 350, a = 255}}},
		{id = "no_play",		timer = panel_on, draw = function() return flag.noplay end, loop = 350, dst = {{time = 0, x = detail_position.x[1], y = detail_position.y[4], w = 120, h = 18, a = 0},{time = 250},{time = 350, a = 255}}},
		
		{id = "f",		timer = panel_on, op = {207}, loop = 350, dst = {{time = 0, x = detail_position.x[1], y = detail_position.y[5], w = 120, h = 18, a = 0},{time = 250},{time = 350, a = 255}}},
		{id = "e",		timer = panel_on, op = {206}, loop = 350, dst = {{time = 0, x = detail_position.x[1], y = detail_position.y[5], w = 120, h = 18, a = 0},{time = 250},{time = 350, a = 255}}},
		{id = "d",		timer = panel_on, op = {205}, loop = 350, dst = {{time = 0, x = detail_position.x[1], y = detail_position.y[5], w = 120, h = 18, a = 0},{time = 250},{time = 350, a = 255}}},
		{id = "c",		timer = panel_on, op = {204}, loop = 350, dst = {{time = 0, x = detail_position.x[1], y = detail_position.y[5], w = 120, h = 18, a = 0},{time = 250},{time = 350, a = 255}}},
		{id = "b",		timer = panel_on, op = {203}, loop = 350, dst = {{time = 0, x = detail_position.x[1], y = detail_position.y[5], w = 120, h = 18, a = 0},{time = 250},{time = 350, a = 255}}},
		{id = "a",		timer = panel_on, op = {202}, loop = 350, dst = {{time = 0, x = detail_position.x[1], y = detail_position.y[5], w = 120, h = 18, a = 0},{time = 250},{time = 350, a = 255}}},
		{id = "aa",		timer = panel_on, op = {201}, loop = 350, dst = {{time = 0, x = detail_position.x[1], y = detail_position.y[5], w = 120, h = 18, a = 0},{time = 250},{time = 350, a = 255}}},
		{id = "aaa",	timer = panel_on, op = {200}, loop = 350, dst = {{time = 0, x = detail_position.x[1], y = detail_position.y[5], w = 120, h = 18, a = 0},{time = 250},{time = 350, a = 255}}},
		
		{id = "detail_rate",			timer = panel_on, loop = 350, dst = {{time = 0, x = detail_position.x[1], y = detail_position.y[6], w = 11, h = 18, a = 0},{time = 250},{time = 350, a = 255}}},
		{id = "dot",					timer = panel_on, loop = 350, dst = {{time = 0, x = detail_position.x[2], y = detail_position.y[6], w = 8, h = 18, a = 0},{time = 250},{time = 350, a = 255}}},
		{id = "detail_rate_afterdot",	timer = panel_on, loop = 350, dst = {{time = 0, x = detail_position.x[3], y = detail_position.y[6], w = 11, h = 18, a = 0},{time = 250},{time = 350, a = 255}}},
		{id = "detail_exscore",			timer = panel_on, loop = 350, dst = {{time = 0, x = detail_position.x[1], y = detail_position.y[7], w = 11, h = 18, a = 0},{time = 250},{time = 350, a = 255}}},
		{id = "detail_maxcombo",		timer = panel_on, loop = 350, dst = {{time = 0, x = detail_position.x[1], y = detail_position.y[8], w = 11, h = 18, a = 0},{time = 250},{time = 350, a = 255}}},
		{id = "detail_misscount",		timer = panel_on, loop = 350, dst = {{time = 0, x = detail_position.x[1], y = detail_position.y[9], w = 11, h = 18, a = 0},{time = 250},{time = 350, a = 255}}},
		
		{id = "detail_perfect",			timer = panel_on, loop = 350, dst = {{time = 0, x = detail_position.x[1], y = detail_position.y[10], w = 11, h = 18, a = 0},{time = 250},{time = 350, a = 255}}},
		{id = "detail_great",			timer = panel_on, loop = 350, dst = {{time = 0, x = detail_position.x[1], y = detail_position.y[11], w = 11, h = 18, a = 0},{time = 250},{time = 350, a = 255}}},
		{id = "detail_good",			timer = panel_on, loop = 350, dst = {{time = 0, x = detail_position.x[1], y = detail_position.y[12], w = 11, h = 18, a = 0},{time = 250},{time = 350, a = 255}}},
		{id = "detail_bad",				timer = panel_on, loop = 350, dst = {{time = 0, x = detail_position.x[1], y = detail_position.y[13], w = 11, h = 18, a = 0},{time = 250},{time = 350, a = 255}}},
		{id = "detail_poor",			timer = panel_on, loop = 350, dst = {{time = 0, x = detail_position.x[1], y = detail_position.y[14], w = 11, h = 18, a = 0},{time = 250},{time = 350, a = 255}}},
		{id = "detail_miss",			timer = panel_on, loop = 350, dst = {{time = 0, x = detail_position.x[1], y = detail_position.y[15], w = 11, h = 18, a = 0},{time = 250},{time = 350, a = 255}}},
		{id = "detail_combobreak",		timer = panel_on, loop = 350, dst = {{time = 0, x = detail_position.x[1], y = detail_position.y[16], w = 11, h = 18, a = 0},{time = 250},{time = 350, a = 255}}},
		
		{id = "detail_playcount",		timer = panel_on, loop = 350, dst = {{time = 0, x = detail_position.x[1], y = detail_position.y[17], w = 11, h = 18, a = 0},{time = 250},{time = 350, a = 255}}},
		
		{id = "000",	timer = panel_on, draw = function() return flag.noplay end, loop = 350, dst = {{time = 0, x = detail_position.x[1], y = detail_position.y[6], w = 33, h = 18, a = 0},{time = 250},{time = 350, a = 255}}},
		{id = "00",		timer = panel_on, draw = function() return flag.noplay end, loop = 350, dst = {{time = 0, x = detail_position.x[3], y = detail_position.y[6], w = 22, h = 18, a = 0},{time = 250},{time = 350, a = 255}}},
		{id = "00000",	timer = panel_on, draw = function() return flag.noplay end, loop = 350, dst = {{time = 0, x = detail_position.x[1], y = detail_position.y[7], w = 55, h = 18, a = 0},{time = 250},{time = 350, a = 255}}},
		{id = "00000",	timer = panel_on, draw = function() return flag.noplay end, loop = 350, dst = {{time = 0, x = detail_position.x[1], y = detail_position.y[8], w = 55, h = 18, a = 0},{time = 250},{time = 350, a = 255}}},
		{id = "00000",	timer = panel_on, draw = function() return flag.noplay end, loop = 350, dst = {{time = 0, x = detail_position.x[1], y = detail_position.y[9], w = 55, h = 18, a = 0},{time = 250},{time = 350, a = 255}}},
		
		{id = "00000",	timer = panel_on, draw = function() return flag.noplay end, loop = 350, dst = {{time = 0, x = detail_position.x[1], y = detail_position.y[10], w = 55, h = 18, a = 0},{time = 250},{time = 350, a = 255}}},
		{id = "00000",	timer = panel_on, draw = function() return flag.noplay end, loop = 350, dst = {{time = 0, x = detail_position.x[1], y = detail_position.y[11], w = 55, h = 18, a = 0},{time = 250},{time = 350, a = 255}}},
		{id = "00000",	timer = panel_on, draw = function() return flag.noplay end, loop = 350, dst = {{time = 0, x = detail_position.x[1], y = detail_position.y[12], w = 55, h = 18, a = 0},{time = 250},{time = 350, a = 255}}},
		{id = "00000",	timer = panel_on, draw = function() return flag.noplay end, loop = 350, dst = {{time = 0, x = detail_position.x[1], y = detail_position.y[13], w = 55, h = 18, a = 0},{time = 250},{time = 350, a = 255}}},
		{id = "00000",	timer = panel_on, draw = function() return flag.noplay end, loop = 350, dst = {{time = 0, x = detail_position.x[1], y = detail_position.y[14], w = 55, h = 18, a = 0},{time = 250},{time = 350, a = 255}}},
		
		{id = "00000",	timer = panel_on, draw = function() return flag.noplay end, loop = 350, dst = {{time = 0, x = detail_position.x[1], y = detail_position.y[17], w = 55, h = 18, a = 0},{time = 250},{time = 350, a = 255}}}
	}
		
	local folder_name = "default_achievement"
	for i = 1, #parts.image do
		parts.image[i].id = folder_name .. parts.image[i].id
	end
	for i = 1, #parts.value do
		parts.value[i].id = folder_name .. parts.value[i].id
	end
	for i = 1, #parts.text do
		parts.text[i].id = folder_name .. parts.text[i].id
	end
	for i = 1, #parts.destination do
		parts.destination[i].id = folder_name .. parts.destination[i].id
	end
			
	return parts	
end

return {
	parts = parts,
	load = load
}