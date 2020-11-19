local parts = {}

parts.filepath = {
	{name = "ステージファイルが無い場合に表示する画像", path = "customize/no_stagefile_image/*"}
}

local function load()
	local parts_position = {x = 14, y = 598}
	
	parts.source = {
		{id = "src-default-stagefile2-parts", path = "customize/advanced/default_stagefile2/parts.png"},
		{id = "src-default-stagefile2-img", path = "customize/no_stagefile_image/*"}
	}
	
	parts.image = {
		{id = "default_stagefile2_parts", src = "src-default-stagefile2-parts", x = 0, y = 0, w = 328, h = 248},
		{id = "default_stagefile2_img", src = "src-default-stagefile2-img", x = 0, y = 0, w = -1, h = -1}
	}

	parts.destination = {			
		{id = "default_stagefile2_parts", timer = 11, op = {2,191}, dst = {{x = parts_position.x, y = parts_position.y, w = 328, h = 248, a = 128}}},
		{id = -100, stretch = 1, filter = 1, timer = 11, dst = {{x = parts_position.x + 4, y = parts_position.y + 4, w = 320, h = 240}}},
		{id = "default_stagefile2_parts", timer = 11, op = {2,190}, dst = {{x = parts_position.x, y = parts_position.y, w = 328, h = 248, a = 128}}},
		{id = "default_stagefile2_img", stretch = 1, filter = 1, timer = 11, op = {2,190}, dst = {{x = parts_position.x + 4, y = parts_position.y + 4, w = 320, h = 240}}}
	}				
	
	return parts	
end

return {
	parts = parts,
	load = load
}