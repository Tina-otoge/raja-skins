--[[
	レーンカバー、リフト、hiddenカバー
]]

local function isLanecoverSyncOn()
	return skin_config.option["左右のレーンカバーを同期する"] == 985
end
local function isLanecoverSyncOff()
	return skin_config.option["左右のレーンカバーを同期する"] == 986
end
--[[
local function isLiftcoverSyncOn()
	return skin_config.option["左右のリフトカバーを同期する"] == 988
end
local function isLiftcoverSyncOff()
	return skin_config.option["左右のリフトカバーを同期する"] == 989
end
]]

local function load(laneLeftPosX, laneRightPosX, notesPositionY)
	local parts = {}
	
	parts.image = {}

	parts.slider = {}

	-- レーンカバーを同期する場合は左に同期する
	if isLanecoverSyncOn() then
		table.insert(parts.image, {
			id = "laneCoverLeft2", src = 17, x = 0, y = 0, w = 513, h = 853
		})
		table.insert(parts.image, {
			id = "laneCoverRight2", src = 17, x = 0, y = 0, w = 513, h = 853
		})
		table.insert(parts.slider, {
			id = "laneCoverLeft", src = 17, x = 0, y = 0, w = 513, h = 853, angle = 2, range = 853, type = 4
		})
		table.insert(parts.slider, {
			id = "laneCoverRight", src = 17, x = 0, y = 0, w = 513, h = 853, angle = 2, range = 853, type = 4
		})
	elseif isLanecoverSyncOff() then
		table.insert(parts.image, {
			id = "laneCoverLeft2", src = 17, x = 0, y = 0, w = 513, h = 853
		})
		table.insert(parts.image, {
			id = "laneCoverRight2", src = 18, x = 0, y = 0, w = 513, h = 853
		})
		table.insert(parts.slider, {
			id = "laneCoverLeft", src = 17, x = 0, y = 0, w = 513, h = 853, angle = 2, range = 853, type = 4
		})
		table.insert(parts.slider, {
			id = "laneCoverRight", src = 18, x = 0, y = 0, w = 513, h = 853, angle = 2, range = 853, type = 4
		})
	end

	-- disapearline : lift開始地点(判定位置)
	parts.liftCover = {
		{id = "liftCoverLeft", src = 19, x = 0, y = 0, w = 513, h = 853, disapearLine = 227},
		{id = "liftCoverRight", src = 19, x = 0, y = 0, w = 513, h = 853, disapearLine = 227},
	}
	
	-- disapearline : hidden開始地点(判定位置)
	parts.hiddenCover = {
		-- hiddenは黒のドットで
		{id = "hiddenCoverLeft", src = 1, x = 0, y = 0, w = 1, h = 1, disapearLine = 227},
		{id = "hiddenCoverRight", src = 1, x = 0, y = 0, w = 1, h = 1, disapearLine = 227},
	}
	
	parts.value = {
		-- 緑数字
		{id = "greennumber", src = 1, x = 720, y = 1160, w = 240, h = 20, divx = 10, divy = 1, digit = 4, ref = 313},
		{id = "greennumberLanecoverOn", src = 1, x = 720, y = 1160, w = 240, h = 20, divx = 10, divy = 1, digit = 4, ref = 1313},
		{id = "greennumberLanecoverOff", src = 1, x = 720, y = 1160, w = 240, h = 20, divx = 10, divy = 1, digit = 4, ref = 1315},
		{id = "greennumberMainbpmLanecoverOn", src = 1, x = 720, y = 1160, w = 240, h = 20, divx = 10, divy = 1, digit = 4, ref = 1317},
		{id = "greennumberMainbpmLanecoverOff", src = 1, x = 720, y = 1160, w = 240, h = 20, divx = 10, divy = 1, digit = 4, ref = 1319},
		-- 最低bpm時の緑数字
		{id = "greennumberMinbpmLanecoverOn", src = 1, x = 720, y = 1160, w = 240, h = 20, divx = 10, divy = 1, digit = 4, ref = 1320, align = 0},
		-- 最高bpm時の緑数字
		{id = "greennumberMaxbpmLanecoverOn", src = 1, x = 720, y = 1160, w = 240, h = 20, divx = 10, divy = 1, digit = 4, ref = 1324, align = 1},
		-- 白数字
		{id = "duration", src = 1, x = 720, y = 1040, w = 240, h = 20, divx = 10, divy = 1, digit = 4, ref = 312},
		{id = "durationLanecoverOn", src = 1, x = 720, y = 1040, w = 240, h = 20, divx = 10, divy = 1, digit = 4, ref = 1312},
		{id = "durationLanecoverOff", src = 1, x = 720, y = 1040, w = 240, h = 20, divx = 10, divy = 1, digit = 4, ref = 1314},
		{id = "durationMainbpmLanecoverOn", src = 1, x = 720, y = 1040, w = 240, h = 20, divx = 10, divy = 1, digit = 4, ref = 1316},
		{id = "durationMainbpmLanecoverOff", src = 1, x = 720, y = 1040, w = 240, h = 20, divx = 10, divy = 1, digit = 4, ref = 1318},
		{id = "durationMinbpmLanecoverOn", src = 1, x = 720, y = 1040, w = 240, h = 20, divx = 10, divy = 1, digit = 4, ref = 1320},
		{id = "durationMinbpmLanecoverOff", src = 1, x = 720, y = 1040, w = 240, h = 20, divx = 10, divy = 1, digit = 4, ref = 1322},
		{id = "durationMaxbpmLanecoverOn", src = 1, x = 720, y = 1040, w = 240, h = 20, divx = 10, divy = 1, digit = 4, ref = 1324},
		{id = "durationMaxbpmLanecoverOff", src = 1, x = 720, y = 1040, w = 240, h = 20, divx = 10, divy = 1, digit = 4, ref = 1326},
		-- レーンカバー下げ量（白数字）
		{id = "lanecoverNumber", src = 1, x = 720, y = 1040, w = 240, h = 20, divx = 10, divy = 1, digit = 4, ref = 14},
		-- リフト数値
		{id = "liftNumber", src = 1, x = 720, y = 1040, w = 240, h = 20, divx = 10, divy = 1, digit = 4, ref = 314},
	}
	
	parts.destination = {}
	
	local wd = {"Left", "Right"}
	local posx = {laneLeftPosX, laneRightPosX}
	for i = 1, 2, 1 do
		-- hidden y : disapearLine（lift開始点）- h
		table.insert(parts.destination, {
			id = "hiddenCover"..wd[i], dst = {
				{x = posx[i] + 3, y = -632, w = 513, h = 859},
			}
		})
		
		-- リフト y : disapearLine（lift開始点）- h
		table.insert(parts.destination, {
			id = "liftCover"..wd[i], dst = {
				{x = posx[i] + 3, y = -632, w = 513, h = 859},
			}
		})
		
		-- レーンカバー
		table.insert(parts.destination,	{
			id = "laneCover"..wd[i], dst = {
				{x = posx[i] + 3, y = 1080, w = 513, h = 853},
			}
		})

		-- op:270 スタートボタン押下時
		-- op:272 リフトあり
		-- op:177 BMP変更あり
		-- レーンカバー白数字
		table.insert(parts.destination,	{
			id = "lanecoverNumber", offset = 4, op = {270}, dst = {
				{x = posx[i] + 100, y = 1090, w = 24, h = 20}
			}
		})
		
		-- レーンカバー緑数字
		table.insert(parts.destination,	{
			id = "greennumber", offset = 4, op = {270}, dst = {
				{x = posx[i] + 270, y = 1090, w = 24, h = 20},
			}
		})
		
		-- レーンカバー緑数字最大・最小
		table.insert(parts.destination,	{
			id = "greennumberMinbpmLanecoverOn", offset = 4, op = {270, 177}, dst = {
				{x = posx[i] + 225, y = 1120, w = 24, h = 20},
			}
		})
		table.insert(parts.destination,	{
			id = "from", offset = 4, op = {270, 177}, dst = {
				{x = posx[i] + 335, y = 1117, w = 24, h = 20, r = 84,  g = 255, b = 0},
			}
		})
		table.insert(parts.destination,	{
			id = "greennumberMaxbpmLanecoverOn", offset = 4, op = {270, 177}, dst = {
				{x = posx[i] + 355, y = 1120, w = 24, h = 20},
			}
		})
		
		-- リフト白数字
		table.insert(parts.destination,	{
			id = "liftNumber", offset = 3, op = {270}, dst = {
				{x = posx[i] + 100, y = notesPositionY - 30, w = 24, h = 20},
			}
		})
		
		-- リフト緑数字
		table.insert(parts.destination,	{
			id = "greennumber", offset = 3, op = {270}, dst = {
				{x = posx[i] + 270, y = notesPositionY - 30, w = 24, h = 20},
			}
		})
		
		-- 曲終了時にレーンカバーを下ろす
		-- timer143: 最終ノートタイマー
		table.insert(parts.destination,	{
			id = "laneCover"..wd[i].."2", timer = 143, loop = 1000, dst = {
				{time = 0, x = posx[i] + 3, y = 1080, w = 513, h = 853},
				{time = 1000, y = 1080 - 853, acc = 2}
			}
		})
	end
	
	return parts
end

return {
	load = load
}