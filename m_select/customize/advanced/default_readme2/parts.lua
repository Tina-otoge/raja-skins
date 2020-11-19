local parts = {}

local function load()
	parts.source = {
			{id = "src-default-readme-parts", path = "customize/advanced/default_readme2/parts.png"},
		}
		
	parts.image = {
		{id = "default_readme_button_off",	src = "src-default-readme-parts", x = 0, y = 0, w = 50, h = 50, act = 17},
		{id = "default_readme_button_rect",	src = "src-default-readme-parts", x = 50, y = 0, w = 50, h = 50},
	}
		
	local button_x = 530
	local button_y = 990
	
	parts.destination = {
		{id = "default_readme_button_off",	dst = {{x = button_x, y = button_y, w = 50, h = 50}}},
		{id = "default_readme_button_rect",	dst = {{x = button_x, y = button_y, w = 50, h = 50}}, mouseRect = {x = 0, y = 0, w = 50, h = 50}}		
	}	
	
	return parts	
end

return {
	parts = parts,
	load = load
}