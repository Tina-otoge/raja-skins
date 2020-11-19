--[[
	コース・段位認定・制限表示
--]]
local function load()
	local parts = {}
	
	parts.image = {
		-- コース情報
		{id = "course-frame", src = 5, x = 1500, y = 1470, w = 1005, h = 345},
		{id = "course-op-random", src = 5, x = 1519, y = 1816, w = 192, h = 28},
		{id = "course-op-mirror", src = 5, x = 1519, y = 1845, w = 192, h = 28},
		{id = "course-op-nospeed", src = 5, x = 1713, y = 1816, w = 192, h = 28},
		{id = "course-op-nogood", src = 5, x = 1907, y = 1816, w = 192, h = 28},
		{id = "course-op-nogreat", src = 5, x = 1907, y = 1845, w = 192, h = 28},
		{id = "course-gauge-lr2", src = 5, x = 2101, y = 1816, w = 192, h = 28},
		{id = "course-gauge-5", src = 5, x = 2101, y = 1845, w = 192, h = 28},
		{id = "course-gauge-7", src = 5, x = 2101, y = 1874, w = 192, h = 28},
		{id = "course-gauge-9", src = 5, x = 2101, y = 1903, w = 192, h = 28},
		{id = "course-gauge-24", src = 5, x = 2101, y = 1932, w = 192, h = 28},
		{id = "course-op-ln", src = 5, x = 2295, y = 1816, w = 192, h = 28},
		{id = "course-op-cn", src = 5, x = 2295, y = 1845, w = 192, h = 28},
		{id = "course-op-hcn", src = 5, x = 2295, y = 1874, w = 192, h = 28},
	}

	local posX = 30
	
	parts.destination = {
		{id = "course-frame", op = {3}, dst = {
			{x = posX, y = 410, w = 1005, h = 345}
		}},
		{id = "course-op-random", op = {3, 1004}, dst = {
			{x = posX + 19, y = 417, w = 192, h = 28}
		}},
		{id = "course-op-mirror", op = {3, 1003}, dst = {
			{x = posX + 19, y = 417, w = 192, h = 28}
		}},
		{id = "course-op-nospeed", op = {3, 1005}, dst = {
			{x = posX + 213, y = 417, w = 192, h = 28}
		}},
		{id = "course-op-nogood", op = {3, 1006}, dst = {
			{x = posX + 407, y = 417, w = 192, h = 28}
		}},
		{id = "course-op-nogreat", op = {3, 1007}, dst = {
			{x = posX + 407, y = 417, w = 192, h = 28}
		}},
		{id = "course-gauge-lr2", op = {3, 1010}, dst = {
			{x = posX + 601, y = 417, w = 192, h = 28}
		}},
		{id = "course-gauge-5", op = {3, 1011}, dst = {
			{x = posX + 601, y = 417, w = 192, h = 28}
		}},
		{id = "course-gauge-7", op = {3, 1012}, dst = {
			{x = posX + 601, y = 417, w = 192, h = 28}
		}},
		{id = "course-gauge-9", op = {3, 1013}, dst = {
			{x = posX + 601, y = 417, w = 192, h = 28}
		}},
		{id = "course-gauge-24", op = {3, 1014}, dst = {
			{x = posX + 601, y = 417, w = 192, h = 28}
		}},
		{id = "course-op-ln", op = {3, 1015}, dst = {
			{x = posX + 795, y = 417, w = 192, h = 28}
		}},
		{id = "course-op-cn", op = {3, 1016}, dst = {
			{x = posX + 795, y = 417, w = 192, h = 28}
		}},
		{id = "course-op-hcn", op = {3, 1017}, dst = {
			{x = posX + 795, y = 417, w = 192, h = 28}
		}},
		-- text
		{id = "course1", timer = 11, loop = 300, op = {3}, dst = {
			{time = 0, x = posX + 554, y = 685, w = 1, h = 30, r = 190, g = 190, b = 0},
			{time = 300, w = 850}
		}},
		{id = "course2", timer = 11, loop = 300, op = {3}, dst = {
			{time = 0, x = posX + 554, y = 633, w = 1, h = 30, r = 170, g = 170, b = 0},
			{time = 300, w = 850}
		}},
		{id = "course3", timer = 11, loop = 300, op = {3}, dst = {
			{time = 0, x = posX + 554, y = 581, w = 1, h = 30, r = 150, g = 150, b = 0},
			{time = 300, w = 850}
		}},
		{id = "course4", timer = 11, loop = 300, op = {3}, dst = {
			{time = 0, x = posX + 554, y = 529, w = 1, h = 30, r = 130, g = 130, b = 0},
			{time = 300, w = 850}
		}},
		{id = "course5", timer = 11, loop = 300, op = {3}, dst = {
			{time = 0, x = posX + 554, y = 477, w = 1, h = 30, r = 110, g = 110, b = 0},
			{time = 300, w = 850}
		}},
	}
	
	return parts
end

return {
	load = load
}