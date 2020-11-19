function img_bomb_key_1p(var)

	local img = {}

	for i = 1, var do
		table.insert(img, {id = "bomb-" .. i,			src = "src-bomb", x = 0, y = 0, w = -1, h = -1, divx = 4, divy = 4, timer = 50 + i, cycle = 251})
		table.insert(img, {id = "bomb-pg-" .. i,		src = "src-bomb-pg", x = 0, y = 0, w = -1, h = -1, divx = 4, divy = 4, timer = 50 + i, cycle = 251})
		table.insert(img, {id = "hold" .. i,			src = "src-hold-effect", x = 0, y = 0, w = -1, h = -1, divx = 4, divy = 4, timer = 70 + i, cycle = 500})
		table.insert(img, {id = "hold" .. i .. "-b",	src = "src-bomb-hold", x = 0, y = 0, w = -1, h = -1, divx = 4, divy = 4, timer = 70 + i, cycle = 251})

		table.insert(img, {id = "oadxbomb" .. i,		src = "src-oadxbomb", x = 0, y = 0, w = -1, h = 192, divx = 16, timer = 50 + i, cycle = 251})
		table.insert(img, {id = "oadxhold" .. i,		src = "src-oadxbomb", x = 0, y = 0, w = -1, h = 192, divx = 16, timer = 50 + i, cycle = 80})
	end

	return img
	
end

function img_bomb_scratch_1p()

	local img = {}

	table.insert(img, {id = "bomb-s",		src = "src-bomb", x = 0, y = 0, w = -1, h = -1, divx = 4, divy = 4, timer = 50, cycle = 251})
	table.insert(img, {id = "bomb-pg-s",	src = "src-bomb-pg", x = 0, y = 0, w = -1, h = -1, divx = 4, divy = 4, timer = 50, cycle = 251})
	table.insert(img, {id = "holds",		src = "src-hold-effect", x = 0, y = 0, w = -1, h = -1, divx = 4, divy = 4, timer = 70, cycle = 500})
	table.insert(img, {id = "holds-b",		src = "src-bomb-hold", x = 0, y = 0, w = -1, h = -1, divx = 4, divy = 4, timer = 70, cycle = 251})

	table.insert(img, {id = "oadxbombs",	src = "src-oadxbomb", x = 0, y = 0, w = -1, h = 192, divx = 16, timer = 50, cycle = 251})
	table.insert(img, {id = "oadxholds",	src = "src-oadxbomb", x = 0, y = 0, w = -1, h = 192, divx = 16, timer = 50, cycle = 80})

	return img
	
end