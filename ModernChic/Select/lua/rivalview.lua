--[[
	ライバル比較モード
--]]
local function load()
	local parts = {}
	local window_posx = 10
	local window_posy = 220
	
	parts.image = {
		{id = "compare-frame", src = 5, x = 2000, y = 2200, w = 1022, h = 655},
		{id = "compare-frame-small", src = 5, x = 2000, y = 2900, w = 1000, h = 180},
		
		{id = "compare-win", src = 5, x = 2550, y = 1700, w = 170, h = 50},
		{id = "compare-lose", src = 5, x = 2550, y = 1750, w = 170, h = 50},
		{id = "compare-vs", src = 5, x = 2550, y = 1800, w = 170, h = 50},
		{id = "compare-score", src = 5, x = 2550, y = 1850, w = 170, h = 50},
		{id = "compare-pgreat", src = 5, x = 2550, y = 1900, w = 170, h = 50},
		{id = "compare-great", src = 5, x = 2550, y = 1950, w = 170, h = 50},
		{id = "compare-good", src = 5, x = 2550, y = 2000, w = 170, h = 50},
		{id = "compare-bad", src = 5, x = 2550, y = 2050, w = 170, h = 50},
		{id = "compare-poor", src = 5, x = 2550, y = 2100, w = 170, h = 50},
	}
	
	parts.value = {
		-- ベストスコア
		{id = "compare-myscore", src = 5, x = 2550, y = 1300, w = 374, h = 42, divx = 11, digit = 5, ref = 71},
		{id = "compare-rivalscore", src = 5, x = 2550, y = 1300, w = 374, h = 42, divx = 11, digit = 5, ref = 271},
		-- pgreat数
		{id = "compare-mypgreat", src = 5, x = 2550, y = 1300, w = 374, h = 42, divx = 11, digit = 5, ref = 110},
		{id = "compare-rivalpgreat", src = 5, x = 2550, y = 1300, w = 374, h = 42, divx = 11, digit = 5, ref = 280},
		-- great
		{id = "compare-mygreat", src = 5, x = 2550, y = 1300, w = 374, h = 42, divx = 11, digit = 5, ref = 111},
		{id = "compare-rivalgreat", src = 5, x = 2550, y = 1300, w = 374, h = 42, divx = 11, digit = 5, ref = 281},
		-- good
		{id = "compare-mygood", src = 5, x = 2550, y = 1300, w = 374, h = 42, divx = 11, digit = 5, ref = 112},
		{id = "compare-rivalgood", src = 5, x = 2550, y = 1300, w = 374, h = 42, divx = 11, digit = 5,ref = 282},
		-- bad
		{id = "compare-mybad", src = 5, x = 2550, y = 1300, w = 374, h = 42, divx = 11, digit = 5, ref = 113},
		{id = "compare-rivalbad", src = 5, x = 2550, y = 1300, w = 374, h = 42, divx = 11, digit = 5, ref = 283},
		-- poor
		{id = "compare-mypoor", src = 5, x = 2550, y = 1300, w = 374, h = 42, divx = 11, digit = 5, ref = 114},
		{id = "compare-rivalpoor", src = 5, x = 2550, y = 1300, w = 374, h = 42, divx = 11, digit = 5, ref = 284},
	}
	
	-- op625 : OPTION_COMPARE_RIVAL
	parts.destination = {
	--[[
		{id = "compare-frame-small", op = {625}, dst = {
			{x = window_posx, y = window_posy, w = 1000, h = 180},
		}},
		{id = "compare-vs", op = {625}, dst = {
			{x = window_posx + 460, y = window_posy + 100, w = 60, h = 42},
		}},
		{id = "compare-score", op = {625}, dst = {
			{x = window_posx + 430, y = window_posy + 40, w = 132, h = 44},
		}},
		{id = "yourname", op = {625}, dst = {
			{x = window_posx + 330, y = window_posy + 100, w = 300, h = 35},
		}},
		{id = "compare-myscore", op = {625}, dst = {
			{x = window_posx + 165, y = window_posy + 40, w = 34, h = 42},
		}},
		{id = "rivalname", op = {625}, dst = {
			{x = window_posx + 680, y = window_posy + 100, w = 300, h = 35},
		}},
		{id = "compare-rivalscore", op = {625}, dst = {
			{x = window_posx + 675, y = window_posy + 40, w = 34, h = 42},
		}}]]
		
		{id = "compare-frame", op = {625}, dst = {
			{x = window_posx, y = window_posy, w = 1022, h = 655, a = 230},
		}},
		
		-- 1Pが勝利
		{id = "compare-win", op = {625, 352}, dst = {
			{x = window_posx + 300, y = window_posy + 580, w = 170, h = 50},
		}},
		{id = "compare-lose", op = {625, 352}, dst = {
			{x = window_posx + 580, y = window_posy + 580, w = 170, h = 50},
		}},
		-- 2Pが勝利
		{id = "compare-lose", op = {625, 353}, dst = {
			{x = window_posx + 300, y = window_posy + 580, w = 170, h = 50},
		}},
		{id = "compare-win", op = {625, 353}, dst = {
			{x = window_posx + 580, y = window_posy + 580, w = 170, h = 50},
		}},
		
		{id = "compare-vs", op = {625}, dst = {
			{x = window_posx + 430, y = window_posy + 500, w = 170, h = 50},
		}},
		{id = "yourname", op = {625}, dst = {
			{x = window_posx + 330, y = window_posy + 500, w = 300, h = 35},
		}},
		{id = "rivalname", op = {625}, dst = {
			{x = window_posx + 680, y = window_posy + 500, w = 300, h = 35},
		}},
		
		{id = "compare-score", op = {625}, dst = {
			{x = window_posx + 430, y = window_posy + 420, w = 170, h = 50},
		}},
		{id = "compare-myscore", op = {625}, dst = {
			{x = window_posx + 165, y = window_posy + 420, w = 34, h = 42},
		}},
		{id = "compare-rivalscore", op = {625}, dst = {
			{x = window_posx + 675, y = window_posy + 420, w = 34, h = 42},
		}},
		
		{id = "compare-pgreat", op = {625}, dst = {
			{x = window_posx + 430, y = window_posy + 340, w = 170, h = 50},
		}},
		{id = "compare-mypgreat", op = {625}, dst = {
			{x = window_posx + 165, y = window_posy + 340, w = 34, h = 42},
		}},
		{id = "compare-rivalpgreat", op = {625}, dst = {
			{x = window_posx + 675, y = window_posy + 340, w = 34, h = 42},
		}},
		
		{id = "compare-great", op = {625}, dst = {
			{x = window_posx + 430, y = window_posy + 260, w = 170, h = 50},
		}},
		{id = "compare-mygreat", op = {625}, dst = {
			{x = window_posx + 165, y = window_posy + 260, w = 34, h = 42},
		}},
		{id = "compare-rivalgreat", op = {625}, dst = {
			{x = window_posx + 675, y = window_posy + 260, w = 34, h = 42},
		}},
		
		{id = "compare-good", op = {625}, dst = {
			{x = window_posx + 430, y = window_posy + 180, w = 170, h = 50},
		}},
		{id = "compare-mygood", op = {625}, dst = {
			{x = window_posx + 165, y = window_posy + 180, w = 34, h = 42},
		}},
		{id = "compare-rivalgood", op = {625}, dst = {
			{x = window_posx + 675, y = window_posy + 180, w = 34, h = 42},
		}},
		
		{id = "compare-bad", op = {625}, dst = {
			{x = window_posx + 430, y = window_posy + 100, w = 170, h = 50},
		}},
		{id = "compare-mybad", op = {625}, dst = {
			{x = window_posx + 165, y = window_posy + 100, w = 34, h = 42},
		}},
		{id = "compare-rivalbad", op = {625}, dst = {
			{x = window_posx + 675, y = window_posy + 100, w = 34, h = 42},
		}},
		
		{id = "compare-poor", op = {625}, dst = {
			{x = window_posx + 430, y = window_posy + 20, w = 170, h = 50},
		}},
		{id = "compare-mypoor", op = {625}, dst = {
			{x = window_posx + 165, y = window_posy + 20, w = 34, h = 42},
		}},
		{id = "compare-rivalpoor", op = {625}, dst = {
			{x = window_posx + 675, y = window_posy + 20, w = 34, h = 42},
		}},
	}
	
	return parts
end

return {
	load = load
}