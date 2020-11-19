local parts = {}

local function load()

	parts.source = {
		{id = "src-default-selectinfo2-parts", path = "customize/advanced/default_selectinfo2/parts.png"}
	}

	parts.image = {
		{id = "default_selectinfo2_parts", src = "src-default-selectinfo2-parts", x = 0, y = 80, w = 378, h = 111}
	}
	
	parts.destination = {
		{id = "default_selectinfo2_parts", dst = {{x = 40, y = 870, w = 378, h = 111}}}
	}
		
	return parts	
end

return {
	parts = parts,
	load = load
}