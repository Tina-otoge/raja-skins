--[[
	フルコンボ演出
--]]
local function load(position_x, notes_position_y)
	local parts = {}
	
	parts.image = {
		-- フルコン
		{id = "fc", src = 13, x = 0, y = 0, w = 5190, h = 2571, divx = 10, divy = 3, cycle = 1500, timer = 48},
		-- FULL
		{id = "wd_full", src = 1, x = 1200, y = 1050, w = 400, h = 90},
		-- COMBO
		{id = "wd_combo", src = 1, x = 1200, y = 1140, w = 400, h = 90},
	}
	
	parts.destination = {
		-- フルコン演出
		{id = "fc", loop = -1, timer = 48, blend = 2, dst = {
			{time = 0,x = position_x, y = notes_position_y, w = 519, h = 857},
			{time = 1000},
			{time = 1500, a = 0}
		}},
		{id = "wd_full", offset = 3, loop = -1, timer = 48, dst = {
			{time = 500,x = position_x + 519, y = notes_position_y + 230, w = 400, h = 90, a = 0},
			{time = 600, x = position_x + 100, a = 255},
			{time = 1900, x = position_x},
			{time = 2000, x = position_x - 519, a = 0}
		}},
		{id = "wd_combo", offset = 3, loop = -1, timer = 48, dst = {
			{time = 500,x = position_x - 519, y = notes_position_y + 150, w = 400, h = 90, a = 0},
			{time = 600, x = position_x, a = 255},
			{time = 1900, x = position_x + 100},
			{time = 2000, x = position_x + 519, a = 0}
		}},
	}
	
	return parts
end

return {
	load = load
}