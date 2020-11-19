--[[
	これまでのプレイ状況と選択した曲のTOTAL値などを表示
--]]
local function load()
	local parts = {}
	local window_posx = 10
	local window_posy = 10
	
	parts.image = {
		{id = "info-frame", src = 5, x = 2401, y = 312, w = 429, h = 194},
		{id = "info-frame2", src = 5, x = 2100, y = 10, w = 180, h = 190},
		{id = "info-frame3", src = 5, x = 2100, y = 210, w = 270, h = 190},
		{id = "judge-veryeasy", src = 5, x = 2835, y = 320, w = 165, h = 16},
		{id = "judge-easy", src = 5, x = 2835, y = 336, w = 165, h = 16},
		{id = "judge-normal", src = 5, x = 2835, y = 352, w = 165, h = 16},
		{id = "judge-hard", src = 5, x = 2835, y = 368, w = 165, h = 16},
		{id = "judge-veryhard", src = 5, x = 2835, y = 384, w = 165, h = 16},
		{id = "loading", src = 5, x = 2100, y = 410, w = 130, h = 20},
		{id = "offline", src = 5, x = 2100, y = 430, w = 130, h = 20},
		{id = "complete", src = 5, x = 2100, y = 450, w = 130, h = 20},
	}
	
	parts.value = {
		-- これまで叩いたノート数
		{id = "totalplaynotes", src = 5, x = 2401, y = 510, w = 242, h = 15, divx = 11, digit = 10, ref = 333},
		-- これまで叩いたピカグレ
		{id = "totalpgreat", src = 5, x = 2401, y = 510, w = 242, h = 15, divx = 11, digit = 10, ref = 33},
		-- これまで叩いたグレート
		{id = "totalgreat", src = 5, x = 2401, y = 510, w = 242, h = 15, divx = 11, digit = 10, ref = 34},
		-- これまで叩いたgood
		{id = "totalgood", src = 5, x = 2401, y = 510, w = 242, h = 15, divx = 11, digit = 10, ref = 35},
		-- これまで叩いたbad
		{id = "totalbad", src = 5, x = 2401, y = 510, w = 242, h = 15, divx = 11, digit = 10, ref = 36},
		-- これまで叩いたpoor
		{id = "totalpoor", src = 5, x = 2401, y = 510, w = 242, h = 15, divx = 11, digit = 10, ref = 37},
		-- 総ノート数
		{id = "totalnotes", src = 5, x = 2401, y = 510, w = 242, h = 15, divx = 11, digit = 4, ref = 74},
		-- 曲の長さ（分）
		{id = "songlen-min", src = 5, x = 2401, y = 510, w = 242, h = 15, divx = 11, digit = 2, ref = 1163},
		-- 曲の長さ（秒）
		{id = "songlen-sec", src = 5, x = 2401, y = 510, w = 242, h = 15, divx = 11, digit = 2, ref = 1164},
		-- プレイ数
		{id = "playcount", src = 5, x = 2401, y = 510, w = 242, h = 15, divx = 11, digit = 4, ref = 77},
		-- TOTAL値
		{id = "total", src = 5, x = 2401, y = 510, w = 242, h = 15, divx = 11, digit = 4, ref = 368},
		-- 現在のIR順位
		{id = "ir_rank", src = 5, x = 2401, y = 510, w = 242, h = 15, divx = 11, digit = 5, ref = 179},
		-- IR参加人数
		{id = "ir_totalplayer", src = 5, x = 2401, y = 510, w = 242, h = 15, divx = 11, digit = 5, ref = 180},
		-- IRクリアレート
		{id = "ir_clearrate", src = 5, x = 2401, y = 510, w = 220, h = 15, divx = 10, digit = 3, ref = 181},
		-- IR読み込み時間
		{id = "ir_uwt", src = 5, x = 2401, y = 510, w = 242, h = 15, divx = 11, digit = 3, ref = 220},
	}
	
	-- op 2 : OPTION_SONGBAR
	-- op 180 : OPTION_JUDGE_VERYHARD
	-- op 181: OPTION_JUDGE_HARD
	-- op 182 : OPTION_JUDGE_NORMAL
	-- op 183 : OPTION_JUDGE_EASY
	-- op 184 : OPTION_JUDGE_VERYEASY
	parts.destination = {
		{id = "info-frame", dst = {
			{x = window_posx, y = window_posy, w = 429, h = 194},
		}},
		{id = "info-frame2", op = {-2}, dst = {
			{x = window_posx + 7, y = window_posy + 2, w = 180, h = 190},
		}},
		{id = "totalplaynotes", op = {-2}, dst = {
			{x = window_posx + 200, y = window_posy + 166, w = 22, h = 15},
		}},
		{id = "totalpgreat", op = {-2}, dst = {
			{x = window_posx + 200, y = window_posy + 136, w = 22, h = 15},
		}},
		{id = "totalgreat", op = {-2}, dst = {
			{x = window_posx + 200, y = window_posy + 104, w = 22, h = 15},
		}},
		{id = "totalgood", op = {-2}, dst = {
			{x = window_posx + 200, y = window_posy + 73, w = 22, h = 15},
		}},
		{id = "totalbad", op = {-2}, dst = {
			{x = window_posx + 200, y = window_posy + 41, w = 22, h = 15},
		}},
		{id = "totalpoor", op = {-2}, dst = {
			{x = window_posx + 200, y = window_posy + 11, w = 22, h = 15},
		}},
		{id = "info-frame3", op = {2}, dst = {
			{x = window_posx + 7, y = window_posy + 2, w = 270, h = 190},
		}},
		{id = "totalnotes", op = {2}, dst = {
			{x = window_posx + 140, y = window_posy + 167, w = 22, h = 15},
		}},
		{id = "songlen-min", op = {2}, dst = {
			{ x = window_posx + 140, y = window_posy + 105, w = 22, h = 15},
		}},
		{id = "songlen-sec", op = {2}, dst = {
			{x = window_posx + 203, y = window_posy + 105, w = 22, h = 15},
		}},
		{id = "playcount", op = {2}, dst = {
			{x = window_posx + 140, y = window_posy + 75, w = 22, h = 15},
		}},
		{id = "total", op = {2}, dst = {
			{x = window_posx + 140, y = window_posy + 136, w = 22, h = 15},
		}},
		{id = "judge-veryeasy", op = {184, 2}, dst = {
			{x = window_posx + 140, y = window_posy + 43, w = 165, h = 16},
		}},
		{id = "judge-easy", op = {183, 2}, dst = {
			{x = window_posx + 140, y = window_posy + 43, w = 165, h = 16},
		}},
		{id = "judge-normal", op = {182, 2}, dst = {
			{x = window_posx + 140, y = window_posy + 43, w = 165, h = 16},
		}},
		{id = "judge-hard", op = {181, 2}, dst = {
			{x = window_posx + 140, y = window_posy + 43, w = 165, h = 16},
		}},
		{id = "judge-veryhard", op = {180, 2},dst = {
			{x = window_posx + 140, y = window_posy + 43, w = 165, h = 16},
		}},
		--[[
		-- IRRANK
		{id = "ir_rank", op = {2}, dst = {
			{x = window_posx + 140, y = window_posy + 11, w = 22, h = 15},
		}},
		-- IR参加人数
		{id = "ir_totalplayer", op = {2}, dst = {
			{x = window_posx + 285, y = window_posy + 11, w = 22, h = 15},
		}},]]
		-- IR読み込み時間
		{id = "ir_uwt", op = {2, 51}, dst = {
			{x = window_posx + 225, y = window_posy + 11, w = 22, h = 15}
		}},
		-- IR読み込み完了
		-- op 602: OPTION_IR_LOADED
		{id = "complete", op = {2, 602}, dst = {
			{x = window_posx + 225, y = window_posy + 11, w = 130, h = 20}
		}},
		-- オフライン時
		{id = "offline", op = {2,50}, dst = {
			{x = window_posx + 215, y = window_posy + 9, w = 130, h = 20},
		}},
	}
	
	return parts
end

return {
	load = load
}