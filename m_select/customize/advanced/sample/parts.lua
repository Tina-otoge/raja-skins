--[[
画面上にSAMPLEと表示するパーツです
スキンの書き方や構造は下記のURLを参照してください
https://github.com/exch-bms2/beatoraja/wiki/Luaスキンの記述方法
https://github.com/exch-bms2/beatoraja/blob/master/src/bms/player/beatoraja/skin/json/JsonSkin.java
https://github.com/exch-bms2/beatoraja/blob/master/src/bms/player/beatoraja/skin/SkinProperty.java
https://github.com/exch-bms2/beatoraja/tree/master/src/bms/player/beatoraja/skin/lua

propertyのop値等は被りを防ぐため直接数値を書き込まず下記の関数を使用してください
get_property_op()
get_offset_id()
get_customEvent_id()
get_customTimer_id()
--]]

local parts = {}

local OP_SAMPLE_OFF	= get_property_op()
local OP_SAMPLE_ON	= get_property_op()
local ID_SAMPLE		= get_offset_id()

parts.property = {
	{name = "画面上にSAMPLEと表示する", item = {
		{name = "OFF",	op = OP_SAMPLE_OFF},
		{name = "ON",	op = OP_SAMPLE_ON}
	},def = "ON"}
}
	
parts.filepath = {}
	
parts.offset = {
	{name = "SAMPLEの表示位置", id = ID_SAMPLE, x = true, y = true}
}

local function load()	
	parts.source = {
		{id = "src-sample", path = "customize/advanced/sample/sample.png"}
	}

	parts.font = {}

	parts.image = {
		{id = "img-sample", src = "src-sample", x = 0, y = 0, w = -1, h = -1}
	}

	parts.imageset = {}

	parts.value = {}

	parts.text = {}

	parts.slider = {}

	parts.graph = {}
	
	parts.judgegraph = {}
	
	parts.bpmgraph = {}

	parts.customEvents = {}
	
	parts.customTimers = {}
	
	parts.destination = {
		{id = "img-sample", offset = ID_SAMPLE, op = {OP_SAMPLE_ON}, dst = {
			{x = 0, y = 0, w = 1920, h = 1080}
		}}
	}
	
	-- 他のパーツとのid被りを防ぐために先頭にフォルダ名を付けています
	local folder_name = "sample"
	for i = 1, #parts.source do
		parts.source[i].id = folder_name .. parts.source[i].id
	end
	for i = 1, #parts.image do
		parts.image[i].id = folder_name .. parts.image[i].id
		parts.image[i].src = folder_name .. parts.image[i].src
	end
	for i = 1, #parts.destination do
		parts.destination[i].id = folder_name .. parts.destination[i].id
	end
			
	return parts	
end

return {
	parts = parts,
	load = load
}