local parts = {}

local function load()

	local parts_position = {x = 1305, y = 990}
	
	parts.source = {{id = "src-default_modechange_parts", path = "customize/advanced/default_modechange2/parts.png"}}

	parts.image = {
		{id = "default_modechange_allkeys",		src = "src-default_modechange_parts", x = 0, y = 0, w = 150, h = 50},
		{id = "default_modechange_5keys",		src = "src-default_modechange_parts", x = 0, y = 50, w = 150, h = 50},
		{id = "default_modechange_7keys",		src = "src-default_modechange_parts", x = 0, y = 100, w = 150, h = 50},
		{id = "default_modechange_10keys",		src = "src-default_modechange_parts", x = 0, y = 150, w = 150, h = 50},
		{id = "default_modechange_14keys",		src = "src-default_modechange_parts", x = 0, y = 200, w = 150, h = 50},
		{id = "default_modechange_9keys",		src = "src-default_modechange_parts", x = 0, y = 250, w = 150, h = 50},
		{id = "default_modechange_24keys",		src = "src-default_modechange_parts", x = 0, y = 300, w = 150, h = 50},
		{id = "default_modechange_24keysDP",	src = "src-default_modechange_parts", x = 0, y = 350, w = 150, h = 50},
		{id = "default_modechange_sortset",		src = "src-default_modechange_parts", x = 150, y = 0, w = 150, h = 400, divy = 8, len = 8, ref = 12, act = 12, click = 2},
		{id = "default_modechange_lnmodeset",	src = "src-default_modechange_parts", x = 300, y = 0, w = 150, h = 150, divy = 3, len = 3, ref = 308, act = 308, click = 2},
		{id = "default_modechange_rect",		src = "src-default_modechange_parts", x = 300, y = 150, w = 150, h = 50}
	}

	parts.imageset = {
		{id = "default_modechange_modeset", ref = 11, images = {
		"default_modechange_allkeys",
		"default_modechange_5keys",
		"default_modechange_7keys",
		"default_modechange_10keys",
		"default_modechange_14keys",
		"default_modechange_9keys",
		"default_modechange_24keys",
		"default_modechange_24keysDP"},
		act = 11, click = 2
		}
	}
	
	parts.destination = {
		{id = "default_modechange_modeset",		dst = {{x = parts_position.x, y = parts_position.y, w = 150, h = 50}}},
		{id = "default_modechange_sortset",		dst = {{x = parts_position.x + 180, y = parts_position.y, w = 150, h = 50}}},
		{id = "default_modechange_lnmodeset",	dst = {{x = parts_position.x + 360, y = parts_position.y, w = 150, h = 50}}},
		{id = "default_modechange_rect",		dst = {{x = parts_position.x, y = parts_position.y, w = 150, h = 50}}, mouseRect = {x = 0, y = 0, w = 150, h = 50}},
		{id = "default_modechange_rect",		dst = {{x = parts_position.x + 180, y = parts_position.y, w = 150, h = 50}}, mouseRect = {x = 0, y = 0, w = 150, h = 50}},
		{id = "default_modechange_rect",		dst = {{x = parts_position.x + 360, y = parts_position.y, w = 150, h = 50}}, mouseRect = {x = 0, y = 0, w = 150, h = 50}}
	}
	
	return parts	
end

return {
	parts = parts,
	load = load
}