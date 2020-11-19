--[[
	選曲表示部
	曲名、ジャンル名、BPM、パンくずリスト、ランダムセレクト、BGAありなし
--]]
local function load()
	local parts = {}
	
	parts.image = {
		{id = "bpm-while", src = 5, x = 1860, y = 1240, w = 60, h = 50},
		{id = "bpm-frame", src = 5, x = 1500, y = 1240, w = 180, h = 50},
		{id = "bpm-roulette-1", src = 5, x = 1500, y = 1290, w = 600, h = 40, divx = 10, cycle = 50},
		{id = "bpm-roulette-2", src = 5, x = 1500, y = 1290, w = 600, h = 40, divx = 10, cycle = 100},
		{id = "bpm-roulette-3", src = 5, x = 1500, y = 1290, w = 600, h = 40, divx = 10, cycle = 150},
		{id = "totalsongs-frame", src = 5, x = 2550, y = 1470, w = 150, h = 50},
		{id = "randomselect-frame", src = 5, x = 1500, y = 2000, w = 610, h = 120},
		{id = "bga-notexist", src = 5, x = 1400, y = 2150, w = 168, h = 40},
		{id = "bga-exist", src = 5, x = 1400, y = 2190, w = 168, h = 40},
		{id = "offline-now", src = 5, x = 1570, y = 2150, w = 168, h = 40},
		{id = "online-now", src = 5, x = 1570, y = 2190, w = 168, h = 40},
		{id = "md-judge-veryeasy", src = 5, x = 1740, y = 2150, w = 168, h = 40},
		{id = "md-judge-easy", src = 5, x = 1740, y = 2190, w = 168, h = 40},
		{id = "md-judge-normal", src = 5, x = 1740, y = 2230, w = 168, h = 40},
		{id = "md-judge-hard", src = 5, x = 1740, y = 2270, w = 168, h = 40},
		{id = "md-judge-veryhard", src = 5, x = 1740, y = 2310, w = 168, h = 40},
	}
	
	parts.value = {
		-- MAXBPM
		{id = "maxbpm", src = 5, x = 1500, y = 1290, w = 600, h = 40, divx = 10, digit = 3, ref = 90},
		-- MINBPM
		{id = "minbpm", src = 5, x = 1500, y = 1290, w = 600, h = 40, divx = 10, digit = 3, ref = 91, align = 0},
		-- 譜面数
		{id = "folder-totalsongs", src = 5, x = 2550, y = 1300, w = 374, h = 42, divx = 11, digit = 4, ref = 300},
	}
	
	parts.destination = {
		-- テキスト関連
		{id = "directory", dst = {
			{x = 990, y = 715, w = 890, h = 25, r = 240, g = 240, b = 240},
		}},
		{id = "genre", dst = {
			{x = 1000, y = 660, w = 920, h = 30, r = 255, g = 255, b = 255},
		}},
		{id = "title", dst = {
			{x = 1000, y = 570, w = 920, h = 70, r = 216, g = 255, b = 0},
		}},
		{id = "artist", dst = {
			{x = 1000, y = 520, w = 920, h = 30, r = 255, g = 255, b = 255},
		}},
		-- BPM表示部
		{id = "bpm-frame", op = {2, 177}, dst = {
			{x = 375, y = 442, w = 180, h = 50},
		}},
		{id = "bpm-while", op = {2, 177}, dst = {
			{x = 750, y = 442, w = 60, h = 50},
		}},
		{id = "minbpm", op = {2, 177}, loop = 200, dst = {
			{time = 200, x = 555, y = 442, w = 60, h = 50},
		}},
		-- bpmぐるぐる3桁目
		{id = "bpm-roulette-3", op = {2, 177}, loop = -1, timer = 11, dst = {
			{time = 0, x = 555, y = 442, w = 60, h = 50},
			{time = 199}
		}},
		-- bpmぐるぐる2桁目
		{id = "bpm-roulette-2", op = {2, 177}, loop = -1, timer = 11, dst = {
			{time = 0, x = 615, y = 442, w = 60, h = 50},
			{time = 199}
		}},
		-- bpmぐるぐる1桁目
		{id = "bpm-roulette-1", op = {2, 177}, loop = -1, timer = 11, dst = {
			{time = 0, x = 675, y = 442, w = 60, h = 50},
			{time = 199}
		}},
		{id = "maxbpm", op = {2, 177}, loop = 200, dst = {
			{time = 200, x = 825, y = 442, w = 60, h = 50},
		}},
		-- bpmぐるぐる3桁目
		{id = "bpm-roulette-3", op = {2, 177}, loop = -1, timer = 11, dst = {
			{time = 0, x = 825, y = 442, w = 60, h = 50},
			{time = 199}
		}},
		-- bpmぐるぐる2桁目
		{id = "bpm-roulette-2", op = {2, 177}, loop = -1, timer = 11, dst = {
			{time = 0, x = 885, y = 442, w = 60, h = 50},
			{time = 199}
		}},
		-- bpmぐるぐる1桁目
		{id = "bpm-roulette-1", op = {2, 177}, loop = -1, timer = 11, dst = {
			{time = 0, x = 945, y = 442, w = 60, h = 50},
			{time = 199}
		}},
		-- BPM変化無し
		{id = "bpm-frame", op = {2, 176}, dst = {
			{x = 630, y = 442, w = 180, h = 50},
		}},
		{id = "maxbpm", op = {2, 176}, loop = 200, timer = 11, dst = {
			{time = 200, x = 825, y = 442, w = 60, h = 50}
		}},
		-- bpmぐるぐる3桁目
		{id = "bpm-roulette-3", op = {2, 176}, loop = -1, timer = 11, dst = {
			{time = 0, x = 825, y = 442, w = 60, h = 50},
			{time = 199}
		}},
		-- bpmぐるぐる2桁目
		{id = "bpm-roulette-2", op = {2, 176}, loop = -1, timer = 11, dst = {
			{time = 0, x = 885, y = 442, w = 60, h = 50},
			{time = 199}
		}},
		-- bpmぐるぐる1桁目
		{id = "bpm-roulette-1", op = {2, 176}, loop = -1, timer = 11, dst = {
			{time = 0, x = 945, y = 442, w = 60, h = 50},
			{time = 199}
		}},
		-- 譜面数表示
		{id = "totalsongs-frame", op = {1}, dst = {
			{x = 720, y = 491, w = 150, h = 50}
		}},
		{id = "folder-totalsongs", dst = {
			{x = 870, y = 498, w = 34, h = 42}
		}},
		-- ランダムセレクト時
		{id = "randomselect-frame", op = {1030}, dst = {
			{x = 400, y = 530, w = 610, h = 120}
		}},
		
		-- オンライン常態
		-- op50: オフライン
		-- op51: オンライン
		{id = "offline-now", op = {50}, dst = {
			{x = 486, y = 880, w = 168, h = 40},
		}},
		{id = "online-now", op = {51}, dst = {
			{x = 486, y = 880, w = 168, h = 40},
		}},
		
		-- BGAありなし
		-- op170: BGA無し
		-- op171: BGA有り
		{id = "bga-notexist", op = {170}, dst = {
			{x = 659, y = 880, w = 168, h = 40},
		}},
		{id = "bga-exist", op = {171}, dst = {
			{x = 659, y = 880, w = 168, h = 40},
		}},
		
		-- 判定レベル
		-- op 180 : OPTION_JUDGE_VERYHARD
		-- op 181: OPTION_JUDGE_HARD
		-- op 182 : OPTION_JUDGE_NORMAL
		-- op 183 : OPTION_JUDGE_EASY
		-- op 184 : OPTION_JUDGE_VERYEASY
		{id = "md-judge-veryhard", op = {180}, dst = {
			{x = 832, y = 880, w = 168, h = 40},
		}},
		{id = "md-judge-hard", op = {181}, dst = {
			{x = 832, y = 880, w = 168, h = 40},
		}},
		{id = "md-judge-normal", op = {182}, dst = {
			{x = 832, y = 880, w = 168, h = 40},
		}},
		{id = "md-judge-easy", op = {183}, dst = {
			{x = 832, y = 880, w = 168, h = 40},
		}},
		{id = "md-judge-veryeasy", op = {184}, dst = {
			{x = 832, y = 880, w = 168, h = 40},
		}},
	}
	
	return parts
end

return {
	load = load
}