local parts = {}

local function load()
	parts.source = {
		{id = "src-default-gradation-parts", path = "customize/advanced/default_gradation/parts.png"},
	}
	
	parts.image = {
		{id = "default_gradation_parts", src = "src-default-gradation-parts", x = 0, y = 0, w = -1, h = -1},
	}
	
	parts.destination = {
		{id = "default_gradation_parts", dst = {{x = 0, y = 0, w = 1920, h = 1080}}},
	}	
	
	return parts	
end

return {
	parts = parts,
	load = load
}