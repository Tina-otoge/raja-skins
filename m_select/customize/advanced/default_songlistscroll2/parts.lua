local parts = {}

local function load()
	
	local parts_position = {x = 1888, y = 270}
	
	parts.source = {{id = "src-default-songlistscroll2-parts", path = "customize/advanced/default_songlistscroll2/parts.png"}}
	parts.image = {{id = "default_songlistscroll2_frame", src = "src-default-songlistscroll2-parts", x = 0, y = 0, w = 16, h = 540}}
	parts.slider = {
		{id = "default_songlistscroll2_scroll", src = "src-default-songlistscroll2-parts", x = 16, y = 0, w = 64, h = 64, angle = 2, range = 478, type = 1, changeable = false},
		{id = "default_songlistscroll2_collision", src = "src-default-songlistscroll2-parts", x = 80, y = 0, w = 64, h = 64, angle = 2, range = 500, type = 1}
	}
	parts.destination = {
		{id = "default_songlistscroll2_frame", dst = {{x = parts_position.x, y = parts_position.y, w = 16, h = 540}}},
		{id = "default_songlistscroll2_scroll", loop = 0, blend = 2, dst = {{time = 0, x = parts_position.x - 24, y = parts_position.y + 477, w = 64, h = 64, a = 255},{time = 200, a = 162}}},
		{id = "default_songlistscroll2_collision", dst = {{time = 0, x = parts_position.x - 24, y = parts_position.y + 520, w = 64, h = 64}}}
	}
	
	return parts
end

return {
	parts = parts,
	load = load
}