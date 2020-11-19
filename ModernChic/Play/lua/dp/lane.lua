--[[
	レーン・グローランプ
]]

local function offsetJudgelineHeight()
	local def = 12 -- 判定ライン高さのデフォルト値
	local height = skin_config.offset["判定ラインの高さ（0以下はデフォルト値12になります）"].h
	if height < 1 then
		return def
	end
	return height
end

local function offsetGlowlampHeight()
	local def = 48
	local height = skin_config.offset["グローランプの高さ（0以下はデフォルト値48になります）"].h
	if height < 1 then
		return def
	end
	return height
end

local function load(laneLeftPosX, laneRightPosX, notesPositionY)
	local parts = {}
	
	parts.image = {
		-- レーン(1P2P共通)
		{id = "lane", src = 2, x = 0, y = 0, w = 519, h = 856},
		-- レーンの仕切り
		{id = "lane_1P", src = 2, x = 0, y = 860, w = 513, h = 10},
		{id = "lane_2P", src = 2, x = 0, y = 880, w = 513, h = 10},
		-- 判定ライン
		{id = "judge_line", src = 5, x = 0, y = 0, w = 513, h = 12},
		-- グローランプ
		{id = "glow", src = 9, x = 0, y = 0, w = 431, h = 48},
	}
	
	parts.destination = {}

	local glowHeight = offsetGlowlampHeight()
	local judgeHeight = offsetJudgelineHeight()
	local posx = {laneLeftPosX, laneRightPosX}

		-- レーン（基準点）
		table.insert(parts.destination,	{
			id = "lane", dst = {
				{x = laneLeftPosX, y = notesPositionY - 3, w = 519, h = 856}
			}
		})
		table.insert(parts.destination,	{
			id = "lane", dst = {
				{x = laneRightPosX, y = notesPositionY - 3, w = 519, h = 856}
			}
		})

		-- レーン仕切り
		-- op936: レーン表示あり
		table.insert(parts.destination,	{
			id = "lane_1P", loop = 1000, timer = 40, dst = {
				{time = 0, x = laneLeftPosX + 3, y = notesPositionY, w = 513, h = 1},
				{time = 1000, h = 853}
			}
		})
		table.insert(parts.destination,	{
			id = "lane_2P", loop = 1000, timer = 40, dst = {
				{time = 0, x = laneRightPosX + 3, y = notesPositionY, w = 513, h = 1},
				{time = 1000, h = 853}
			}
		})

		-- レーンの明るさ調節
		table.insert(parts.destination,	{
			id = -110, offsets = {47}, dst = {
				{x = laneLeftPosX + 3, y = notesPositionY, w = 513, h = 854, a = 0},
			}
		})
		table.insert(parts.destination,	{
			id = -110, offsets = {47}, dst = {
				{x = laneRightPosX + 3, y = notesPositionY, w = 513, h = 854, a = 0},
			}
		})

	for i = 1, 2, 1 do
		-- グローランプ
		-- op939: グローランプを表示する
		-- timer:140 RHYHM（1000を一拍とする）	
		table.insert(parts.destination, {
			id = "glow", offset = 3, timer = 140, op = {939}, blend = 2, filter = 1, dst = {
				{time = 0, x = posx[i] + 3, y = notesPositionY + judgeHeight, w = 513, h = glowHeight, a = 255},
				{time = 1000, a = 0}
			}
		})
		-- 初期グロー
		table.insert(parts.destination,	{
			id = "glow", offset = 3, blend = 2, op = {939}, filter = 1, loop = 1500, dst = {
				{time = 1000, x = posx[i] + 3, y = notesPositionY + judgeHeight, w = 513, h = glowHeight, a = 0},
				{time = 1500, a = 120}
			}
		})
		-- 判定ライン
		table.insert(parts.destination,	{
			id = "judge_line", offset = 3, dst = {
				{x = posx[i] + 3, y = notesPositionY, w = 513, h = judgeHeight},
			}
		})
	end

	return parts
end

return {
	load = load
}