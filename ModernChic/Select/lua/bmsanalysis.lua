--[[
	BMS分析部分
--]]
local function load()
	local parts = {}
	local window_posx = 1360
	local window_posy = 10
	
	parts.image = {
		{id = "detail-frame", src = 5, x = 2410, y = 600, w = 551, h = 194}
	}
	
	-- noGap 0:句切れ目あり, 1:なし
	parts.judgegraph = {
		{id = "notes-graph", noGap = 0, type = 0}
	}
	
	parts.bpmgraph = {
		{id = "bpmgraph"}
	}
	
	parts.value = {
		-- 総ノート数（鍵盤のみ）
		{id = "totalnote-normal", src = 5, x = 2401, y = 510, w = 242, h = 15, divx = 11, digit = 4, ref = 350},
		-- 総皿
		{id = "totalnote-scr", src = 5, x = 2401, y = 510, w = 242, h = 15, divx = 11, digit = 4, ref = 352},
		-- 総LN
		{id = "totalnote-ln", src = 5, x = 2401, y = 510, w = 242, h = 15, divx = 11, digit = 4, ref = 351},
		-- 総bss
		{id = "totalnote-bss", src = 5, x = 2401, y = 510, w = 242, h = 15, divx = 11, digit = 4, ref = 353},
		-- ピーク密度
		{id = "density-peak", src = 5, x = 2401, y = 510, w = 242, h = 15, divx = 11, digit = 4, ref = 360},
		-- エンド密度
		{id = "density-end", src = 5, x = 2401, y = 510, w = 242, h = 15, divx = 11, digit = 4, ref = 362},
		-- 平均密度
		{id = "density-average", src = 5, x = 2401, y = 510, w = 242, h = 15, divx = 11, digit = 4, ref = 364}
	}
	
	parts.destination = {
		{id = "detail-frame", dst = {
			{x = window_posx, y = window_posy, w = 551, h = 194}
		}},
		{id = -110, dst = {
			{x = window_posx +6, y = window_posy +87, w = 415, h = 100}
		}},
		{id = "notes-graph", op = {2, 5}, dst = {
			{x = window_posx +6, y = window_posy +87, w = 415, h = 100}
		}},
		{id = "bpmgraph", op = {2, 5}, dst = {
			{x = window_posx + 6, y = window_posy + 87, w = 415, h = 100}
		}},
		{id = "totalnote-normal", dst = {
			{x = window_posx + 471, y = window_posy + 160, w = 18, h = 15}
		}},
		{id = "totalnote-scr", dst = {
			{x = window_posx + 471, y = window_posy + 111, w = 18, h = 15}
		}},
		{id = "totalnote-ln", dst = {
			{x = window_posx + 471, y = window_posy + 66, w = 18, h = 15}
		}},
		{id = "totalnote-bss", dst = {
			{x = window_posx + 471, y = window_posy + 17, w = 18, h = 15}
		}},
		{id = "density-peak", dst = {
			{x = window_posx + 240, y = window_posy + 65, w = 18, h = 15}
		}},
		{id = "density-end", dst = {
			{x = window_posx + 240, y = window_posy + 38, w = 18, h = 15}
		}},
		{id = "density-average", dst = {
			{x = window_posx + 240, y = window_posy + 7, w = 18, h = 15}
		}}	
	}
	
	return parts
end

return {
	load = load
}