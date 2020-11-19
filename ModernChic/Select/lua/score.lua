--[[
	選択した曲のスコアとランクを表示
	引数source_idはskin.sourceのID
--]]
local function load()
	local parts = {}
	
	parts.image = {
		-- スコア表示部
		{id = "score-frame", src = 8, x = 0, y = 0, w = 895, h = 194},
		{id = "score-frame-info", src = 8, x = 1, y = 600, w = 610, h = 190},
		{id = "score-bar", src = 8, x = 0, y = 210, w = 696, h = 40},
		{id = "score-bar-info", src = 8, x = 0, y = 250, w = 696, h = 40},
		{id = "scorelate-frame", src = 8, x = 1294, y = 231, w = 65, h = 25},
		-- クリア状況
		{id = "sel-bar-notplayed", src = 8, x = 1234, y = 260, w = 187, h = 33},
		{id = "sel-bar-failed", src = 8, x = 1234, y = 293, w = 187, h = 33},
		{id = "sel-bar-laassist", src = 8, x = 1234, y = 326, w = 187, h = 33},
		{id = "sel-bar-clear", src = 8, x = 1234, y = 359, w = 187, h = 33},
		{id = "sel-bar-easyclear", src = 8, x = 1234, y = 392, w = 187, h = 33},
		{id = "sel-bar-fullcombo", src = 8, x = 860, y = 425, w = 561, h = 33, divx = 3, cycle = 100},
		{id = "sel-bar-hardclear", src = 8, x = 1234, y = 458, w = 187, h = 33},
		{id = "sel-bar-exhardclear", src = 8, x = 1047, y = 491, w = 374, h = 33, divx = 2, cycle = 100},
		{id = "sel-bar-perfect", src = 8, x = 1234, y = 524, w = 187, h = 33},
		{id = "sel-bar-max", src = 8, x = 1234, y = 557, w = 187, h = 33},
		{id = "sel-bar-assist", src = 8, x = 1234, y = 590, w = 187, h = 33},
		-- ランク
		{id = "rank-f", src = 8, x = 1421, y = 0, w = 187, h = 73},
		{id = "rank-e", src = 8, x = 1421, y = 73, w = 187, h = 73},
		{id = "rank-d", src = 8, x = 1421, y = 146, w = 187, h = 73},
		{id = "rank-c", src = 8, x = 1421, y = 219, w = 187, h = 73},
		{id = "rank-b", src = 8, x = 1421, y = 292, w = 187, h = 73},
		{id = "rank-a", src = 8, x = 1421, y = 365, w = 187, h = 73},
		{id = "rank-aa", src = 8, x = 1421, y = 438, w = 187, h = 73},
		{id = "rank-aaa", src = 8, x = 1421, y = 511, w = 187, h = 73},
	}
	
	parts.value = {
		-- EXSCORE
		{id = "exscore", src = 8, x = 1004, y = 590, w = 230, h = 30, divx = 10, digit = 4, ref = 71},
		-- コンボブレイク数
		{id = "combobreakcount", src = 8, x = 1004, y = 590, w = 230, h = 30, divx = 10, digit = 4, ref = 425},
		-- ミス数
		{id = "misscount", src = 8, x = 1004, y = 590, w = 230, h = 30, divx = 10, digit = 4, ref = 76},
		-- FAST数
		{id = "fastcount", src = 8, x = 1004, y = 150, w = 230, h = 30, divx = 10, digit = 4, ref = 423},
		-- SLOW数
		{id = "slowcount", src = 8, x = 1004, y = 180, w = 230, h = 30, divx = 10, digit = 4, ref = 424},
		-- Poor数
		{id = "poorcount", src = 5, x = 2401, y = 510, w = 242, h = 15, divx = 11, digit = 4, ref = 114},
		-- bad数
		{id = "badcount", src = 5, x = 2401, y = 510, w = 242, h = 15, divx = 11, digit = 4, ref = 113},
		-- good数
		{id = "goodcount", src = 5, x = 2401, y = 510, w = 242, h = 15, divx = 11, digit = 4, ref = 112},
		-- great数
		{id = "greatcount", src = 5, x = 2401, y = 510, w = 242, h = 15, divx = 11, digit = 4, ref = 111},
		-- pgreat数
		{id = "pgreatcount", src = 5, x = 2401, y = 510, w = 242, h = 15, divx = 11, digit = 4, ref = 110},
		-- scoreレート
		{id = "scorelate", src = 8, x = 900, y = 400, w = 260, h = 25, divx = 10, digit = 3, ref = 102},
		-- scoreレート(小数点以下)
		{id = "scorelate-afterdot", src = 8, x = 900, y = 400, w = 260, h = 25, divx = 10, digit = 1, ref = 103},
	}
	
	parts.graph = {
		{id = "gra-poor", src = 8, x = 909, y = 0, w = 80, h = 100, value = 144},
		{id = "gra-bad", src = 8, x = 1011, y = 0, w = 80, h = 100, value = 143},
		{id = "gra-good", src = 8, x = 1112, y = 0, w = 80, h = 100, value = 142},
		{id = "gra-great", src = 8, x = 1214, y = 0, w = 80, h = 100, value = 141},
		{id = "gra-pgreat", src = 8, x = 1315, y = 0, w = 80, h = 100, value = 140},
		{id = "bar-exscore-failed", src = 8, x = 0, y = 293, w = 690, h = 33, value = 147, angle = 0},
		{id = "bar-exscore-laassist", src = 8, x = 0, y = 326, w = 690, h = 33, value = 147, angle = 0},
		{id = "bar-exscore-clear", src = 8, x = 0, y = 359, w = 690, h = 33, value = 147, angle = 0},
		{id = "bar-exscore-easy", src = 8, x = 0, y = 392, w = 690, h = 33, value = 147, angle = 0},
		{id = "bar-exscore-fullcombo", src = 8, x = 0, y = 425, w = 690, h = 33, value = 147, angle = 0},
		{id = "bar-exscore-hard", src = 8, x = 0, y = 458, w = 690, h = 33, value = 147, angle = 0},
		{id = "bar-exscore-exhard", src = 8, x = 0, y = 491, w = 690, h = 33, value = 147, angle = 0},
		{id = "bar-exscore-perfect-max", src = 8, x = 0, y = 524, w = 690, h = 33, value = 147, angle = 0},
		{id = "bar-exscore-assist", src = 8, x = 0, y = 557, w = 690, h = 33, value = 147, angle = 0},
	}
	
	local window_position_x = 454
	local window_position_y = 10
	
	parts.destination = {
		{id = "score-frame", dst = {
			{x = window_position_x, y = window_position_y, w = 895, h = 194},
		}},
		{id = "score-frame-info", dst = {
			{x = window_position_x + 2, y = window_position_y + 2, w = 610, h = 190},
		}},
		{id = "exscore", dst = {
			{x = window_position_x + 606, y = window_position_y + 162, w = 23, h = 30},
		}},
		{id = "combobreakcount", dst = {
			{x = window_position_x + 606, y = window_position_y + 133, w = 23, h = 30},
		}},
		{id = "misscount", dst = {
			{x = window_position_x + 606, y = window_position_y + 104, w = 23, h = 30},
		}},
		{id = "fastcount", dst = {
			{x = window_position_x + 606, y = window_position_y + 75, w = 23, h = 30},
		}},
		{id = "slowcount", dst = {
			{x = window_position_x + 606, y = window_position_y + 47, w = 23, h = 30},
		}},
		-- 判定グラフ
		{id = "gra-poor", loop = 300, timer = 11, dst = {
			{time = 0, x = window_position_x + 15, y = window_position_y + 81, w = 80, h = 0, acc = 2},
			{time = 300, h = 100}
		}},
		{id = "gra-bad", loop = 300, timer = 11, dst = {
			{time = 0, x = window_position_x + 117, y = window_position_y + 81, w = 80, h = 0, acc = 2},
			{time = 300, h = 100}
		}},
		{id = "gra-good", loop = 300, timer = 11, dst = {
			{time = 0, x = window_position_x + 218, y = window_position_y + 81, w = 80, h = 0, acc = 2},
			{time = 300, h = 100}
		}},
		{id = "gra-great", loop = 300, timer = 11, dst = {
			{time = 0, x = window_position_x + 320, y = window_position_y + 81, w = 80, h = 0, acc = 2},
			{time = 300, h = 100}
		}},
		{id = "gra-pgreat", loop = 300, timer = 11, dst = {
			{time = 0, x = window_position_x + 421, y = window_position_y + 81, w = 80, h = 0, acc = 2},
			{time = 300, h = 100}
		}},
		-- 判定カウント
		{id = "poorcount", dst = {
			{x = window_position_x + 16, y = window_position_y + 100, w = 20, h = 15},
		}},
		{id = "badcount", dst = {
			{x = window_position_x + 118, y = window_position_y + 100, w = 20, h = 15},
		}},
		{id = "goodcount", dst = {
			{x = window_position_x + 220, y = window_position_y + 100, w = 20, h = 15},
		}},
		{id = "greatcount", dst = {
			{x = window_position_x + 320, y = window_position_y + 100, w = 20, h = 15},
		}},
		{id = "pgreatcount", dst = {
			{x = window_position_x + 422, y = window_position_y + 100, w = 20, h = 15},
		}},
		-- クリア状況
		{id = "sel-bar-notplayed", op = {100}, dst = {
			{x = window_position_x + 706, y = window_position_y + 75, w = 187, h = 33},
		}},
		{id = "sel-bar-failed", op = {101}, dst = {
			{x = window_position_x + 706, y = window_position_y + 19, w = 187, h = 33},
		}},
		{id = "sel-bar-laassist", op = {1101}, dst = {
			{x = window_position_x + 706, y = window_position_y + 19, w = 187, h = 33},
		}},
		{id = "sel-bar-clear", op = {103}, dst = {
			{x = window_position_x + 706, y = window_position_y + 19, w = 187, h = 33},
		}},
		{id = "sel-bar-easyclear", op = {102}, dst = {
			{x = window_position_x + 706, y = window_position_y + 19, w = 187, h = 33},
		}},
		{id = "sel-bar-fullcombo", op = {105}, dst = {
			{x = window_position_x + 706, y = window_position_y + 19, w = 187, h = 33},
		}},
		{id = "sel-bar-hardclear", op = {104}, dst = {
			{x = window_position_x + 706, y = window_position_y + 19, w = 187, h = 33},
		}},
		{id = "sel-bar-exhardclear", op = {1102}, dst = {
			{x = window_position_x + 706, y = window_position_y + 19, w = 187, h = 33},
		}},
		{id = "sel-bar-perfect", op = {1103}, dst = {
			{x = window_position_x + 706, y = window_position_y + 19, w = 187, h = 33},
		}},
		{id = "sel-bar-max", op = {1104}, dst = {
			{x = window_position_x + 706, y = window_position_y + 19, w = 187, h = 33},
		}},
		{id = "sel-bar-assist", op = {1100}, dst = {
			{x = window_position_x + 706, y = window_position_y + 19, w = 187, h = 33},
		}},
		-- ランクバー
		{id = "score-bar", dst = {
			{x = window_position_x + 6, y = window_position_y + 7, w = 696, h = 40},
		}},
		{id = "bar-exscore-failed", timer = 11, loop = 300, op = {101}, dst = {
			{time = 0, x = window_position_x + 9, y = window_position_y + 10, w = 0, h = 33, acc = 2},
			{time = 300, w = 690}
		}},
		{id = "bar-exscore-laassist", timer = 11, loop = 300, op = {1101}, dst = {
			{time = 0, x = window_position_x + 9, y = window_position_y + 10, w = 0, h = 33, acc = 2},
			{time = 300, w = 690}
		}},
		{id = "bar-exscore-clear", timer = 11, loop = 300, op = {103}, dst = {
			{time = 0, x = window_position_x + 9, y = window_position_y + 10, w = 0, h = 33, acc = 2},
			{time = 300, w = 690}
		}},
		{id = "bar-exscore-easy", timer = 11, loop = 300, op = {102}, dst = {
			{time = 0, x = window_position_x + 9, y = window_position_y + 10, w = 0, h = 33, acc = 2},
			{time = 300, w = 690}
		}},
		{id = "bar-exscore-fullcombo", timer = 11, loop = 300, op = {105}, dst = {
			{time = 0, x = window_position_x + 9, y = window_position_y + 10, w = 0, h = 33, acc = 2},
			{time = 300, w = 690}
		}},
		{id = "bar-exscore-hard", timer = 11, loop = 300, op = {104}, dst = {
			{time = 0, x = window_position_x + 9, y = window_position_y + 10, w = 0, h = 33, acc = 2},
			{time = 300, w = 690}
		}},
		{id = "bar-exscore-exhard", timer = 11, loop = 300, op = {1102}, dst = {
			{time = 0, x = window_position_x + 9, y = window_position_y + 10, w = 0, h = 33, acc = 2},
			{time = 300, w = 690}
		}},
		{id = "bar-exscore-perfect-max", timer = 11, loop = 300, op = {1103}, dst = {
			{time = 0, x = window_position_x + 9, y = window_position_y + 10, w = 0, h = 33, acc = 2},
			{time = 300, w = 690}
		}},
		{id = "bar-exscore-perfect-max", timer = 11, loop = 300, op = {1104}, dst = {
			{time = 0, x = window_position_x + 9, y = window_position_y + 10, w = 0, h = 33, acc = 2},
			{time = 300, w = 690}
		}},
		{id = "bar-exscore-assist", timer = 11, loop = 300, op = {1100}, dst = {
			{time = 0, x = window_position_x + 9, y = window_position_y + 10, w = 0, h = 33, acc = 2},
			{time = 300, w = 690}
		}},
		{id = "score-bar-info", dst = {
			{x = window_position_x + 6, y = window_position_y + 7, w = 696, h = 40},
		}},
		-- scoreレート
		{id = "scorelate-frame", loop = 1000, op = {-100, 2}, dst = {
			{time = 1000, x = window_position_x + 796, y = window_position_y + 150, w = 65, h = 25}
		}},
		-- gradeバーで未プレイでない
		{id = "scorelate-frame", loop = 1000, op = {-100, 3}, dst = {
			{time = 1000, x = window_position_x + 796, y = window_position_y + 150, w = 65, h = 25}
		}},
		{id = "scorelate", loop = 1000, op = {-100}, dst = {
			{time = 1000, x = window_position_x + 716, y = window_position_y + 150, w = 26, h = 25}
		}},
		{id = "scorelate-afterdot", loop = 1000, op = {-100}, dst = {
			{time = 1000, x = window_position_x + 808, y = window_position_y + 150, w = 26, h = 25}
		}},
		-- ランク表示
		{id = "rank-aaa", op = {200, -100}, loop = 300, timer = 11, dst = {
			{time = 0, x = window_position_x + 706, y = window_position_y + 69, w = 187, h = 73, a = 0},
			{time = 300, y = window_position_y + 59, a = 255}
		}},
		{id = "rank-aa", op = {201, -100}, loop = 300, timer = 11, dst = {
			{time = 0, x = window_position_x + 706, y = window_position_y + 69, w = 187, h = 73, a = 0},
			{time = 300, y = window_position_y + 59, a = 255}
		}},
		{id = "rank-a", op = {202, -100}, loop = 300, timer = 11, dst = {
			{time = 0, x = window_position_x + 706, y = window_position_y + 69, w = 187, h = 73, a = 0},
			{time = 300, y = window_position_y + 59, a = 255}
		}},
		{id = "rank-b", op = {203, -100}, loop = 300, timer = 11, dst = {
			{time = 0, x = window_position_x + 706, y = window_position_y + 69, w = 187, h = 73, a = 0},
			{time = 300, y = window_position_y + 59, a = 255}
		}},
		{id = "rank-c", op = {204, -100}, loop = 300, timer = 11, dst = {
			{time = 0, x = window_position_x + 706, y = window_position_y + 69, w = 187, h = 73, a = 0},
			{time = 300, y = window_position_y + 59, a = 255}
		}},
		{id = "rank-d", op = {205, -100}, loop = 300, timer = 11, dst = {
			{time = 0, x = window_position_x + 706, y = window_position_y + 69, w = 187, h = 73, a = 0},
			{time = 300, y = window_position_y + 59, a = 255}
		}},
		{id = "rank-e", op = {206, -100}, loop = 300, timer = 11, dst = {
			{time = 0, x = window_position_x + 706, y = window_position_y + 69, w = 187, h = 73, a = 0},
			{time = 300, y = window_position_y + 59, a = 255}
		}},
		{id = "rank-f", op = {207, -100}, loop = 300, timer = 11, dst = {
			{time = 0, x = window_position_x + 706, y = window_position_y + 69, w = 187, h = 73, a = 0},
			{time = 300, y = window_position_y + 59, a = 255}
		}},
	}
	
	return parts
end

return {
	load = load
}