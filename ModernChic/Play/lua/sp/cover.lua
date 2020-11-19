--[[
	レーンカバー、リフト、hiddenカバー
]]

local function load(playsidePositionX, notesPositionY)
	local parts = {}
	
	parts.image = {
		{id = "gaugeFrame_1P", src = 1, x = 0, y = 861, w = 556, h = 69},
		-- レーンカバー
		{id = "lane_cover2", src = 17, x = 0, y = 0, w = 513, h = 853},
	}
	
	parts.slider = {
		-- レーンカバー
		{id = "lane_cover", src = 17, x = 0, y = 0, w = 513, h = 853, angle = 2, range = 853, type = 4},
	}
	
	-- disapearline : lift開始地点(判定位置)
	parts.liftCover = {
		{id = "lift_cover", src = 18, x = 0, y = 0, w = 513, h = 853, disapearLine = 227},
	}
	
	-- disapearline : hidden開始地点(判定位置)
	parts.hiddenCover = {
		-- hiddenは黒のドットで
		{id = "hidden_cover", src = 1, x = 0, y = 0, w = 1, h = 1, disapearLine = 227},
	}
	
	parts.value = {
		-- 緑数字
		{id = "greennumber", src = 1, x = 1400, y = 161, w = 270, h = 20, divx = 10, divy = 1, digit = 4, ref = 313},
		{id = "greennumberLanecoverOn", src = 1, x = 1400, y = 161, w = 270, h = 20, divx = 10, divy = 1, digit = 4, ref = 1313},
		{id = "greennumberLanecoverOff", src = 1, x = 1400, y = 161, w = 270, h = 20, divx = 10, divy = 1, digit = 4, ref = 1315},
		{id = "greennumberMainbpmLanecoverOn", src = 1, x = 1400, y = 161, w = 270, h = 20, divx = 10, divy = 1, digit = 4, ref = 1317},
		{id = "greennumberMainbpmLanecoverOff", src = 1, x = 1400, y = 161, w = 270, h = 20, divx = 10, divy = 1, digit = 4, ref = 1319},
		-- 最低bpm時の緑数字
		{id = "greennumberMinbpmLanecoverOn", src = 1, x = 1400, y = 161, w = 270, h = 20, divx = 10, divy = 1, digit = 4, ref = 1320, align = 0},
		-- 最高bpm時の緑数字
		{id = "greennumberMaxbpmLanecoverOn", src = 1, x = 1400, y = 161, w = 270, h = 20, divx = 10, divy = 1, digit = 4, ref = 1324, align = 1},
		-- 白数字
		{id = "duration", src = 1, x = 1400, y = 101, w = 270, h = 20, divx = 10, divy = 1, digit = 4, ref = 312},
		{id = "durationLanecoverOn", src = 1, x = 1400, y = 101, w = 270, h = 20, divx = 10, divy = 1, digit = 4, ref = 1312},
		{id = "durationLanecoverOff", src = 1, x = 1400, y = 101, w = 270, h = 20, divx = 10, divy = 1, digit = 4, ref = 1314},
		{id = "durationMainbpmLanecoverOn", src = 1, x = 1400, y = 101, w = 270, h = 20, divx = 10, divy = 1, digit = 4, ref = 1316},
		{id = "durationMainbpmLanecoverOff", src = 1, x = 1400, y = 101, w = 270, h = 20, divx = 10, divy = 1, digit = 4, ref = 1318},
		{id = "durationMinbpmLanecoverOn", src = 1, x = 1400, y = 101, w = 270, h = 20, divx = 10, divy = 1, digit = 4, ref = 1320},
		{id = "durationMinbpmLanecoverOff", src = 1, x = 1400, y = 101, w = 270, h = 20, divx = 10, divy = 1, digit = 4, ref = 1322},
		{id = "durationMaxbpmLanecoverOn", src = 1, x = 1400, y = 101, w = 270, h = 20, divx = 10, divy = 1, digit = 4, ref = 1324},
		{id = "durationMaxbpmLanecoverOff", src = 1, x = 1400, y = 101, w = 270, h = 20, divx = 10, divy = 1, digit = 4, ref = 1326},
		-- レーンカバー下げ量（白数字）
		{id = "lanecoverNumber", src = 1, x = 1400, y = 101, w = 270, h = 20, divx = 10, divy = 1, digit = 4, ref = 14},
		-- リフト数値
		{id = "liftNumber", src = 1, x = 1400, y = 101, w = 270, h = 20, divx = 10, divy = 1, digit = 4, ref = 314},
	}
	
	parts.destination = {}
	
	-- hidden y : disapearLine（lift開始点）- h
	table.insert(parts.destination, {
		id = "hidden_cover", dst = {
			{x = playsidePositionX + 3, y = -632, w = 513, h = 859},
		}
	})
	
	-- リフト y : disapearLine（lift開始点）- h
	table.insert(parts.destination, {
		id = "lift_cover", dst = {
			{x = playsidePositionX + 3, y = -632, w = 513, h = 859},
		}
	})
	
	-- レーンカバー
	table.insert(parts.destination,	{
		id = "lane_cover", dst = {
			{x = playsidePositionX + 3, y = 1080, w = 513, h = 853},
		}
	})
	
	-- op:270 スタートボタン押下時
	-- op:272 リフトあり
	-- op:177 BMP変更あり
	-- レーンカバー白数字
	table.insert(parts.destination,	{
		id = "lanecoverNumber", offset = 4, op = {270}, dst = {
			{x = playsidePositionX + 90, y = 1090, w = 27, h = 20}
		}
	})
	
	-- レーンカバー緑数字
	table.insert(parts.destination,	{
		id = "greennumber", offset = 4, op = {270}, dst = {
			{x = playsidePositionX + 260, y = 1090, w = 27, h = 20},
		}
	})
	
	-- レーンカバー緑数字最大・最小
	table.insert(parts.destination,	{
		id = "greennumberMinbpmLanecoverOn", offset = 4, op = {270, 177}, dst = {
			{x = playsidePositionX + 220, y = 1120, w = 21, h = 18},
		}
	})
	table.insert(parts.destination,	{
		id = "from", offset = 4, op = {270, 177}, dst = {
			{x = playsidePositionX + 320, y = 1117, w = 21, h = 18, r = 84,  g = 255, b = 0},
		}
	})
	table.insert(parts.destination,	{
		id = "greennumberMaxbpmLanecoverOn", offset = 4, op = {270, 177}, dst = {
			{x = playsidePositionX + 340, y = 1120, w = 21, h = 18},
		}
	})
	
	-- リフト白数字
	table.insert(parts.destination,	{
		id = "liftNumber", offset = 3, op = {270}, dst = {
			{x = playsidePositionX + 90, y = notesPositionY - 30, w = 27, h = 20},
		}
	})
	
	-- リフト緑数字
	table.insert(parts.destination,	{
		id = "greennumber", offset = 3, op = {270}, dst = {
			{x = playsidePositionX + 260, y = notesPositionY - 30, w = 27, h = 20},
		}
	})
	
	-- 曲終了時にレーンカバーを下ろす
	-- timer143: 最終ノートタイマー
	table.insert(parts.destination,	{
		id = "lane_cover2", timer = 143, loop = 1000, dst = {
			{time = 0, x = playsidePositionX + 3, y = 1080, w = 513, h = 853},
			{time = 1000, y = 1080 - 853, acc = 2}
		}
	})
	
	return parts
end

return {
	load = load
}