local parts = {}

local function load()
	parts.source = {
		{id = "src-default_network_irdata_bg", path = "customize/advanced/default_network/irdata_bg.png"},
	}
	
	parts.text = {
		{id = "default_network_network",	font = "font-default-commonparts-m_select1", size = 21, align = 0, constantText = "NETWORK"},
		{id = "default_network_on",			font = "font-default-commonparts-m_select1", size = 21, align = 0, constantText = "ON"},
		{id = "default_network_off",		font = "font-default-commonparts-m_select1", size = 21, align = 0, constantText = "OFF"},
		{id = "default_network_freeplay",	font = "font-default-commonparts-m_select1", size = 21, align = 0, constantText = "FREE PLAY"}
	}
		
	parts.destination = {
		{id = "default_network_network",				dst = {{x = 6, y = 6, w = 140, h = 21}}},
		{id = "default_network_on",			op = {51},	dst = {{x = 156, y = 6, w = 40, h = 21}}},
		{id = "default_network_off",		op = {50},	dst = {{x = 156, y = 6, w = 60, h = 21}}},
		{id = "default_network_freeplay",				dst = {{x = 1744, y = 6, w = 170, h = 21}}}
	}
	
	return parts	
end

return {
	parts = parts,
	load = load
}