local parts = {}

local function load()
	parts.source = {
			{id = "src-default-skinselect-parts", path = "customize/advanced/default_skinselect/parts.png"},
		}
		
	parts.image = {
		{id = "default_skinselect_button_off",	src = "src-default-skinselect-parts", x = 0, y = 0, w = 50, h = 50, act = 14},
		{id = "default_skinselect_button_rect",	src = "src-default-skinselect-parts", x = 50, y = 0, w = 50, h = 50},
	}
		
	local button_x = 350
	local button_y = 990
	
	parts.destination = {
		{id = "default_skinselect_button_off",	dst = {{x = button_x, y = button_y, w = 50, h = 50}}},
		{id = "default_skinselect_button_rect",	dst = {{x = button_x, y = button_y, w = 50, h = 50}}, mouseRect = {x = 0, y = 0, w = 50, h = 50}}		
	}	
	
	return parts	
end

return {
	parts = parts,
	load = load
}