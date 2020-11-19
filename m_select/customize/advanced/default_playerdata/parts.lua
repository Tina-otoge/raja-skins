local parts = {}

local function load()

	local font1_id = "font-default-commonparts-m_select1"
	
	local score = 0
	local flag_score = false
	
	parts.source = {
		{id = "src-default_playerdata_parts", path = "customize/advanced/default_playerdata/parts.png"}
	}
	
	parts.image = {
		{id = "default_playerdata_parts",			src = "src-default_playerdata_parts", x = 0, y = 0, w = -1, h = -1},
		{id = "default_playerdata_state_clear",		src = "src-default-commonparts-system", x = 0, y = 168, w = 260, h = 231, divy = 11, len = 11, ref = 370},

		{id = "default_playerdata_rank_aaa",		src = "src-default-commonparts-system", x = 260, y = 336, w = 120, h = 48},
		{id = "default_playerdata_rank_aa",			src = "src-default-commonparts-system", x = 260, y = 288, w = 120, h = 48},
		{id = "default_playerdata_rank_a",			src = "src-default-commonparts-system", x = 260, y = 240, w = 120, h = 48},
		{id = "default_playerdata_rank_b",			src = "src-default-commonparts-system", x = 260, y = 192, w = 120, h = 48},
		{id = "default_playerdata_rank_c",			src = "src-default-commonparts-system", x = 260, y = 144, w = 120, h = 48},
		{id = "default_playerdata_rank_d",			src = "src-default-commonparts-system", x = 260, y = 96, w = 120, h = 48},
		{id = "default_playerdata_rank_e",			src = "src-default-commonparts-system", x = 260, y = 48, w = 120, h = 48},
		{id = "default_playerdata_rank_f",			src = "src-default-commonparts-system", x = 260, y = 0, w = 120, h = 48},
	}

	parts.value = {
		{id = "default_playerdata_totaltime_hhhh_count",	src = "src-default-commonparts-system", x = 0, y = 817, w = 220, h = 21, divx = 11, digit = 4, ref = 17},
		{id = "default_playerdata_totaltime_mm_count",		src = "src-default-commonparts-system", x = 0, y = 817, w = 220, h = 21, divx = 11, digit = 2, ref = 18},
		{id = "default_playerdata_totaltime_ss_count",		src = "src-default-commonparts-system", x = 0, y = 817, w = 220, h = 21, divx = 11, digit = 2, ref = 19},
		{id = "default_playerdata_startuptime_hhhh_count",	src = "src-default-commonparts-system", x = 0, y = 817, w = 220, h = 21, divx = 11, digit = 4, ref = 27},
		{id = "default_playerdata_startuptime_mm_count",	src = "src-default-commonparts-system", x = 0, y = 817, w = 220, h = 21, divx = 11, digit = 2, ref = 28},
		{id = "default_playerdata_startuptime_ss_count",	src = "src-default-commonparts-system", x = 0, y = 817, w = 220, h = 21, divx = 11, digit = 2, ref = 29},
		{id = "default_playerdata_totalplay_count",			src = "src-default-commonparts-system", x = 0, y = 817, w = 220, h = 21, divx = 11, digit = 10, ref = 30},
		{id = "default_playerdata_totalnotes_count",		src = "src-default-commonparts-system", x = 0, y = 817, w = 220, h = 21, divx = 11, digit = 10, ref = 333},
		
		{id = "default_playerdata_score_count",				src = "src-default-commonparts-system", x = 0, y = 817, w = 220, h = 21, divx = 11, digit = 4, value = function()
			score = main_state.number(71)
			if score < 0 then flag_score = false
			else flag_score = true
			end
			return score
		end},
		{id = "default_playerdata_miss_count",				src = "src-default-commonparts-system", x = 0, y = 817, w = 220, h = 21, divx = 11, digit = 4, ref = 76},
		{id = "default_playerdata_combo_count",				src = "src-default-commonparts-system", x = 0, y = 817, w = 220, h = 21, divx = 11, digit = 4, ref = 75},
		{id = "default_playerdata_diff_count",				src = "src-default-commonparts-system", x = 0, y = 817, w = 220, h = 21, divx = 11, digit = 4, ref = 154},
		{id = "default_playerdata_scorerate_count",			src = "src-default-commonparts-system", x = 0, y = 817, w = 220, h = 21, divx = 11, digit = 3, ref = 102},
		{id = "default_playerdata_scorerate_dot_count",		src = "src-default-commonparts-system", x = 0, y = 817, w = 220, h = 21, divx = 11, digit = 2, ref = 103},
		{id = "default_playerdata_clear_count",				src = "src-default-commonparts-system", x = 0, y = 817, w = 220, h = 21, divx = 11, digit = 3, ref = 78},
		{id = "default_playerdata_play_count",				src = "src-default-commonparts-system", x = 0, y = 817, w = 220, h = 21, divx = 11, digit = 3, ref = 77},
	}
	
	parts.text = {
		{id = "default_playerdata_playdata",		font = font1_id, size = 21, align = 0, constantText = "play data"},
		{id = "default_playerdata_scoredata",		font = font1_id, size = 21, align = 0, constantText = "score data"},
		{id = "default_playerdata_time",			font = font1_id, size = 21, align = 0, constantText = "TIME"},
		{id = "default_playerdata_up",				font = font1_id, size = 21, align = 0, constantText = "UP"},
		{id = "default_playerdata_play",			font = font1_id, size = 21, align = 0, constantText = "PLAY"},
		{id = "default_playerdata_totalnotes",		font = font1_id, size = 21, align = 0, constantText = "NOTES"},
		{id = "default_playerdata_colon",			font = font1_id, size = 21, align = 0, constantText = ":"},
		{id = "default_playerdata_score",			font = font1_id, size = 21, align = 0, constantText = "SCORE"},
		{id = "default_playerdata_miss",			font = font1_id, size = 21, align = 0, constantText = "MISS"},
		{id = "default_playerdata_combo",			font = font1_id, size = 21, align = 0, constantText = "COMBO"},
		{id = "default_playerdata_clear",			font = font1_id, size = 21, align = 0, constantText = "PLAY COUNT"},
		{id = "default_playerdata_diff_rank_max",	font = font1_id, size = 21, align = 0, constantText = "MAX-"},
		{id = "default_playerdata_diff_rank_aaa",	font = font1_id, size = 21, align = 0, constantText = "AAA-"},
		{id = "default_playerdata_diff_rank_aa",	font = font1_id, size = 21, align = 0, constantText = "  AA-"},
		{id = "default_playerdata_diff_rank_a",		font = font1_id, size = 21, align = 0, constantText = "    A-"},
		{id = "default_playerdata_diff_rank_b",		font = font1_id, size = 21, align = 0, constantText = "    B-"},
		{id = "default_playerdata_diff_rank_c",		font = font1_id, size = 21, align = 0, constantText = "    C-"},
		{id = "default_playerdata_diff_rank_d",		font = font1_id, size = 21, align = 0, constantText = "    D-"},
		{id = "default_playerdata_diff_rank_e",		font = font1_id, size = 21, align = 0, constantText = "    E-"},
		{id = "default_playerdata_dot",				font = font1_id, size = 21, align = 0, constantText = "."},
		{id = "default_playerdata_slash",			font = font1_id, size = 21, align = 0, constantText = "/"},
		
		--{id = "text_test",	font = font1_id, size = 21, align = 0, constantText = "0123456789.:+-=/"},
		--{id = "text_test2",	font = font1_id, size = 21, align = 0, constantText = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"},
		--{id = "text_test3",	font = font1_id, size = 21, align = 0, constantText = "abcdefghijklmnopqrstuvwxyz"},
	}

	
	local window_x = 672
	local window_y = 79
			
	local string_w = 260
	local title_x = window_x + 18
	local title_y = window_y + 131
	local column1_x = window_x + 24
	local column2_x = window_x + 134
	local line1_y = window_y + 104
	local line2_y = window_y + 80
	local line3_y = window_y + 56
	local line4_y = window_y + 32
	local line5_y = window_y + 8
	local rank_x = window_x + 254
	local next_x = window_x + 224
	local next_num_x = window_x + 304
	local rate_x = window_x + 264
	local rate_dot_x = window_x + 324
	local rate_afterdot_x = window_x + 344
	local clear_x = window_x + 244
	local slash_x = window_x + 304
	local play_x = window_x + 324

	parts.destination = {
		--{id = "text_test", dst = {{x = 100, y = 420, w = 20, h = 21}}},
		--{id = "text_test2", dst = {{x = 100, y = 390, w = 20, h = 21}}},
		--{id = "text_test3", dst = {{x = 100, y = 360, w = 20, h = 21}}},

		{id = "default_playerdata_parts", dst = {{x = window_x - 9, y = window_y - 4, w = 417, h = 168}}},

		-- フォルダ選択時
		{id = "default_playerdata_playdata", op = {1},		dst = {{x = title_x, y = title_y, w = 260, h = 26}}},
		
		{id = "default_playerdata_time", op = {1},			dst = {{x = column1_x, y = line1_y, w = 80, h = 21}}},
		{id = "default_playerdata_up", op = {1},			dst = {{x = column1_x, y = line2_y, w = 40, h = 21}}},
		{id = "default_playerdata_play", op = {1},			dst = {{x = column1_x, y = line3_y, w = 260, h = 21}}},
		{id = "default_playerdata_totalnotes", op = {1},	dst = {{x = column1_x, y = line4_y, w = 260, h = 21}}},
		
		{id = "default_playerdata_totaltime_hhhh_count", op = {1},		dst = {{x = column2_x, y = line1_y, w = 20, h = 21}}},
		{id = "default_playerdata_colon", op = {1},						dst = {{x = column2_x + 80, y = line1_y, w = 20, h = 21}}},
		{id = "default_playerdata_totaltime_mm_count", op = {1},		dst = {{x = column2_x + 100, y = line1_y, w = 20, h = 21}}},
		{id = "default_playerdata_colon", op = {1},						dst = {{x = column2_x + 140, y = line1_y, w = 20, h = 21}}},
		{id = "default_playerdata_totaltime_ss_count", op = {1},		dst = {{x = column2_x + 160, y = line1_y, w = 20, h = 21}}},
		{id = "default_playerdata_startuptime_hhhh_count", op = {1},	dst = {{x = column2_x, y = line2_y, w = 20, h = 21}}},
		{id = "default_playerdata_colon", op = {1},						dst = {{x = column2_x + 80, y = line2_y, w = 20, h = 21}}},
		{id = "default_playerdata_startuptime_mm_count", op = {1},		dst = {{x = column2_x + 100, y = line2_y, w = 20, h = 21}}},
		{id = "default_playerdata_colon", op = {1},						dst = {{x = column2_x + 140, y = line2_y, w = 20, h = 21}}},
		{id = "default_playerdata_startuptime_ss_count", op = {1},		dst = {{x = column2_x + 160, y = line2_y, w = 20, h = 21}}},
		{id = "default_playerdata_totalplay_count", op = {1},			dst = {{x = column2_x, y = line3_y, w = 20, h = 21}}},
		{id = "default_playerdata_totalnotes_count", op = {1},			dst = {{x = column2_x, y = line4_y, w = 20, h = 21}}},
	
		-- 曲、コース選択時
		{id = "default_playerdata_scoredata", op = {2},	dst = {{x = title_x, y = title_y, w = 260, h = 26}}},
		{id = "default_playerdata_scoredata", op = {3},	dst = {{x = title_x, y = title_y, w = 260, h = 26}}},
		
		{id = "default_playerdata_score", op = {2}, draw = function() return flag_score end,		dst = {{x = column1_x, y = line1_y, w = 260, h = 21}}},
		{id = "default_playerdata_score", op = {3}, draw = function() return flag_score end,		dst = {{x = column1_x, y = line1_y, w = 260, h = 21}}},
		{id = "default_playerdata_miss", op = {2}, draw = function() return flag_score end,			dst = {{x = column1_x, y = line2_y, w = 260, h = 21}}},
		{id = "default_playerdata_miss", op = {3}, draw = function() return flag_score end,			dst = {{x = column1_x, y = line2_y, w = 260, h = 21}}},
		{id = "default_playerdata_combo", op = {2}, draw = function() return flag_score end,		dst = {{x = column1_x, y = line3_y, w = 260, h = 21}}},
		{id = "default_playerdata_combo", op = {3}, draw = function() return flag_score end,		dst = {{x = column1_x, y = line3_y, w = 260, h = 21}}},
		{id = "default_playerdata_clear", op = {2}, draw = function() return flag_score end,		dst = {{x = column1_x, y = line5_y, w = 260, h = 21}}},
		{id = "default_playerdata_clear", op = {3}, draw = function() return flag_score end,		dst = {{x = column1_x, y = line5_y, w = 260, h = 21}}},

		{id = "default_playerdata_state_clear", draw = function() return flag_score end,			dst = {{x = column1_x, y = line4_y, w = 260, h = 21}}},
		{id = "default_playerdata_score_count", draw = function() return flag_score end,			dst = {{x = column2_x, y = line1_y, w = 20, h = 21}}},
		{id = "default_playerdata_miss_count", draw = function() return flag_score end,				dst = {{x = column2_x, y = line2_y, w = 20, h = 21}}},
		{id = "default_playerdata_combo_count", draw = function() return flag_score end,			dst = {{x = column2_x, y = line3_y, w = 20, h = 21}}},
		{id = "default_playerdata_clear_count", draw = function() return flag_score end,			dst = {{x = clear_x, y = line5_y, w = 20, h = 21}}},
		{id = "default_playerdata_slash", draw = function() return flag_score end,					dst = {{x = slash_x, y = line5_y, w = 20, h = 21}}},
		{id = "default_playerdata_play_count", draw = function() return flag_score end,				dst = {{x = play_x, y = line5_y, w = 20, h = 21}}},
					
		{id = "default_playerdata_rank_aaa", op = {200},	dst = {{x = rank_x, y = line2_y, w = 120, h = 48}}},
		{id = "default_playerdata_rank_aa", op = {201},		dst = {{x = rank_x, y = line2_y, w = 120, h = 48}}},
		{id = "default_playerdata_rank_a", op = {202},		dst = {{x = rank_x, y = line2_y, w = 120, h = 48}}},
		{id = "default_playerdata_rank_b", op = {203},		dst = {{x = rank_x, y = line2_y, w = 120, h = 48}}},
		{id = "default_playerdata_rank_c", op = {204},		dst = {{x = rank_x, y = line2_y, w = 120, h = 48}}},
		{id = "default_playerdata_rank_d", op = {205},		dst = {{x = rank_x, y = line2_y, w = 120, h = 48}}},
		{id = "default_playerdata_rank_e", op = {206},		dst = {{x = rank_x, y = line2_y, w = 120, h = 48}}},
		{id = "default_playerdata_rank_f", op = {207},		dst = {{x = rank_x, y = line2_y, w = 120, h = 48}}},

		{id = "default_playerdata_diff_rank_max", op = {2,200},	dst = {{x = next_x, y = line3_y, w = 80, h = 21}}},
		{id = "default_playerdata_diff_rank_aaa", op = {2,201},	dst = {{x = next_x, y = line3_y, w = 80, h = 21}}},
		{id = "default_playerdata_diff_rank_aa", op = {2,202},	dst = {{x = next_x, y = line3_y, w = 80, h = 21}}},
		{id = "default_playerdata_diff_rank_a", op = {2,203},	dst = {{x = next_x, y = line3_y, w = 80, h = 21}}},
		{id = "default_playerdata_diff_rank_b", op = {2,204},	dst = {{x = next_x, y = line3_y, w = 80, h = 21}}},
		{id = "default_playerdata_diff_rank_c", op = {2,205},	dst = {{x = next_x, y = line3_y, w = 80, h = 21}}},
		{id = "default_playerdata_diff_rank_d", op = {2,206},	dst = {{x = next_x, y = line3_y, w = 80, h = 21}}},
		{id = "default_playerdata_diff_rank_e", op = {2,207},	dst = {{x = next_x, y = line3_y, w = 80, h = 21}}},
		
		{id = "default_playerdata_diff_rank_max", op = {3,200},	dst = {{x = next_x, y = line3_y, w = 80, h = 21}}},
		{id = "default_playerdata_diff_rank_aaa", op = {3,201},	dst = {{x = next_x, y = line3_y, w = 80, h = 21}}},
		{id = "default_playerdata_diff_rank_aa", op = {3,202},	dst = {{x = next_x, y = line3_y, w = 80, h = 21}}},
		{id = "default_playerdata_diff_rank_a", op = {3,203},	dst = {{x = next_x, y = line3_y, w = 80, h = 21}}},
		{id = "default_playerdata_diff_rank_b", op = {3,204},	dst = {{x = next_x, y = line3_y, w = 80, h = 21}}},
		{id = "default_playerdata_diff_rank_c", op = {3,205},	dst = {{x = next_x, y = line3_y, w = 80, h = 21}}},
		{id = "default_playerdata_diff_rank_d", op = {3,206},	dst = {{x = next_x, y = line3_y, w = 80, h = 21}}},
		{id = "default_playerdata_diff_rank_e", op = {3,207},	dst = {{x = next_x, y = line3_y, w = 80, h = 21}}},

		{id = "default_playerdata_diff_count", op = {2}, draw = function() return flag_score end,	dst = {{x = next_num_x, y = line3_y, w = 20, h = 21}}},
		{id = "default_playerdata_diff_count", op = {3}, draw = function() return flag_score end,	dst = {{x = next_num_x, y = line3_y, w = 20, h = 21}}},
		{id = "default_playerdata_scorerate_count", draw = function() return flag_score end,		dst = {{x = rate_x, y = line4_y, w = 20, h = 21}}},
		{id = "default_playerdata_dot", op = {2}, draw = function() return flag_score end,			dst = {{x = rate_dot_x, y = line4_y, w = 20, h = 21}}},
		{id = "default_playerdata_dot", op = {3}, draw = function() return flag_score end,			dst = {{x = rate_dot_x, y = line4_y, w = 20, h = 21}}},
		{id = "default_playerdata_scorerate_dot_count", draw = function() return flag_score end,	dst = {{x = rate_afterdot_x, y = line4_y, w = 20, h = 21}}},
	}
	
	return parts	
end

return {
	parts = parts,
	load = load
}