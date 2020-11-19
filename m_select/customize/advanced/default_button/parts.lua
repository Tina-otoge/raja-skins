local parts = {}

local function load()
	
	local src1_id = "src-default_button_parts"
	
	parts.source = {
		{id = src1_id, path = "customize/advanced/default_button/parts.png"}
	}

	parts.image = {
		{id = "default_button_parts",		src = src1_id, x = 0, y = 0, w = 379, h = 113},
		{id = "default_button_autoplay",	src = src1_id, x = 0, y = 113, w = 106, h = 23, act = 16},
		{id = "default_button_practice",	src = src1_id, x = 0, y = 113, w = 106, h = 23, act = 315},
		{id = "default_button_play",		src = src1_id, x = 0, y = 113, w = 106, h = 23, act = 15},
		{id = "default_button_replay",		src = src1_id, x = 106, y = 113, w = 46, h = 17, act = 19},
		{id = "default_button_replay2",		src = src1_id, x = 106, y = 113, w = 46, h = 17, act = 316},
		{id = "default_button_replay3",		src = src1_id, x = 106, y = 113, w = 46, h = 17, act = 317},
		{id = "default_button_replay4",		src = src1_id, x = 106, y = 113, w = 46, h = 17, act = 318},
	}
	
	parts.destination = {
		{id = "default_button_parts",						dst = {{x = 0, y = 463, w = 379, h = 113}}},
		{id = "default_button_autoplay", op = {2},			dst = {{x = 22, y = 520, w = 106, h = 23}}},
		{id = "default_button_autoplay", op = {3},			dst = {{x = 22, y = 520, w = 106, h = 23}}},
		{id = "default_button_practice", op = {2},			dst = {{x = 142, y = 520, w = 106, h = 23}}},
		{id = "default_button_play",	 op = {2},			dst = {{x = 262, y = 520, w = 106, h = 23}}},
		{id = "default_button_play",	 op = {3},			dst = {{x = 262, y = 520, w = 106, h = 23}}},
		{id = "default_button_replay",	op = {1205},		dst = {{time = 0,	x = 142, y = 494, w = 46, h = 17, a = 255},{time = 100, a = 153},{time = 200, a = 255}}},
		{id = "default_button_replay",	op = {197,-1205},	dst = {{time = 0,	x = 142, y = 494, w = 46, h = 17}}},
		{id = "default_button_replay2", op = {1206},		dst = {{time = 0,	x = 202, y = 494, w = 46, h = 17, a = 255},{time = 100, a = 153},{time = 200, a = 255}}},
		{id = "default_button_replay2", op = {1197,-1206},	dst = {{			x = 202, y = 494, w = 46, h = 17}}},
		{id = "default_button_replay3", op = {1207},		dst = {{time = 0,	x = 262, y = 494, w = 46, h = 17, a = 255},{time = 100, a = 153},{time = 200, a = 255}}},
		{id = "default_button_replay3", op = {1200,-1207},	dst = {{			x = 262, y = 494, w = 46, h = 17}}},
		{id = "default_button_replay4", op = {1208},		dst = {{time = 0,	x = 322, y = 494, w = 46, h = 17, a = 255},{time = 100, a = 153},{time = 200, a = 255}}},
		{id = "default_button_replay4", op = {1203,-1208},	dst = {{			x = 322, y = 494, w = 46, h = 17}}},
	}
	
	return parts	
end

return {
	parts = parts,
	load = load
}