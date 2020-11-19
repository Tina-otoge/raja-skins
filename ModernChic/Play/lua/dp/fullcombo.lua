--[[
	フルコンボ演出
--]]
local function load(laneLeftPosX, laneRightPosX, notesPositionY)
	local parts = {}
	
	parts.image = {
		-- フルコン
		{id = "fc", src = 13, x = 0, y = 0, w = 5190, h = 2571, divx = 10, divy = 3, cycle = 1500, timer = 48},
		-- FULL
		{id = "wd_full", src = 1, x = 1100, y = 460, w = 400, h = 90},
		-- COMBO
		{id = "wd_combo", src = 1, x = 1100, y = 550, w = 400, h = 90},
	}
	
	parts.destination = {}

	local posX = {laneLeftPosX, laneRightPosX}
	for i = 1, 2, 1 do
		table.insert(parts.destination, {
			id = "fc", loop = -1, timer = 48, blend = 2, dst = {
				{time = 0,x = posX[i], y = notesPositionY, w = 519, h = 857},
				{time = 1000},
				{time = 1500, a = 0}
			}
		})
		table.insert(parts.destination, {
			id = "wd_full", offset = 3, loop = -1, timer = 48, dst = {
				{time = 500,x = posX[i] + 519, y = notesPositionY + 230, w = 400, h = 90, a = 0},
				{time = 600, x = posX[i] + 100, a = 255},
				{time = 1900, x = posX[i]},
				{time = 2000, x = posX[i] - 519, a = 0}
			}
		})
		table.insert(parts.destination, {
			id = "wd_combo", offset = 3, loop = -1, timer = 48, dst = {
				{time = 500,x = posX[i] - 519, y = notesPositionY + 150, w = 400, h = 90, a = 0},
				{time = 600, x = posX[i], a = 255},
				{time = 1900, x = posX[i] + 100},
				{time = 2000, x = posX[i] + 519, a = 0}
			}
		})
	end
	return parts
end

return {
	load = load
}