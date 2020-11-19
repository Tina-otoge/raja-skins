local parts = {}

local function load()

	local window_position = {x = 730, y = 990}
	local font1_id = "font-default-commonparts-VL-Gothic-Regular"

	parts.source = {{id = "src-default-search-parts", path = "customize/advanced/default_search2/parts.png"}}
	parts.image = {{id = "default_search_window",	src = "src-default-search-parts", x = 0, y = 0, w = 350, h = 50}}
	parts.text = {{id = "default_search_search", font = font1_id, size = 24, ref = 30}}
	
	parts.destination = {
		{id = "default_search_window",	dst = {{x = window_position.x, y = window_position.y, w = 350, h = 50}}},
		{id = "default_search_search",	dst = {{x = window_position.x + 12, y = window_position.y + 14, w = 326, h = 24}}}
	}
	
	return parts	
end

return {
	parts = parts,
	load = load
}