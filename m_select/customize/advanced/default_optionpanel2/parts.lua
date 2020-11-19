local parts = {}

local function load()
	parts.source = {
		{id = "src-default-optionpanel-panel1", path = "customize/advanced/default_optionpanel2/panel1.png"},
		{id = "src-default-optionpanel-panel2", path = "customize/advanced/default_optionpanel2/panel2.png"},
		{id = "src-default-optionpanel-panel3", path = "customize/advanced/default_optionpanel2/panel3.png"},
		{id = "src-default-optionpanel-cursor", path = "customize/advanced/default_optionpanel2/cursor.png"},
	}

	parts.image = {
		{id = "default_optionpanel_option_panel1",				src = "src-default-optionpanel-panel1", x = 0, y = 0, w = 1024, h = 1024},
		
		-- 追加 ターゲット 11
		{id = "default_optionpanel_option_selector11_1",		src = "src-default-optionpanel-cursor", x = 616, y = 500, w = 170, h = 550},
		{id = "default_optionpanel_option_selector11_2",		src = "src-default-optionpanel-cursor", x = 616, y = 450, w = 170, h = 550},
		{id = "default_optionpanel_option_selector11_3",		src = "src-default-optionpanel-cursor", x = 616, y = 400, w = 170, h = 550},
		{id = "default_optionpanel_option_selector11_4",		src = "src-default-optionpanel-cursor", x = 616, y = 350, w = 170, h = 550},
		{id = "default_optionpanel_option_selector11_5",		src = "src-default-optionpanel-cursor", x = 616, y = 300, w = 170, h = 550},
		{id = "default_optionpanel_option_selector11_6",		src = "src-default-optionpanel-cursor", x = 616, y = 250, w = 170, h = 550},
		{id = "default_optionpanel_option_selector11_7",		src = "src-default-optionpanel-cursor", x = 616, y = 200, w = 170, h = 550},
		{id = "default_optionpanel_option_selector11_8",		src = "src-default-optionpanel-cursor", x = 616, y = 150, w = 170, h = 550},
		{id = "default_optionpanel_option_selector11_9",		src = "src-default-optionpanel-cursor", x = 616, y = 100, w = 170, h = 550},
		{id = "default_optionpanel_option_selector11_10",		src = "src-default-optionpanel-cursor", x = 616, y = 50, w = 170, h = 550},
		{id = "default_optionpanel_option_selector11_11",		src = "src-default-optionpanel-cursor", x = 616, y = 0, w = 170, h = 550},
		
		-- random
		{id = "default_optionpanel_option_selector12_1",		src = "src-default-optionpanel-cursor", x = 616, y = 500, w = 170, h = 500},
		{id = "default_optionpanel_option_selector12_2",		src = "src-default-optionpanel-cursor", x = 616, y = 450, w = 170, h = 500},
		{id = "default_optionpanel_option_selector12_3",		src = "src-default-optionpanel-cursor", x = 616, y = 400, w = 170, h = 500},
		{id = "default_optionpanel_option_selector12_4",		src = "src-default-optionpanel-cursor", x = 616, y = 350, w = 170, h = 500},
		{id = "default_optionpanel_option_selector12_5",		src = "src-default-optionpanel-cursor", x = 616, y = 300, w = 170, h = 500},
		{id = "default_optionpanel_option_selector12_6",		src = "src-default-optionpanel-cursor", x = 616, y = 250, w = 170, h = 500},
		{id = "default_optionpanel_option_selector12_7",		src = "src-default-optionpanel-cursor", x = 616, y = 200, w = 170, h = 500},
		{id = "default_optionpanel_option_selector12_8",		src = "src-default-optionpanel-cursor", x = 616, y = 150, w = 170, h = 500},
		{id = "default_optionpanel_option_selector12_9",		src = "src-default-optionpanel-cursor", x = 616, y = 100, w = 170, h = 500},
		{id = "default_optionpanel_option_selector12_10",		src = "src-default-optionpanel-cursor", x = 616, y = 50, w = 170, h = 500},
		
		-- gauge
		{id = "default_optionpanel_option_selector13_1",		src = "src-default-optionpanel-cursor", x = 616, y = 500, w = 170, h = 300},
		{id = "default_optionpanel_option_selector13_2",		src = "src-default-optionpanel-cursor", x = 616, y = 450, w = 170, h = 300},
		{id = "default_optionpanel_option_selector13_3",		src = "src-default-optionpanel-cursor", x = 616, y = 400, w = 170, h = 300},
		{id = "default_optionpanel_option_selector13_4",		src = "src-default-optionpanel-cursor", x = 616, y = 350, w = 170, h = 300},
		{id = "default_optionpanel_option_selector13_5",		src = "src-default-optionpanel-cursor", x = 616, y = 300, w = 170, h = 300},
		{id = "default_optionpanel_option_selector13_6",		src = "src-default-optionpanel-cursor", x = 616, y = 250, w = 170, h = 300},

		-- speed
		{id = "default_optionpanel_option_selector14_1",		src = "src-default-optionpanel-cursor", x = 616, y = 500, w = 170, h = 250},
		{id = "default_optionpanel_option_selector14_2",		src = "src-default-optionpanel-cursor", x = 616, y = 450, w = 170, h = 250},
		{id = "default_optionpanel_option_selector14_3",		src = "src-default-optionpanel-cursor", x = 616, y = 400, w = 170, h = 250},
		{id = "default_optionpanel_option_selector14_4",		src = "src-default-optionpanel-cursor", x = 616, y = 350, w = 170, h = 250},
		{id = "default_optionpanel_option_selector14_5",		src = "src-default-optionpanel-cursor", x = 616, y = 300, w = 170, h = 250},

		-- dp
		{id = "default_optionpanel_option_selector15_1",		src = "src-default-optionpanel-cursor", x = 616, y = 500, w = 170, h = 200},
		{id = "default_optionpanel_option_selector15_2",		src = "src-default-optionpanel-cursor", x = 616, y = 450, w = 170, h = 200},
		{id = "default_optionpanel_option_selector15_3",		src = "src-default-optionpanel-cursor", x = 616, y = 400, w = 170, h = 200},
		{id = "default_optionpanel_option_selector15_4",		src = "src-default-optionpanel-cursor", x = 616, y = 350, w = 170, h = 200},
		
		{id = "default_optionpanel_option_panel2",				src = "src-default-optionpanel-panel2", x = 0, y = 0, w = 1024, h = 1024},
		
		-- panel2
		{id = "default_optionpanel_option_selector21_1",		src = "src-default-optionpanel-cursor", x = 0, y = 750, w = 210, h = 50},
		{id = "default_optionpanel_option_selector21_2",		src = "src-default-optionpanel-cursor", x = 0, y = 800, w = 210, h = 50},			

		{id = "default_optionpanel_option_panel3",				src = "src-default-optionpanel-panel3", x = 0, y = 0, w = 1024, h = 1024},
		
		-- 追加 ゲージオートシフト
		{id = "default_optionpanel_option_selector31_1",		src = "src-default-optionpanel-cursor", x = 0, y = 500, w = 406, h = 250},
		{id = "default_optionpanel_option_selector31_2",		src = "src-default-optionpanel-cursor", x = 0, y = 450, w = 406, h = 250},
		{id = "default_optionpanel_option_selector31_3",		src = "src-default-optionpanel-cursor", x = 0, y = 400, w = 406, h = 250},
		{id = "default_optionpanel_option_selector31_4",		src = "src-default-optionpanel-cursor", x = 0, y = 350, w = 406, h = 250},
		{id = "default_optionpanel_option_selector31_5",		src = "src-default-optionpanel-cursor", x = 0, y = 300, w = 406, h = 250},
		
		-- bga
		{id = "default_optionpanel_option_selector32_1",		src = "src-default-optionpanel-cursor", x = 406, y = 500, w = 210, h = 150},
		{id = "default_optionpanel_option_selector32_2",		src = "src-default-optionpanel-cursor", x = 406, y = 450, w = 210, h = 150},
		{id = "default_optionpanel_option_selector32_3",		src = "src-default-optionpanel-cursor", x = 406, y = 400, w = 210, h = 150},	
	}

	parts.imageset = {
		{id = "default_optionpanel_option_target", ref = 77, images = {
			"default_optionpanel_option_selector11_1","default_optionpanel_option_selector11_2",
			"default_optionpanel_option_selector11_3","default_optionpanel_option_selector11_4",
			"default_optionpanel_option_selector11_5","default_optionpanel_option_selector11_6",
			"default_optionpanel_option_selector11_7","default_optionpanel_option_selector11_8",
			"default_optionpanel_option_selector11_9","default_optionpanel_option_selector11_10",
			"default_optionpanel_option_selector11_11"
		}},
		{id = "default_optionpanel_option_random", ref = 42, images = {
			"default_optionpanel_option_selector12_1","default_optionpanel_option_selector12_2",
			"default_optionpanel_option_selector12_3","default_optionpanel_option_selector12_4",
			"default_optionpanel_option_selector12_5","default_optionpanel_option_selector12_6",
			"default_optionpanel_option_selector12_7","default_optionpanel_option_selector12_8",
			"default_optionpanel_option_selector12_9","default_optionpanel_option_selector12_10"
		}},
		{id = "default_optionpanel_option_gauge", ref = 40, images = {
			"default_optionpanel_option_selector13_1","default_optionpanel_option_selector13_2",
			"default_optionpanel_option_selector13_3","default_optionpanel_option_selector13_4",
			"default_optionpanel_option_selector13_5","default_optionpanel_option_selector13_6"
		}},
		{id = "default_optionpanel_option_hsfix", ref = 55, images = {
			"default_optionpanel_option_selector14_1","default_optionpanel_option_selector14_2",
			"default_optionpanel_option_selector14_3","default_optionpanel_option_selector14_4",
			"default_optionpanel_option_selector14_5"
		}},
		{id = "default_optionpanel_option_random2", ref = 43, images = {
			"default_optionpanel_option_selector12_1","default_optionpanel_option_selector12_2",
			"default_optionpanel_option_selector12_3","default_optionpanel_option_selector12_4",
			"default_optionpanel_option_selector12_5","default_optionpanel_option_selector12_6",
			"default_optionpanel_option_selector12_7","default_optionpanel_option_selector12_8",
			"default_optionpanel_option_selector12_9","default_optionpanel_option_selector12_10"
		}},
		{id = "default_optionpanel_option_dp", ref = 54, images = {
			"default_optionpanel_option_selector15_1","default_optionpanel_option_selector15_2",
			"default_optionpanel_option_selector15_3","default_optionpanel_option_selector15_4"
		}},
		
		{id = "default_optionpanel_option_exjudge", ref = 301, images = {
			"default_optionpanel_option_selector21_1","default_optionpanel_option_selector21_2"
		}},
		{id = "default_optionpanel_option_constant", ref = 302, images = {
			"default_optionpanel_option_selector21_1","default_optionpanel_option_selector21_2"
		}},
		{id = "default_optionpanel_option_judgearea", ref = 303, images = {
			"default_optionpanel_option_selector21_1","default_optionpanel_option_selector21_2"
		}},
		{id = "default_optionpanel_option_legacy", ref = 304, images = {
			"default_optionpanel_option_selector21_1","default_optionpanel_option_selector21_2"
		}},
		{id = "default_optionpanel_option_marknote", ref = 305, images = {
			"default_optionpanel_option_selector21_1","default_optionpanel_option_selector21_2"
		}},
		{id = "default_optionpanel_option_bpmguide", ref = 306, images = {
			"default_optionpanel_option_selector21_1","default_optionpanel_option_selector21_2"
		}},
		{id = "default_optionpanel_option_nomine", ref = 307, images = {
			"default_optionpanel_option_selector21_1","default_optionpanel_option_selector21_2"
		}},
		
		{id = "default_optionpanel_option_gas", ref = 78, images = {
			"default_optionpanel_option_selector31_1","default_optionpanel_option_selector31_2",
			"default_optionpanel_option_selector31_3","default_optionpanel_option_selector31_4",
			"default_optionpanel_option_selector31_5"
		}},
		{id = "default_optionpanel_option_bga", ref = 72, images = {
			"default_optionpanel_option_selector32_1","default_optionpanel_option_selector32_2",
			"default_optionpanel_option_selector32_3"
		}},
	}

	parts.value = {
		{id = "default_optionpanel_duration",		src = "src-default-commonparts-system", x = 0, y = 817, w = 200, h = 21, divx = 10, digit = 4, ref = 312},
		{id = "default_optionpanel_duration_green",	src = "src-default-commonparts-system", x = 0, y = 796, w = 200, h = 21, divx = 10, digit = 4, ref = 313},
		{id = "default_optionpanel_judgetiming",	src = "src-default-commonparts-system", x = 240, y = 817, w = 240, h = 42, divx = 12, divy = 2, digit = 3, ref = 12},
	}
	
	parts.destination = {
		{id = -110, loop = 300, op = {21}, timer = 21,	dst = {{time = 0, x = 0, y = 0, w = 1920, h = 1080, a = 0},{time = 300, a = 168}}},
		{id = -110, loop = 300, op = {-21}, timer = 31,	dst = {{time = 0, x = 0, y = 0, w = 1920, h = 1080, a = 168},{time = 300, a = 0}}},
		{id = "default_optionpanel_option_panel1",	loop = 300, op = {21}, timer = 21,	dst = {{time = 0, x = -1024, y = 28, w = 1024, h = 1024, acc = 2},{time = 300, x = 0}}},
		{id = "default_optionpanel_option_panel1",	loop = 300, op = {-21}, timer = 31,	dst = {{time = 0, x = 0, y = 28, w = 1024, h = 1024, acc = 2},{time = 300, x = -1024}}},
		{id = "default_optionpanel_option_target",	blend = 2,loop = 300,	op = {21}, timer = 21,	dst = {{time = 300, x = 27, y = 40, w = 170, h = 550}}},
		{id = "default_optionpanel_option_random",	blend = 2,loop = 300,	op = {21}, timer = 21,	dst = {{time = 300, x = 227, y = 90, w = 170, h = 500}}},
		{id = "default_optionpanel_option_gauge",	blend = 2,loop = 300,	op = {21}, timer = 21,	dst = {{time = 300, x = 427, y = 290, w = 170, h = 300}}},
		{id = "default_optionpanel_option_hsfix",	blend = 2,loop = 300,	op = {21}, timer = 21,	dst = {{time = 300, x = 627, y = 340, w = 170, h = 250}}},
		{id = "default_optionpanel_option_random2",	blend = 2,loop = 300,	op = {21}, timer = 21,	dst = {{time = 300, x = 827, y = 90, w = 170, h = 500}}},
		{id = "default_optionpanel_option_dp",		blend = 2,loop = 300,	op = {21}, timer = 21,	dst = {{time = 300, x = 527, y = 40, w = 170, h = 200}}},			

		{id = -110, loop = 300, op = {22}, timer = 22,	dst = {{time = 0, x = 0, y = 0, w = 1920, h = 1080, a = 0},{time = 300, a = 168},}},
		{id = -110, loop = 300, op = {-22}, timer = 32,	dst = {{time = 0, x = 0, y = 0, w = 1920, h = 1080, a = 168},{time = 300, a = 0}}},
		{id = "default_optionpanel_option_panel2",		loop = 300,	op = {22}, timer = 22, dst = {{time = 0, x = -1024, y = 28, w = 1024, h = 1024, acc = 2},{time = 300, x = 0}}},
		{id = "default_optionpanel_option_panel2",		loop = 300,	op = {-22}, timer = 32, dst = {{time = 0, x = 0, y = 28, w = 1024, h = 1024, acc = 2},{time = 300, x = -1024}}},
		{id = "default_optionpanel_option_exjudge",		blend = 2,	loop = 300,	op = {22}, timer = 22, dst = {{time = 300, x = 207, y = 277, w = 210, h = 50}}},
		{id = "default_optionpanel_option_constant",	blend = 2,	loop = 300,	op = {22}, timer = 22, dst = {{time = 300, x = 311, y = 758, w = 210, h = 50}}},
		{id = "default_optionpanel_option_judgearea",	blend = 2,	loop = 300,	op = {22}, timer = 22, dst = {{time = 300, x = 407, y = 277, w = 210, h = 50}}},
		{id = "default_optionpanel_option_legacy",		blend = 2,	loop = 300,	op = {22}, timer = 22, dst = {{time = 300, x = 507, y = 758, w = 210, h = 50}}},
		{id = "default_optionpanel_option_marknote",	blend = 2,	loop = 300,	op = {22}, timer = 22, dst = {{time = 300, x = 607, y = 277, w = 210, h = 50}}},
		{id = "default_optionpanel_option_bpmguide",	blend = 2,	loop = 300,	op = {22}, timer = 22, dst = {{time = 300, x = 703, y = 758, w = 210, h = 50}}},
		{id = "default_optionpanel_option_nomine",		blend = 2,	loop = 300,	op = {22}, timer = 22, dst = {{time = 300, x = 807, y = 277, w = 210, h = 50}}},

		{id = -110, loop = 300, op = {23}, timer = 23,	dst = {{time = 0, x = 0, y = 0, w = 1920, h = 1080, a = 0},{time = 300, a = 168},}},
		{id = -110, loop = 300, op = {-23}, timer = 33,	dst = {{time = 0, x = 0, y = 0, w = 1920, h = 1080, a = 168},{time = 300, a = 0}}},
		{id = "default_optionpanel_option_panel3",	loop = 300, op = {23}, timer = 23,	dst = {{time = 0, x = -1024, y = 56, w = 1024, h = 1024, acc = 2},{time = 300, x = 0}}},
		{id = "default_optionpanel_option_panel3",	loop = 300, op = {-23}, timer = 33,	dst = {{time = 0, x = 0, y = 56, w = 1024, h = 1024, acc = 2},{time = 300, x = -1024}}},
		{id = "default_optionpanel_option_gas",		blend = 2,	loop = 300,	op = {23}, timer = 23,	dst = {{time = 300, x = 121, y = 764, w = 406, h = 250}}},
		{id = "default_optionpanel_option_bga",		blend = 2,	loop = 300,	op = {23}, timer = 23,	dst = {{time = 300, x = 320, y = 128, w = 210, h = 150}}},
		{id = "default_optionpanel_duration",		loop = 300,	op = {23}, timer = 23,	dst = {{time = 300, x = 590, y = 779, w = 20, h = 21, a = 0},{time = 300, a = 255}}},
		{id = "default_optionpanel_duration_green",	loop = 300,	op = {23}, timer = 23,	dst = {{time = 300, x = 690, y = 779, w = 20, h = 21, a = 0},{time = 300, a = 255}}},
		{id = "default_optionpanel_judgetiming",	loop = 300,	op = {23}, timer = 23,	dst = {{time = 300, x = 650, y = 242, w = 20, h = 21, a = 0},{time = 300, a = 255}}},
	}
	
	return parts	
end

return {
	parts = parts,
	load = load
}