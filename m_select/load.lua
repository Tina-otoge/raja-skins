local skin_name = "m-select"
local folder_name = "m_select"
local resolution = {w = 1920, h = 1080}

function append_all(list, t)
	if t then
		for i, v in pairs(t) do
			table.insert(list, v)
		end
	end
end

main_state = require("main_state")
event_util = require("event_util")
timer_util = require("timer_util")
		
function load_parts()

	local PROPERTY_OP = 899
	local OFFSET_ID = 59
	local CUSTOMEVENT_ID = 999
	local CUSTOMTIMER_ID = 9999

	function get_property_op()
		PROPERTY_OP = PROPERTY_OP + 1
		return PROPERTY_OP
	end
			
	function get_offset_id()
		OFFSET_ID = OFFSET_ID + 1
		return OFFSET_ID
	end
	
	function get_customEvent_id()
		CUSTOMEVENT_ID = CUSTOMEVENT_ID + 1
		return CUSTOMEVENT_ID
	end
	
	function get_customTimer_id()
		CUSTOMTIMER_ID = CUSTOMTIMER_ID + 1
		return CUSTOMTIMER_ID
	end

	local skin = {
		type = 5,
		name = skin_name .. "(lua)",
		w = resolution.w,
		h = resolution.h,
		fadeout = 500,
		scene = 3000,
		input = 500,
	}
	
	skin.property = {}
	
	skin.filepath = {}
	
	skin.offset = {}

	skin.source = {}
	
	skin.font = {}
	
	skin.image = {}
	
	skin.imageset = {}
	
	skin.value = {}
	
	skin.text = {}
	
	skin.songlist = {}
	skin.songlist.id = nil
	skin.songlist.center = nil
	skin.songlist.clickable = {}
	skin.songlist.listoff = {}
	skin.songlist.liston = {}
	skin.songlist.text = {}
	skin.songlist.level = {}
	skin.songlist.lamp = {}
	skin.songlist.playerlamp = {}
	skin.songlist.rivallamp = {}
	skin.songlist.trophy = {}
	skin.songlist.label = {}
	skin.songlist.graph = nil
	
	skin.graph = {}

	skin.judgegraph = {}
	
	skin.bpmgraph = {}
	
	skin.slider = {}
	
	skin.customEvents = {}
	
	skin.customTimers = {}

	skin.destination = {}
	
	do
		local f = io.open("skin/" .. folder_name .. "/customize/advanced/enable.txt", "r")
		local load_log = io.open("skin/" .. folder_name .. "/customize/advanced/load_log.txt", "w")
		for l in f:lines() do
			load_log:write(l)
			local path = "skin/" .. folder_name .. "/customize/advanced/" .. l
			if skin_config then
				local parts_status, parts = pcall(function() return dofile(path).load() end)
				if parts_status and parts then
					append_all(skin.property, parts.property)
					append_all(skin.filepath, parts.filepath)
					append_all(skin.offset, parts.offset)
					append_all(skin.source, parts.source)
					append_all(skin.font, parts.font)
					append_all(skin.image, parts.image)
					append_all(skin.imageset, parts.imageset)
					append_all(skin.value, parts.value)
					append_all(skin.text, parts.text)
					append_all(skin.slider, parts.slider)
					if parts.songlist then
						skin.songlist.id = parts.songlist.id
						skin.songlist.center = parts.songlist.center
						append_all(skin.songlist.clickable, parts.songlist.clickable)
						append_all(skin.songlist.listoff, parts.songlist.listoff)
						append_all(skin.songlist.liston, parts.songlist.liston)
						append_all(skin.songlist.text, parts.songlist.text)
						append_all(skin.songlist.level, parts.songlist.level)
						append_all(skin.songlist.lamp, parts.songlist.lamp)
						append_all(skin.songlist.playerlamp, parts.songlist.playerlamp)
						append_all(skin.songlist.rivallamp, parts.songlist.rivallamp)
						append_all(skin.songlist.trophy, parts.songlist.trophy)
						append_all(skin.songlist.label, parts.songlist.label)
						skin.songlist.graph = parts.songlist.graph
					end				
					append_all(skin.graph, parts.graph)
					append_all(skin.judgegraph, parts.judgegraph)
					append_all(skin.bpmgraph, parts.bpmgraph)
					append_all(skin.customEvents, parts.customEvents)
					append_all(skin.customTimers, parts.customTimers)
					append_all(skin.destination, parts.destination)
					load_log:write("...OK\n")
				else
					load_log:write("...NG\n")
				end
			else
				local parts_status, parts = pcall(function() return dofile(path).parts end)
				if parts_status and parts then
					append_all(skin.property, parts.property)
					append_all(skin.filepath, parts.filepath)
					append_all(skin.offset, parts.offset)
					append_all(skin, parts)
					load_log:write("...OK\n")
				else
					load_log:write("...NG\n")
				end
			end
		end
		f:close()
		load_log:close()
	end
		
	return skin
end

return {
	load_parts = load_parts
}
