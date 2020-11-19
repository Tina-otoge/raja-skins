local parts = {}
parts.filepath = {
	{name = "背景(静止画/動画)", path = "customize/background/*"}
}

local function load()	
	parts.source = {
		{id = "src-default-background-background", path = "customize/background/*"}
	}
	
	parts.image = {
		{id = "default_background_background", src = "src-default-background-background", x = 0, y = 0, w = -1, h = -1}
	}
	
	parts.destination = {
		{id = "default_background_background", stretch = 2, dst = {{x = 0, y = 0, w = 1920, h = 1080}}}
	}	
	
	return parts	
end

return {
	parts = parts,
	load = load
}