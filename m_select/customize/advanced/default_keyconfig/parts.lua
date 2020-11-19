local parts = {}

local function load()
	parts.source = {
			{id = "src-default-keyconfig-parts", path = "customize/advanced/default_keyconfig/parts.png"},
		}
		
	parts.image = {
		{id = "default_keyconfig_button_off",	src = "src-default-keyconfig-parts", x = 0, y = 0, w = 50, h = 50, act = 13},
		{id = "default_keyconfig_button_rect",	src = "src-default-keyconfig-parts", x = 50, y = 0, w = 50, h = 50},
	}
		
	local button_x = 410
	local button_y = 990
	
	parts.destination = {
		{id = "default_keyconfig_button_off",	dst = {{x = button_x, y = button_y, w = 50, h = 50}}},
		{id = "default_keyconfig_button_rect",	dst = {{x = button_x, y = button_y, w = 50, h = 50}}, mouseRect = {x = 0, y = 0, w = 50, h = 50}}		
	}	
	
	return parts	
end

return {
	parts = parts,
	load = load
}