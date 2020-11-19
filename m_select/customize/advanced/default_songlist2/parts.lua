local parts = {}

local ID_LIST_TITLE = get_offset_id()

parts.filepath = {
	{name = "ソングリストに使用するフォント(ttf)", path = "customize/advanced/default_songlist2/ttf/*.ttf", def = "VL-Gothic-Regular.ttf"},
}
parts.offset = {
	{name = "ソングリストの楽曲名表示位置調節", id = ID_LIST_TITLE, y = true}
}


local function load()

	local font1_path = nil
	do
		local font1_get_path = skin_config.get_path("customize/advanced/default_songlist2/ttf/*.ttf")
		local font1_sub = string.find(font1_get_path, "customize")
		font1_path = string.sub(font1_get_path, font1_sub)
	end

	parts.source = {
		{id = "src-default-songlist2-songbar",		path = "customize/advanced/default_songlist2/songbar.png"},
		{id = "src-default-songlist2-clearlamp",	path = "customize/advanced/default_songlist2/clearlamp.png"},
	}

	parts.font = {
		{id = "font-default-songlist2", path = font1_path},
	}

	parts.image = {
		{id = "default_songlist2_bar_song",		src = "src-default-songlist2-songbar", x = 0, y = 0, w = 750, h = 54},
		{id = "default_songlist2_bar_folder",	src = "src-default-songlist2-songbar", x = 0, y = 54, w = 750, h = 54},
		{id = "default_songlist2_bar_table",	src = "src-default-songlist2-songbar", x = 0, y = 108, w = 750, h = 54},
		{id = "default_songlist2_bar_grade",	src = "src-default-songlist2-songbar", x = 0, y = 162, w = 750, h = 54},
		{id = "default_songlist2_bar_nograde",	src = "src-default-songlist2-songbar", x = 0, y = 216, w = 750, h = 54},
		{id = "default_songlist2_bar_command",	src = "src-default-songlist2-songbar", x = 0, y = 270, w = 750, h = 54},
		{id = "default_songlist2_bar_search",	src = "src-default-songlist2-songbar", x = 0, y = 324, w = 750, h = 54},
		{id = "default_songlist2_bar_nosong",	src = "src-default-songlist2-songbar", x = 0, y = 378, w = 750, h = 54},

		{id = "default_songlist2_lamp_noplay",	src = "src-default-songlist2-clearlamp", x = 0, y = 0, w = 84, h = 72, divx = 2},
		{id = "default_songlist2_lamp_failed",	src = "src-default-songlist2-clearlamp", x = 0, y = 72, w = 84, h = 72, divx = 2, cycle = 50},
		{id = "default_songlist2_lamp_assist",	src = "src-default-songlist2-clearlamp", x = 0, y = 144, w = 84, h = 72, divx = 2},
		{id = "default_songlist2_lamp_lassist",	src = "src-default-songlist2-clearlamp", x = 0, y = 216, w = 84, h = 72, divx = 2},
		{id = "default_songlist2_lamp_easy",	src = "src-default-songlist2-clearlamp", x = 0, y = 288, w = 84, h = 72, divx = 2},
		{id = "default_songlist2_lamp_normal",	src = "src-default-songlist2-clearlamp", x = 0, y = 360, w = 84, h = 72, divx = 2},
		{id = "default_songlist2_lamp_hard",	src = "src-default-songlist2-clearlamp", x = 0, y = 432, w = 84, h = 72, divx = 2},
		{id = "default_songlist2_lamp_exhard",	src = "src-default-songlist2-clearlamp", x = 0, y = 504, w = 84, h = 72, divx = 2, cycle = 100},
		{id = "default_songlist2_lamp_fc",		src = "src-default-songlist2-clearlamp", x = 0, y = 576, w = 84, h = 72, divx = 2, cycle = 100},
		{id = "default_songlist2_lamp_perfect",	src = "src-default-songlist2-clearlamp", x = 0, y = 648, w = 84, h = 72, divx = 2, cycle = 100},
		{id = "default_songlist2_lamp_max",		src = "src-default-songlist2-clearlamp", x = 0, y = 720, w = 84, h = 72, divx = 2, cycle = 100},
		
		{id = "default_songlist2_lamp_noplay_p",	src = "src-default-songlist2-clearlamp", x = 84, y = 0, w = 84, h = 72, divx = 2},
		{id = "default_songlist2_lamp_failed_p",	src = "src-default-songlist2-clearlamp", x = 84, y = 72, w = 84, h = 72, divx = 2, cycle = 50},
		{id = "default_songlist2_lamp_assist_p",	src = "src-default-songlist2-clearlamp", x = 84, y = 144, w = 84, h = 72, divx = 2},
		{id = "default_songlist2_lamp_lassist_p",	src = "src-default-songlist2-clearlamp", x = 84, y = 216, w = 84, h = 72, divx = 2},
		{id = "default_songlist2_lamp_easy_p",		src = "src-default-songlist2-clearlamp", x = 84, y = 288, w = 84, h = 72, divx = 2},
		{id = "default_songlist2_lamp_normal_p",	src = "src-default-songlist2-clearlamp", x = 84, y = 360, w = 84, h = 72, divx = 2},
		{id = "default_songlist2_lamp_hard_p",		src = "src-default-songlist2-clearlamp", x = 84, y = 432, w = 84, h = 72, divx = 2},
		{id = "default_songlist2_lamp_exhard_p",	src = "src-default-songlist2-clearlamp", x = 84, y = 504, w = 84, h = 72, divx = 2, cycle = 100},
		{id = "default_songlist2_lamp_fc_p",		src = "src-default-songlist2-clearlamp", x = 84, y = 576, w = 84, h = 72, divx = 2, cycle = 100},
		{id = "default_songlist2_lamp_perfect_p",	src = "src-default-songlist2-clearlamp", x = 84, y = 648, w = 84, h = 72, divx = 2, cycle = 100},
		{id = "default_songlist2_lamp_max_p",		src = "src-default-songlist2-clearlamp", x = 84, y = 720, w = 84, h = 72, divx = 2, cycle = 100},
		
		{id = "default_songlist2_lamp_noplay_r",	src = "src-default-songlist2-clearlamp", x = 168, y = 0, w = 84, h = 72, divx = 2},
		{id = "default_songlist2_lamp_failed_r",	src = "src-default-songlist2-clearlamp", x = 168, y = 72, w = 84, h = 72, divx = 2, cycle = 50},
		{id = "default_songlist2_lamp_assist_r",	src = "src-default-songlist2-clearlamp", x = 168, y = 144, w = 84, h = 72, divx = 2},
		{id = "default_songlist2_lamp_lassist_r",	src = "src-default-songlist2-clearlamp", x = 168, y = 216, w = 84, h = 72, divx = 2},
		{id = "default_songlist2_lamp_easy_r",		src = "src-default-songlist2-clearlamp", x = 168, y = 288, w = 84, h = 72, divx = 2},
		{id = "default_songlist2_lamp_normal_r",	src = "src-default-songlist2-clearlamp", x = 168, y = 360, w = 84, h = 72, divx = 2},
		{id = "default_songlist2_lamp_hard_r",		src = "src-default-songlist2-clearlamp", x = 168, y = 432, w = 84, h = 72, divx = 2},
		{id = "default_songlist2_lamp_exhard_r",	src = "src-default-songlist2-clearlamp", x = 168, y = 504, w = 84, h = 72, divx = 2, cycle = 100},
		{id = "default_songlist2_lamp_fc_r",		src = "src-default-songlist2-clearlamp", x = 168, y = 576, w = 84, h = 72, divx = 2, cycle = 100},
		{id = "default_songlist2_lamp_perfect_r",	src = "src-default-songlist2-clearlamp", x = 168, y = 648, w = 84, h = 72, divx = 2, cycle = 100},
		{id = "default_songlist2_lamp_max_r",		src = "src-default-songlist2-clearlamp", x = 168, y = 720, w = 84, h = 72, divx = 2, cycle = 100},
		
		{id = "default_songlist2_trophy_bronze",	src = "src-default-songlist2-songbar", x = 320, y = 486, w = 60, h = 44},
		{id = "default_songlist2_trophy_silver",	src = "src-default-songlist2-songbar", x = 380, y = 486, w = 60, h = 44},
		{id = "default_songlist2_trophy_gold",		src = "src-default-songlist2-songbar", x = 440, y = 486, w = 60, h = 44},
		
		{id = "default_songlist2_label_ln",			src = "src-default-songlist2-songbar", x = 500, y = 486, w = 40, h = 30},
		{id = "default_songlist2_label_cn",			src = "src-default-songlist2-songbar", x = 540, y = 486, w = 40, h = 30},
		{id = "default_songlist2_label_hcn",		src = "src-default-songlist2-songbar", x = 580, y = 486, w = 40, h = 30},
		{id = "default_songlist2_label_random",		src = "src-default-songlist2-songbar", x = 620, y = 486, w = 40, h = 30},
		{id = "default_songlist2_label_mine",		src = "src-default-songlist2-songbar", x = 660, y = 486, w = 30, h = 30},
		
		{id = "default_songlist2_bar_select",		src = "src-default-songlist2-songbar", x = 0, y = 432, w = 750, h = 54},
	}

	parts.imageset = {
		{id = "default_songlist2_bar", images = {
			"default_songlist2_bar_song","default_songlist2_bar_folder",
			"default_songlist2_bar_table","default_songlist2_bar_grade",
			"default_songlist2_bar_nograde","default_songlist2_bar_command",
			"default_songlist2_bar_search","default_songlist2_bar_nosong"
		}},
	}

	parts.value = {
		{id = "default_songlist2_playlevel_bar", src = "src-default-songlist2-songbar", x = 0, y = 486, w = 320, h = 38, divx = 10, digit = 2},
	}

	parts.text = {
		{id = "default_songlist2_bartext", font = "font-default-songlist2", size = 30, overflow = 1},
	}
	
	parts.graph = {
		{id = "graph-lamp", src = "src-default-songlist2-songbar", x = 690, y = 486, w = 11, h = 30, divx = 11, divy = 2, cycle = 100, type = -1},
	}
	
	local t_listoff = {}
	local t_liston = {}
	local t_lamp = {}
	local t_playerlamp = {}
	local t_rivallamp = {}
	
	do		
		local bar_num		= 20
		
		local list_x_off	= 1200
		local list_x_on		= list_x_off - 30
		local list_w		= 750
		local list_h		= 1080 / bar_num
		
		local lamp_w		= 42
		local lamp_h		= list_h + 18
		local lamp_x		= -9
		local lamp_y		= -9
		
		local bar_roop		 = 30
		
		do
			local list_y = 1161
			for i = 1, bar_num + 4, 1 do
				table.insert(t_listoff, {id = "default_songlist2_bar", loop = (bar_roop * i), dst = {{time = 0, x = 1920, y = list_y, w = list_w, h = list_h, acc = 2},{time = (bar_roop * i), x = list_x_off}}})
				table.insert(t_liston,  {id = "default_songlist2_bar", dst = {{x = list_x_on, y = list_y, w = list_w, h = list_h}}})
				list_y = list_y - list_h
			end
			
			local lamp_category = {
				"default_songlist2_lamp_noplay","default_songlist2_lamp_failed",
				"default_songlist2_lamp_assist","default_songlist2_lamp_lassist",
				"default_songlist2_lamp_easy","default_songlist2_lamp_normal",
				"default_songlist2_lamp_hard","default_songlist2_lamp_exhard",
				"default_songlist2_lamp_fc","default_songlist2_lamp_perfect",
				"default_songlist2_lamp_max"
			}
			for i, v in ipairs(lamp_category) do
				table.insert(t_lamp,		{id = v, blend = 2, dst = {{x = lamp_x, y = lamp_y, w = lamp_w, h = lamp_h}}})
				table.insert(t_playerlamp,	{id = v .. "_p", dst = {{x = lamp_x, y = lamp_y, w = lamp_w, h = lamp_h}}})
				table.insert(t_rivallamp,	{id = v .. "_r", dst = {{x = lamp_x, y = lamp_y, w = lamp_w, h = lamp_h}}})
			end
		end
	end

	parts.songlist = {
		id = "default_songlist2",
		center = 12,
		clickable = {2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23},
		listoff = t_listoff,
		liston  = t_liston,
		text = {
			{id = "default_songlist2_bartext", offset = ID_LIST_TITLE, filter = 1, dst = {{x = 128, y = 8, w = 540, h = 30}}},			-- 通常曲
			{id = "default_songlist2_bartext", offset = ID_LIST_TITLE, filter = 1, dst = {{x = 128, y = 8, w = 540, h = 30, b = 153}}},	-- 新規追加曲
		},
		level = {
			{id = "default_songlist2_playlevel_bar", dst = {{x = 28, y = 8, w = 32, h = 38}}},								-- 難易度未定義
			{id = "default_songlist2_playlevel_bar", dst = {{x = 28, y = 8, w = 32, h = 38, r = 51, b = 102}}},				-- BEGINNER
			{id = "default_songlist2_playlevel_bar", dst = {{x = 28, y = 8, w = 32, h = 38, r = 0, g = 153}}},				-- NORMAL
			{id = "default_songlist2_playlevel_bar", dst = {{x = 28, y = 8, w = 32, h = 38, g = 102, b = 51}}},				-- HYPER
			{id = "default_songlist2_playlevel_bar", dst = {{x = 28, y = 8, w = 32, h = 38, r = 204, g = 51, b = 0}}},		-- ANOTHER
			{id = "default_songlist2_playlevel_bar", dst = {{x = 28, y = 8, w = 32, h = 38, r = 204, g = 51, b = 204}}},		-- INSANE
			{id = "default_songlist2_playlevel_bar", dst = {{x = 28, y = 8, w = 32, h = 38, r = 128, g = 128, b = 128}}},	-- IR RANKING
		},
		lamp = t_lamp,
		playerlamp = t_playerlamp,
		rivallamp = t_rivallamp,
		trophy = {
			{id = "default_songlist2_trophy_bronze", blend = 2,	dst = {{x = 32, y = 5, w = 60, h = 44}}},
			{id = "default_songlist2_trophy_silver", blend = 2,	dst = {{x = 32, y = 5, w = 60, h = 44}}},
			{id = "default_songlist2_trophy_gold", blend = 2,	dst = {{x = 32, y = 5, w = 60, h = 44}}},
		},
		label = {
			{id = "default_songlist2_label_ln",		dst = {{x = -42, y = 12, w = 40, h = 30}}},
			{id = "default_songlist2_label_random",	dst = {{x = -84, y = 12, w = 40, h = 30}}},
			{id = "default_songlist2_label_mine",	dst = {{x = 670, y = 12, w = 30, h = 30}}},
			{id = "default_songlist2_label_cn",		dst = {{x = -42, y = 12, w = 40, h = 30}}},
			{id = "default_songlist2_label_hcn",	dst = {{x = -42, y = 12, w = 40, h = 30}}},
		},
		graph = {id = "graph-lamp", dst = {{x = 50, y = 2, w = 600, h = 6}}}
	}
	
	parts.destination = {
		{id = "default_songlist2"},
		{id = "default_songlist2_bar_select", loop = 0, blend = 2, dst = {{time = 0, x = 1170, y = 513, w = 750, h = 54, a =255},{time = 2000, a = 104}}},
	}
	return parts
end

return {
	parts = parts,
	load = load
}