local parts = {}

local OP_BGANIME_OFF	= get_property_op()
local OP_BGANIME_ON		= get_property_op()

parts.property = {
	{name = "背景のアニメーションを表示する", item = {
		{name = "OFF",	op = OP_BGANIME_OFF},
		{name = "ON",	op = OP_BGANIME_ON}
	},def = "ON"},	
}

local function load()
	if skin_config.option["背景のアニメーションを表示する"] == OP_BGANIME_ON then
		parts.source = {
			{id = "src-default-bganimation-custombg1", path = "customize/advanced/default_bganimation/custombg1.png"},
			{id = "src-default-bganimation-custombg2", path = "customize/advanced/default_bganimation/custombg2.png"},
			{id = "src-default-bganimation-custombg3", path = "customize/advanced/default_bganimation/custombg3.png"}
		}

		parts.image = {
			{id = "default_bganimation_custombg1", src = "src-default-bganimation-custombg1", x = 0, y = 0, w = -1, h = -1},
			{id = "default_bganimation_custombg2", src = "src-default-bganimation-custombg2", x = 0, y = 0, w = -1, h = -1},
			{id = "default_bganimation_custombg3", src = "src-default-bganimation-custombg3", x = 0, y = 0, w = -1, h = -1}
		}
		
		parts.destination = {
			{id = "default_bganimation_custombg1",						dst = {{x = 412, y = 412, w = 256, h = 256}}},
			{id = "default_bganimation_custombg2", loop = 0,			dst = {{time = 0, x = 284, y = 284, w = 512, h = 512, angle = 360},{time = 4000, angle = 0}}},
			{id = "default_bganimation_custombg3", blend = 2, loop = 0,	dst = {{time = 0, x = -512, y = 0, w = 512, h = 1080, angle = 360},{time = 8000, x = 2560}}}
		}
	end
	return parts	
end

return {
	parts = parts,
	load = load
}