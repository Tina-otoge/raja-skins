local parts = {}

local function load()

	local font1_id = "font-default-commonparts-m_select1"

	parts.source = {
		{id = "src-default_irdata_irdata_bg", path = "customize/advanced/default_irdata/irdata_bg.png"},
	}
	
	parts.image = {
		{id = "default_irdata_irdata_bg",	src = "src-default_irdata_irdata_bg",	x = 0, y = 0, w = -1, h = -1},
		{id = "default_irdata_per",			src = "src-default-commonparts-system", x = 190, y = 666, w = 20, h = 21}
	}
	
	parts.value = {
		{id = "default_irdata_clearrate_count",		src = "src-default-commonparts-system", x = 0, y = 817, w = 200, h = 21, divx = 10, digit = 3, ref = 227},
		{id = "default_irdata_ir_rank_count",		src = "src-default-commonparts-system", x = 0, y = 817, w = 220, h = 21, divx = 11, digit = 4, ref = 179},
		{id = "default_irdata_ir_rank_total_count",	src = "src-default-commonparts-system", x = 0, y = 817, w = 220, h = 21, divx = 11, digit = 4, ref = 180},
		
		{id = "default_irdata_topscore_count",	src = "src-default-commonparts-system", x = 0, y = 817, w = 220, h = 21, divx = 11, digit = 4, ref = 380},
		{id = "default_irdata_difftopscore_count",	src = "src-default-commonparts-system", x = 0, y = 817, w = 240, h = 42, divx = 12, divy = 2, digit = 6, value = function()
			local mybestscore = main_state.number(71)
			local rankingtopscore = main_state.number(380)
			if mybestscore >= 0 and rankingtopscore >= 0 then
				return mybestscore - rankingtopscore
			else
				return 0
			end
			return 
		end}
	}
	
	parts.text = {
		{id = "default_irdata_irdata",		font = font1_id, size = 21, align = 0, constantText = "ir data"},
		{id = "default_irdata_rank",		font = font1_id, size = 21, align = 0, constantText = "RANK"},
		{id = "default_irdata_slash",		font = font1_id, size = 21, align = 0, constantText = "/"},
		{id = "default_irdata_clearrate",	font = font1_id, size = 21, align = 0, constantText = "CLEAR RATE"},
		{id = "default_irdata_difftop",		font = font1_id, size = 21, align = 0, constantText = "DIFF TOP"}
	}
	
	local irdata_position = {
	x = 333,
	y = 349
	}
	
	parts.destination = {
		{id = "default_irdata_irdata_bg",				op = {51},		dst = {{x = irdata_position.x - 9, y = irdata_position.y - 4, w = 337, h = 120}}},
		{id = "default_irdata_irdata",					op = {51},		dst = {{x = irdata_position.x + 18, y = irdata_position.y + 83, w = 85, h = 26}}},
		{id = "default_irdata_rank",					op = {51, 2},	dst = {{x = irdata_position.x + 24, y = irdata_position.y + 56, w = 80, h = 21}}},
		{id = "default_irdata_ir_rank_count",			op = {51, 2},	dst = {{x = irdata_position.x + 124, y = irdata_position.y + 56, w = 20, h = 21}}},
		{id = "default_irdata_slash",					op = {51, 2},	dst = {{x = irdata_position.x + 204, y = irdata_position.y + 56, w = 20, h = 21}}},
		{id = "default_irdata_ir_rank_total_count",		op = {51, 2},	dst = {{x = irdata_position.x + 224, y = irdata_position.y + 56, w = 20, h = 21}}},
		{id = "default_irdata_rank",					op = {51, 3},	dst = {{x = irdata_position.x + 24, y = irdata_position.y + 56, w = 80, h = 21}}},
		{id = "default_irdata_ir_rank_count",			op = {51, 3},	dst = {{x = irdata_position.x + 124, y = irdata_position.y + 56, w = 20, h = 21}}},
		{id = "default_irdata_slash",					op = {51, 3},	dst = {{x = irdata_position.x + 204, y = irdata_position.y + 56, w = 20, h = 21}}},
		{id = "default_irdata_ir_rank_total_count",		op = {51, 3},	dst = {{x = irdata_position.x + 224, y = irdata_position.y + 56, w = 20, h = 21}}},
		
		{id = "default_irdata_clearrate",				op = {51, 2},	dst = {{x = irdata_position.x + 24, y = irdata_position.y + 32, w = 190, h = 21}}},
		{id = "default_irdata_clearrate_count",			op = {51, 2},	dst = {{x = irdata_position.x + 224, y = irdata_position.y + 32, w = 20, h = 21}}},
		{id = "default_irdata_per",						op = {51, 2},	dst = {{x = irdata_position.x + 284, y = irdata_position.y + 32, w = 20, h = 21}}},
		{id = "default_irdata_clearrate",				op = {51, 3},	dst = {{x = irdata_position.x + 24, y = irdata_position.y + 32, w = 190, h = 21}}},
		{id = "default_irdata_clearrate_count",			op = {51, 3},	dst = {{x = irdata_position.x + 224, y = irdata_position.y + 32, w = 20, h = 21}}},
		{id = "default_irdata_per",						op = {51, 3},	dst = {{x = irdata_position.x + 284, y = irdata_position.y + 32, w = 20, h = 21}}},
		
		{id = "default_irdata_difftop",					op = {51, 2},	dst = {{x = irdata_position.x + 24, y = irdata_position.y + 8, w = 20, h = 21}}},
		{id = "default_irdata_difftop",					op = {51, 3},	dst = {{x = irdata_position.x + 24, y = irdata_position.y + 8, w = 20, h = 21}}},
		--{id = "default_irdata_topscore_count",			op = {51, 2},	dst = {{x = irdata_position.x + 124, y = irdata_position.y + 8, w = 20, h = 21}}},
		{id = "default_irdata_difftopscore_count",		op = {51, 2},	dst = {{x = irdata_position.x + 184, y = irdata_position.y + 8, w = 20, h = 21}}},
		{id = "default_irdata_difftopscore_count",		op = {51, 3},	dst = {{x = irdata_position.x + 184, y = irdata_position.y + 8, w = 20, h = 21}}}
	}
	
	return parts
end

return {
	parts = parts,
	load = load
}