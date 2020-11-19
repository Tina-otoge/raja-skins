local parts = {}

local OP_GRAPH_OFF		= get_property_op()
local OP_GRAPH_ON		= get_property_op()
local OP_BMPFONT_N		= get_property_op()
local OP_BMPFONT_D		= get_property_op()

parts.property = {
	{name = "ノーツ・BPMグラフを使用する", item = {
		{name = "OFF",	op = OP_GRAPH_OFF},
		{name = "ON",	op = OP_GRAPH_ON}
	},def = "ON"},	
	{name = "楽曲情報表示に使用するフォント(info)", item = {
		{name = "ttf",	op = OP_BMPFONT_N},
		{name = "fnt(距離フィールド)",	op = OP_BMPFONT_D}
	},def = "fnt(距離フィールド)"},
}
parts.filepath = {
	{name = "楽曲情報表示に使用するフォント(タイトル ttf)",		path = "customize/advanced/default_info/ttf_title/*.ttf", def = "VL-Gothic-Regular.ttf"},
	{name = "楽曲情報表示に使用するフォント(タイトル fnt)",		path = "customize/advanced/default_info/fnt_title/*.fnt", def = "VLGothic_50_distance.fnt"},
	{name = "楽曲情報表示に使用するフォント(ジャンル等 ttf)",	path = "customize/advanced/default_info/ttf/*.ttf", def = "VL-Gothic-Regular.ttf"},
	{name = "楽曲情報表示に使用するフォント(ジャンル等 fnt)",	path = "customize/advanced/default_info/fnt/*.fnt", def = "VLGothic_21_distance.fnt"}
}

local function load()

	local font1_path = nil
	local font2_path = nil
	local font3_path = nil
	local font4_path = nil
	do
		local font1_get_path = skin_config.get_path("customize/advanced/default_info/ttf_title/*.ttf")
		local font2_get_path = skin_config.get_path("customize/advanced/default_info/fnt_title/*.fnt")
		local font3_get_path = skin_config.get_path("customize/advanced/default_info/ttf/*.ttf")
		local font4_get_path = skin_config.get_path("customize/advanced/default_info/fnt/*.fnt")
		
		local font1_sub = string.find(font1_get_path, "customize")
		local font2_sub = string.find(font2_get_path, "customize")
		local font3_sub = string.find(font3_get_path, "customize")		
		local font4_sub = string.find(font4_get_path, "customize")
		font1_path = string.sub(font1_get_path, font1_sub)
		font2_path = string.sub(font2_get_path, font2_sub)
		font3_path = string.sub(font3_get_path, font3_sub)
		font4_path = string.sub(font4_get_path, font4_sub)
	end
	
	if skin_config.option["楽曲情報表示に使用するフォント(info)"] == OP_BMPFONT_D then
		parts.font = {
			{id = "font-default-info-1", path = font2_path, type = 1},
			{id = "font-default-info-2", path = font4_path, type = 1},
		}
		
		parts.text = {
			{id = "default_info_genre",		font = "font-default-info-2", size = 24, align = 2, ref = 13, overflow = 1, outlineColor = "000000ff", outlineWidth = 0.4},
			{id = "default_info_title",		font = "font-default-info-1", size = 72, align = 2, ref = 10, overflow = 1, outlineColor = "000000ff", outlineWidth = 0.4, shadowColor = "00000033", shadowOffsetX = 3, shadowOffsetY = 3},
			{id = "default_info_subtitle",	font = "font-default-info-2", size = 24, align = 2, ref = 11, overflow = 1, outlineColor = "330033ff", outlineWidth = 0.4},
			{id = "default_info_artist",	font = "font-default-info-2", size = 24, align = 2, ref = 16, overflow = 1, outlineColor = "000000ff", outlineWidth = 0.4},
			{id = "default_info_course1",	font = "font-default-info-2", size = 30, align = 2, ref = 150, overflow = 1, outlineColor = "000000ff", outlineWidth = 0.4},
			{id = "default_info_course2",	font = "font-default-info-2", size = 30, align = 2, ref = 151, overflow = 1, outlineColor = "000000ff", outlineWidth = 0.4},
			{id = "default_info_course3",	font = "font-default-info-2", size = 30, align = 2, ref = 152, overflow = 1, outlineColor = "000000ff", outlineWidth = 0.4},
			{id = "default_info_course4",	font = "font-default-info-2", size = 30, align = 2, ref = 153, overflow = 1, outlineColor = "000000ff", outlineWidth = 0.4},
			{id = "default_info_directory", font = "font-default-info-2", size = 24, align = 2, ref = 1000, overflow = 1, outlineColor = "333300ff", outlineWidth = 0.4},
		}
	else
		parts.font = {
			{id = "font-default-info-1", path = font1_path},
			{id = "font-default-info-2", path = font3_path},
		}
		
		parts.text = {
			{id = "default_info_genre",		font = "font-default-info-2", size = 24, align = 2, ref = 13, overflow = 1},
			{id = "default_info_title",		font = "font-default-info-1", size = 72, align = 2, ref = 10, overflow = 1},
			{id = "default_info_subtitle",	font = "font-default-info-2", size = 24, align = 2, ref = 11, overflow = 1},
			{id = "default_info_artist",	font = "font-default-info-2", size = 24, align = 2, ref = 16, overflow = 1},
			{id = "default_info_course1",	font = "font-default-info-2", size = 30, align = 2, ref = 150, overflow = 1},
			{id = "default_info_course2",	font = "font-default-info-2", size = 30, align = 2, ref = 151, overflow = 1},
			{id = "default_info_course3",	font = "font-default-info-2", size = 30, align = 2, ref = 152, overflow = 1},
			{id = "default_info_course4",	font = "font-default-info-2", size = 30, align = 2, ref = 153, overflow = 1},
			{id = "default_info_directory",	font = "font-default-info-2", size = 24, align = 2, ref = 1000, overflow = 1},
		}
	end

	parts.image = {
		{id = "default_info_songs",				src = "src-default-commonparts-system", x = 904, y = 832, w = 120, h = 24},
		{id = "default_info_total",				src = "src-default-commonparts-system", x = 904, y = 880, w = 120, h = 24},
		{id = "default_info_time_song",			src = "src-default-commonparts-system", x = 942, y = 856, w = 82, h = 24},
		{id = "default_info_time_song_dot",		src = "src-default-commonparts-system", x = 396, y = 880, w = 36, h = 36},
		{id = "default_info_judge_veryeasy",	src = "src-default-commonparts-system", x = 820, y = 904, w = 204, h = 24},
		{id = "default_info_judge_easy",		src = "src-default-commonparts-system", x = 820, y = 928, w = 204, h = 24},
		{id = "default_info_judge_normal",		src = "src-default-commonparts-system", x = 820, y = 952, w = 204, h = 24},
		{id = "default_info_judge_hard",		src = "src-default-commonparts-system", x = 820, y = 976, w = 204, h = 24},
		{id = "default_info_judge_veryhard",	src = "src-default-commonparts-system", x = 820, y = 1000, w = 204, h = 24},
		{id = "default_info_s_5keys",			src = "src-default-commonparts-system", x = 460, y = 72, w = 180, h = 36},
		{id = "default_info_s_7keys",			src = "src-default-commonparts-system", x = 460, y = 108, w = 180, h = 36},
		{id = "default_info_s_9keys",			src = "src-default-commonparts-system", x = 460, y = 144, w = 180, h = 36},
		{id = "default_info_s_10keys",			src = "src-default-commonparts-system", x = 460, y = 180, w = 180, h = 36},
		{id = "default_info_s_14keys",			src = "src-default-commonparts-system", x = 460, y = 216, w = 180, h = 36},
		{id = "default_info_s_24keys",			src = "src-default-commonparts-system", x = 460, y = 252, w = 180, h = 36},
		{id = "default_info_s_24keysDP",		src = "src-default-commonparts-system", x = 460, y = 288, w = 180, h = 36},
		{id = "default_info_bpm",				src = "src-default-commonparts-system", x = 460, y = 0, w = 108, h = 36},
		{id = "default_info_-",					src = "src-default-commonparts-system", x = 568, y = 0, w = 36, h = 36},
		{id = "default_info_const_random",		src = "src-default-commonparts-system", x = 0, y = 483, w = 260, h = 21},
		{id = "default_info_const_mirror",		src = "src-default-commonparts-system", x = 0, y = 504, w = 260, h = 21},
		{id = "default_info_const_nospeed",		src = "src-default-commonparts-system", x = 0, y = 525, w = 260, h = 21},
		{id = "default_info_const_nogood",		src = "src-default-commonparts-system", x = 0, y = 546, w = 260, h = 21},
		{id = "default_info_const_nogreat",		src = "src-default-commonparts-system", x = 0, y = 567, w = 260, h = 21},
		{id = "default_info_mainbpm",			src = "src-default-commonparts-system", x = 0, y = 399, w = 60, h = 21},
		{id = "default_info_notes",				src = "src-default-commonparts-system", x = 0, y = 84, w = 100, h = 21},	
	}

	parts.value = {
		{id = "default_info_songs_count",		src = "src-default-commonparts-system", x = 0, y = 880, w = 360, h = 36, divx = 10, digit = 6, ref = 300},
		{id = "default_info_minbpm",			src = "src-default-commonparts-system", x = 0, y = 916, w = 360, h = 36, divx = 10, digit = 4, align = 2, ref = 91},
		{id = "default_info_maxbpm",			src = "src-default-commonparts-system", x = 0, y = 916, w = 360, h = 36, divx = 10, digit = 4, align = 2, ref = 90},
		{id = "default_info_songtotal_count",	src = "src-default-commonparts-system", x = 0, y = 880, w = 360, h = 36, divx = 10, digit = 4, ref = 368},
		{id = "default_info_songtime_mm_count",	src = "src-default-commonparts-system", x = 0, y = 880, w = 360, h = 36, divx = 10, digit = 2, ref = 1163},
		{id = "default_info_songtime_ss_count",	src = "src-default-commonparts-system", x = 0, y = 880, w = 396, h = 36, divx = 11, digit = 2, ref = 1164},
		{id = "default_info_mainbpm-num",		src = "src-default-commonparts-system", x = 0, y = 796, w = 200, h = 21, divx = 10, divy = 1, digit = 7, ref = 92},
		{id = "default_info_notes_count",		src = "src-default-commonparts-system", x = 0, y = 817, w = 200, h = 21, divx = 10, digit = 5, ref = 74},
	}
		
	parts.destination = {}
	
	if skin_config.option["ノーツ・BPMグラフを使用する"] == OP_GRAPH_ON then
		parts.judgegraph = {{id = "default_info_notes_graph", type = 0}}
		parts.bpmgraph = {{id = "default_info_bpmgraph"}}
		local dst_graph = {
			{id = -110,							op = {2},	dst = {{x = 378, y = 467, w = 702, h = 100, a = 153}}},
			{id = "default_info_notes_graph",	op = {2},	dst = {{x = 480, y = 467, w = 600, h = 100, a = 153}}},
			{id = "default_info_bpmgraph",		op = {2},	dst = {{x = 480, y = 467, w = 600, h = 100}}},
			{id = "default_info_mainbpm",		op = {2},	dst = {{x = 420, y = 542, w = 60, h = 21}}},
			{id = "default_info_mainbpm-num",	op = {2},	dst = {{x = 340, y = 521, w = 20, h = 21}}},
			{id = "default_info_notes",			op = {2},	dst = {{x = 380, y = 492, w = 100, h = 21}}},
			{id = "default_info_notes_count",	op = {2},	dst = {{x = 380, y = 471, w = 20, h = 21}}},
		}
		append_all(parts.destination, dst_graph)
	end
	
	local dst_info = {
	
		{id = -110, op = {OP_BMPFONT_N}, dst = {{x = 0, y = 633, w = 1920, h = 200, a = 102}}},

		-- フォルダ選択時
		{id = "default_info_songs",			op = {1}, dst = {{x = 826, y = 573, w = 120, h = 24}}},
		{id = "default_info_songs_count",	op = {1}, dst = {{x = 936, y = 573, w = 24, h = 24}}},
		
		-- 曲選択時
		{id = -102, stretch = 1, filter = 1, timer = 11, loop = 250,	dst = {{time = 0, x = 780, y = 747, w = 300, h = 80, acc = 2, a = 0},{time = 250, a = 255}}},
		
		{id = "default_info_genre",		filter = 1, timer = 11, loop = 300, op = {192},	dst = {{time = 0, x = 1040, y = 747, w = 724, h = 24, acc = 2, a = 0},{time = 300, x = 1080, a = 255}}},
		{id = "default_info_genre",		filter = 1, timer = 11, loop = 300, op = {193},	dst = {{time = 0, x = 720, y = 747, w = 404, h = 24, acc = 2, a = 0},{time = 300, x = 760, a = 255}}},
		{id = "default_info_title",		filter = 1, timer = 11, loop = 300,				dst = {{time = 0, x = 1120, y = 663, w = 724, h = 72, acc = 2, a = 0},{time = 300, x = 1080, a = 255}}},
		{id = "default_info_subtitle",	filter = 1, timer = 11, loop = 300,				dst = {{time = 0, x = 1120, y = 663, w = 724, h = 24, g = 153, a = 153, acc = 2, a = 0},{time = 300, x = 1080, a = 255}}},
		{id = "default_info_artist",	filter = 1, timer = 11, loop = 300,				dst = {{time = 0, x = 1080, y = 663, w = 724, h = 24, acc = 2, a = 0},{time = 300, y = 633, a = 255}}},
		
		{id = "default_info_bpm",	op = {2},	dst = {{x = 1008, y = 603, w = 72, h = 24}}},
		{id = "default_info_-",		op = {2},	dst = {{x = 876, y = 603, w = 24, h = 24}}},
		{id = "default_info_minbpm",			dst = {{x = 780, y = 603, w = 24, h = 24}}},
		{id = "default_info_maxbpm",			dst = {{x = 900, y = 603, w = 24, h = 24}}},

		{id = "default_info_total",				op = {2}, dst = {{x = 378, y = 603, w = 120, h = 24}}},
		{id = "default_info_songtotal_count",	op = {2}, dst = {{x = 510, y = 603, w = 24, h = 24}}},
		{id = "default_info_time_song",			op = {2}, dst = {{x = 416, y = 573, w = 82, h = 24}}},
		{id = "default_info_songtime_mm_count",	op = {2}, dst = {{x = 510, y = 573, w = 24, h = 24}}},
		{id = "default_info_time_song_dot",		op = {2}, dst = {{x = 558, y = 573, w = 24, h = 24}}},			
		{id = "default_info_songtime_ss_count",	op = {2}, dst = {{x = 582, y = 573, w = 24, h = 24}}},
		
		{id = "default_info_judge_veryeasy",	op = {184},	dst = {{x = 744, y = 573, w = 204, h = 24}}},
		{id = "default_info_judge_easy",		op = {183},	dst = {{x = 744, y = 573, w = 204, h = 24}}},
		{id = "default_info_judge_normal",		op = {182},	dst = {{x = 744, y = 573, w = 204, h = 24}}},
		{id = "default_info_judge_hard",		op = {181},	dst = {{x = 744, y = 573, w = 204, h = 24}}},
		{id = "default_info_judge_veryhard",	op = {180},	dst = {{x = 744, y = 573, w = 204, h = 24}}},
		
		{id = "default_info_s_7keys",		op = {160},		dst = {{x = 960, y = 573, w = 120, h = 24}}},
		{id = "default_info_s_14keys",		op = {162},		dst = {{x = 960, y = 573, w = 120, h = 24}}},
		{id = "default_info_s_9keys",		op = {164},		dst = {{x = 960, y = 573, w = 120, h = 24}}},
		{id = "default_info_s_5keys",		op = {161},		dst = {{x = 960, y = 573, w = 120, h = 24}}},
		{id = "default_info_s_10keys",		op = {163},		dst = {{x = 960, y = 573, w = 120, h = 24}}},
		{id = "default_info_s_24keys",		op = {1160},	dst = {{x = 960, y = 573, w = 120, h = 24}}},
		{id = "default_info_s_24keysDP",	op = {1161},	dst = {{x = 960, y = 573, w = 120, h = 24}}},
		
		{id = -110, op = {-2}, dst = {{x = 378, y = 467, w = 702, h = 100, a = 153}}},
					
		-- コース選択時
		{id = "default_info_course1", filter = 1, timer = 11, loop = 300, dst = {{time = 0, x = 1120, y = 723, w = 980, h = 30, acc = 2, a = 0},{time = 300, x = 1080, a = 255}}},
		{id = "default_info_course2", filter = 1, timer = 11, loop = 300, dst = {{time = 0, x = 1120, y = 683, w = 980, h = 30, acc = 2, a = 0},{time = 300, x = 1080, a = 255}}},
		{id = "default_info_course3", filter = 1, timer = 11, loop = 300, dst = {{time = 0, x = 1120, y = 643, w = 980, h = 30, acc = 2, a = 0},{time = 300, x = 1080, a = 255}}},
		{id = "default_info_course4", filter = 1, timer = 11, loop = 300, dst = {{time = 0, x = 1120, y = 603, w = 980, h = 30, acc = 2, a = 0},{time = 300, x = 1080, a = 255}}},

		{id = "default_info_const_random",	op = {1004}, dst = {{x = 510, y = 573, w = 260, h = 21, b = 0}}},
		{id = "default_info_const_mirror",	op = {1003}, dst = {{x = 510, y = 573, w = 260, h = 21, b = 0}}},
		{id = "default_info_const_nospeed",	op = {1005}, dst = {{x = 690, y = 573, w = 260, h = 21, b = 0}}},
		{id = "default_info_const_nogood",	op = {1006}, dst = {{x = 930, y = 573, w = 260, h = 21, b = 0}}},
		{id = "default_info_const_nogreat",	op = {1007}, dst = {{x = 930, y = 573, w = 260, h = 21, b = 0}}},
		
		{id = "default_info_directory",	filter = 1, timer = 11, loop = 300, op = {192},	dst = {{time = 0, x = 1080, y = 812, w = 724, h = 24, b = 153, a = 153, acc = 2, a = 0},{time = 300, y = 782, a = 255}}},
		{id = "default_info_directory",	filter = 1, timer = 11, loop = 300, op = {193},	dst = {{time = 0, x = 1080, y = 865, w = 724, h = 24, b = 153, a = 153, acc = 2, a = 0},{time = 300, y = 835, a = 255}}},
	}
	append_all(parts.destination, dst_info)
	
	return parts	
end

return {
	parts = parts,
	load = load
}