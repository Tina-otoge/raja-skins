local parts = {}	

local PROPERTY_NAME_MASCOT = "マスコットを表示する"
local OP_MASCOT_OFF =	get_property_op()
local OP_MASCOT_STOP =	get_property_op()
local OP_MASCOT_JUMP =	get_property_op()
local OP_MASCOT_FLOAT =	get_property_op()

parts.property = {
	{name = PROPERTY_NAME_MASCOT, item = {
		{name = "OFF",		op = OP_MASCOT_OFF},
		{name = "停止",		op = OP_MASCOT_STOP},
		{name = "ジャンプ",	op = OP_MASCOT_JUMP},
		{name = "浮遊",		op = OP_MASCOT_FLOAT},
	},def = "ジャンプ"},
}

parts.filepath = {
	{name = "マスコット", path = "customize/mascot/*"},
}
	
local function load()
		
	-- マスコットの表示
	local mascot_x = 16
	local mascot_y = 50
	local mascot_w = 256
	local mascot_h = 256

	parts.source = {
		{id = "src-default-mascot-mascot", path = "customize/mascot/*"},
	}
	
	parts.image = {
		{id = "default_mascot_mascot", src = "src-default-mascot-mascot", x = 0, y = 0, w = -1, h = -1},
	}
	
	parts.destination = {
		{id = "default_mascot_mascot", filter = 1, op = {OP_MASCOT_STOP}, dst = {
			{x = mascot_x, y = mascot_y, w = mascot_w, h = mascot_h}
		}},
			
		{id = "default_mascot_mascot", filter = 1, loop = 0, op = {OP_MASCOT_JUMP}, dst = {
			{time = 0, x = mascot_x, y = mascot_y, w = mascot_w, h = mascot_h, acc = 2},
			{time = 75, h = mascot_h - 6, acc = 1},
			{time = 300, y = mascot_y + 10,	h = mascot_h + 6, acc = 1},
			{time = 450, y = mascot_y, h = mascot_h},
			{time = 500, y = mascot_y, h = mascot_h - 6},
			{time = 600, y = mascot_y, h = mascot_h, acc = 2},
			{time = 5000},				
		}},
		
		{id = "default_mascot_mascot", filter = 1, loop = 0, op = {OP_MASCOT_FLOAT}, dst = {
			{time = 0, x = mascot_x, y = mascot_y, w = mascot_w, h = mascot_h, acc = 2},
			{time = 1000, y = mascot_y + 10},
			{time = 2000, y = mascot_y},
		}},		
	}
	
	return parts	
end

return {
	parts = parts,
	load = load
}