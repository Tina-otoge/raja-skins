local parts = {}

local function load()
	local t_time = {}

	local time_x = 1584
	local time_y = 1053			
	
	local time_year_x	= time_x
	local time_month_x	= time_year_x + 80
	local time_day_x	= time_month_x + 40
	local time_hour_x	= time_day_x + 50
	local c1_x			= time_hour_x + 40
	local time_minute_x	= c1_x + 20
	local c2_x			= time_minute_x + 40
	local time_second_x = c2_x + 20
	
	parts.image = {
		{id = "default_time_colon", src = "src-default-commonparts-system", x = 20, y = 859, w = 20, h = 21},
	}

	parts.value = {
		{id = "default_time_year",		src = "src-default-commonparts-system", x = 0, y = 817, w = 220, h = 21, divx = 11, digit = 4, ref = 21},
		{id = "default_time_month",		src = "src-default-commonparts-system", x = 0, y = 817, w = 220, h = 21, divx = 11, digit = 2, ref = 22},
		{id = "default_time_day",		src = "src-default-commonparts-system", x = 0, y = 817, w = 220, h = 21, divx = 11, digit = 2, ref = 23},
		{id = "default_time_hour",		src = "src-default-commonparts-system", x = 0, y = 817, w = 220, h = 21, divx = 11, digit = 2, ref = 24},
		{id = "default_time_minute",	src = "src-default-commonparts-system", x = 0, y = 817, w = 220, h = 21, divx = 11, digit = 2, ref = 25},
		{id = "default_time_second",	src = "src-default-commonparts-system", x = 0, y = 817, w = 220, h = 21, divx = 11, digit = 2, ref = 26},
	}
	
	parts.destination = {
		{id = "default_time_year",		dst = {{x = time_year_x,	y = time_y, w = 20, h = 21}}},
		{id = "default_time_month",		dst = {{x = time_month_x,	y = time_y, w = 20, h = 21}}},
		{id = "default_time_day",		dst = {{x = time_day_x,		y = time_y, w = 20, h = 21}}},
		{id = "default_time_hour",		dst = {{x = time_hour_x,	y = time_y, w = 20, h = 21}}},
		{id = "default_time_colon",		dst = {{x = c1_x,			y = time_y, w = 20, h = 21}}},
		{id = "default_time_minute",	dst = {{x = time_minute_x,	y = time_y, w = 20, h = 21}}},
		{id = "default_time_colon",		dst = {{x = c2_x,			y = time_y, w = 20, h = 21}}},
		{id = "default_time_second",	dst = {{x = time_second_x,	y = time_y, w = 20, h = 21}}},
	}
	
	return parts	
end

return {
	parts = parts,
	load = load
}