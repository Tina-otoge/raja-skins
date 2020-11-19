local parts = {}

local function load()
	parts.source = {
			{id = "src-default-volumeslider-parts", path = "customize/advanced/default_volumeslider2/parts.png"},
		}
		
	local menu_flag = false
	local function menu_open_close()
		menu_flag = not menu_flag
	end
		
	parts.image = {
		{id = "default_volumeslider_button_off",	src = "src-default-volumeslider-parts", x = 0, y = 0, w = 50, h = 50, act = (function() return menu_open_close() end)},
		{id = "default_volumeslider_button_rect",	src = "src-default-volumeslider-parts", x = 50, y = 0, w = 50, h = 50},
		{id = "default_volumeslider_button_on",		src = "src-default-volumeslider-parts", x = 100, y = 0, w = 50, h = 50},
		{id = "default_volumeslider_bg",			src = "src-default-volumeslider-parts", x = 0, y = 106, w = 149, h = 150},
	}
	
	parts.slider = {
		{id = "default_volumeslider_master",	src = "src-default-volumeslider-parts", x = 0, y = 96, w = 21, h = 10, angle = 0, range = 101, type = 17},
		{id = "default_volumeslider_key",		src = "src-default-volumeslider-parts", x = 0, y = 96, w = 21, h = 10, angle = 0, range = 101, type = 18},
		{id = "default_volumeslider_bgm",		src = "src-default-volumeslider-parts", x = 0, y = 96, w = 21, h = 10, angle = 0, range = 101, type = 19},
	}
	
	local menu = get_customTimer_id()	
	parts.customTimers = {
		{id = menu, timer = timer_util.timer_observe_boolean(function() return menu_flag end)},
	}
	
	local button_x = 650
	local button_y = 990
	local bg_x = button_x -54
	local bg_y = button_y - 169
	local slider_m_x = bg_x + 35
	local slider_k_x = bg_x + 69
	local slider_b_x = bg_x + 103
	local slider_y = bg_y + 14
	
	parts.destination = {
		{id = "default_volumeslider_button_off",				dst = {{x = button_x, y = button_y, w = 50, h = 50}}},
		{id = "default_volumeslider_button_rect",				dst = {{x = button_x, y = button_y, w = 50, h = 50}}, mouseRect = {x = 7, y = 7, w = 36, h = 36}},
		{id = "default_volumeslider_button_on", timer = menu,	dst = {{x = button_x, y = button_y, w = 50, h = 50}}},
		{id = -110,								timer = menu,	dst = {{x = bg_x, y = bg_y, w = 159, h = 160, a = 153}}},
		{id = "default_volumeslider_bg",		timer = menu,	dst = {{x = bg_x + 5, y = bg_y + 5, w = 149, h = 150}}},
		{id = "default_volumeslider_master",	timer = menu,	dst = {{x = slider_m_x, y = slider_y, w = 21, h = 10}}},
		{id = "default_volumeslider_key",		timer = menu,	dst = {{x = slider_k_x, y = slider_y, w = 21, h = 10}}},
		{id = "default_volumeslider_bgm",		timer = menu,	dst = {{x = slider_b_x, y = slider_y, w = 21, h = 10}}},
		
	}	
	
	return parts	
end

return {
	parts = parts,
	load = load
}