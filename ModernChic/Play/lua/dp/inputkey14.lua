--[[
	14鍵用キー入力関連
]]

local function isBeamHeight100()
	return skin_config.option["キービームの高さ"] == 960
end
local function isBeamHeight90()
	return skin_config.option["キービームの高さ"] == 961
end
local function isBeamHeight80()
	return skin_config.option["キービームの高さ"] == 962
end
local function isBeamHeight70()
	return skin_config.option["キービームの高さ"] == 963
end
local function isBeamHeight60()
	return skin_config.option["キービームの高さ"] == 964
end
local function isBeamHeight50()
	return skin_config.option["キービームの高さ"] == 965
end
local function isBeamHeight40()
	return skin_config.option["キービームの高さ"] == 966
end
local function isBeamHeight30()
	return skin_config.option["キービームの高さ"] == 967
end
local function isBeamHeight20()
	return skin_config.option["キービームの高さ"] == 968
end
local function isBeamHeight10()
	return skin_config.option["キービームの高さ"] == 969
end
local function isBeamDisappearanceTimeNormal()
	return skin_config.option["キービームの消失時間"] == 970
end
local function isBeamDisappearanceTimeShort()
	return skin_config.option["キービームの消失時間"] == 971
end
local function isBeamDisappearanceTimeLong()
	return skin_config.option["キービームの消失時間"] == 972
end
local function isBeamDisappearanceTypeL()
	return skin_config.option["キービームの消失パターン"] == 975
end
local function isBeamDisappearanceTypeB()
	return skin_config.option["キービームの消失パターン"] == 976
end

-- キービームの高さ調節
local function setKeybeamHeight()
	local height = 564
	if isBeamHeight100() then
		return height * 1
	elseif isBeamHeight90() then
		return height * 0.9
	elseif isBeamHeight80() then
		return height * 0.8
	elseif isBeamHeight70() then
		return height * 0.7
	elseif isBeamHeight60() then
		return height * 0.6
	elseif isBeamHeight50() then
		return height * 0.5
	elseif isBeamHeight40() then
		return height * 0.4
	elseif isBeamHeight30() then
		return height * 0.3
	elseif isBeamHeight20() then
		return height * 0.2
	elseif isBeamHeight10() then
		return height * 0.1
	end
	return height
end

-- キービーム消失時間（ミリ秒）
local function setTimeKeyOff()
	if isBeamDisappearanceTimeNormal() then
		return 100
	elseif isBeamDisappearanceTimeShort() then
		return 50
	elseif isBeamDisappearanceTimeLong() then
		return 200
	end
end

--[[
	LaneLeftPosX : 1P側基準
	LaneRightPosX : 2P側基準
	notesPositionY : 判定ライン基準
]]
local function load(laneLeftPosX, laneRightPosX, notesPositionY)
	local parts = {}
	
	parts.image = {
		-- キービーム
		{id = "keybeam-w", src = 14, x = 0, y = 0, w = 60, h = 564},
		{id = "keybeam-b", src = 14, x = 70, y = 0, w = 48, h = 564},
		{id = "keybeam-s", src = 14, x = 130, y = 0, w = 108, h = 564},
	}
	
	parts.destination = {}
	do
		-- 鍵盤の種類
		local init = {"w", "b", "w", "b", "w", "b", "w", "s"}
		-- 配置位置
		local keyLeftPosX = {114, 177, 228, 291, 342, 405, 456, 3}
		local keyRightPosX = {3, 66, 117, 180, 231, 294, 345, 407}
		-- 横幅
		local width = {60, 48, 60, 48, 60, 48, 60, 108}
		-- キービームの長さ
		local keybeam_height = setKeybeamHeight()
		
		-- キーが押されたとき-----------------------------------------------------
		do
			local keyLeftTimer = {101, 102, 103, 104, 105, 106, 107, 100}
			local keyRightTimer = {111, 112, 113, 114, 115, 116, 117, 110}

			for i = 1, 7, 1 do
				-- 左
				table.insert(parts.destination,	{
					id = "keybeam-"..init[i], offset = 3, timer = keyLeftTimer[i], blend = 1, dst = {
						{x = laneLeftPosX + keyLeftPosX[i], y = notesPositionY, w = width[i], h = keybeam_height}
					}
				})
				-- 右
				table.insert(parts.destination,	{
					id = "keybeam-"..init[i], offset = 3, timer = keyRightTimer[i], blend = 1, dst = {
						{x = laneRightPosX + keyRightPosX[i], y = notesPositionY, w = width[i], h = keybeam_height}
					}
				})
			end
			-- 左皿
			table.insert(parts.destination,	{
				id = "keybeam-"..init[8], offset = 3, timer = keyLeftTimer[8], blend = 1, loop = -1, op = {32}, dst = {
					{time = 0, x = laneLeftPosX + keyLeftPosX[8], y = notesPositionY, w = width[8], h = 0},
					{time = 50, h = keybeam_height},
					{time = 85},
					{time = 170, x = laneLeftPosX + keyLeftPosX[8] + 54, w = 0, a = 0}
				}
			})
			-- 右皿
			table.insert(parts.destination,	{
				id = "keybeam-"..init[8], offset = 3, timer = keyRightTimer[8], blend = 1, loop = -1, op = {32}, dst = {
					{time = 0, x = laneRightPosX + keyRightPosX[8], y = notesPositionY, w = width[8], h = 0},
					{time = 50, h = keybeam_height},
					{time = 85},
					{time = 170, x = laneRightPosX + keyRightPosX[8] + 54, w = 0, a = 0}
				}
			})
			-- 左皿（オートプレイ時）
			table.insert(parts.destination,	{
				id = "keybeam-"..init[8], offset = 3, timer = keyLeftTimer[8], blend = 1, op = {33}, dst = {
					{x = laneLeftPosX + keyLeftPosX[8], y = notesPositionY, w = width[8], h = keybeam_height}
				}
			})
			-- 右皿（オートプレイ時）
			table.insert(parts.destination,	{
				id = "keybeam-"..init[8], offset = 3, timer = keyRightTimer[8], blend = 1, op = {33}, dst = {
					{x = laneRightPosX + keyRightPosX[8], y = notesPositionY, w = width[8], h = keybeam_height}
				}
			})
		end

		-- キーが離されたとき(1234567Sの順)-----------------------------------------
		-- timer 121 TIMER_KEYOFF_1P_KEY1
		-- timer 122 TIMER_KEYOFF_1P_KEY2
		-- timer 123 TIMER_KEYOFF_1P_KEY3
		-- timer 124 TIMER_KEYOFF_1P_KEY4
		-- timer 125 TIMER_KEYOFF_1P_KEY5
		-- timer 126 TIMER_KEYOFF_1P_KEY6
		-- timer 127 TIMER_KEYOFF_1P_KEY7
		-- timer 120 TIMER_KEYOFF_1P_SCRATCH
		-- timer 130 ~ 2P同様
		do
			local leftTimer = {121, 122, 123, 124, 125, 126, 127, 120}
			local rightTimer = {131, 132, 133, 134, 135, 136, 137, 130}
			local time_keyoff = setTimeKeyOff()
			if isBeamDisappearanceTypeL() then
				-- TYPE-L
				for i = 1, 7, 1 do
					-- 左
					table.insert(parts.destination,	{
						id = "keybeam-"..init[i], offset = 3, timer = leftTimer[i], blend = 1, loop = time_keyoff, dst = {
							{time = 0, x = laneLeftPosX + keyLeftPosX[i], y = notesPositionY, w = width[i], h = keybeam_height, acc = 2},
							{time = time_keyoff, a = 0}
						}
					})
					-- 右
					table.insert(parts.destination,	{
						id = "keybeam-"..init[i], offset = 3, timer = rightTimer[i], blend = 1, loop = time_keyoff, dst = {
							{time = 0, x = laneRightPosX + keyRightPosX[i], y = notesPositionY, w = width[i], h = keybeam_height, acc = 2},
							{time = time_keyoff, a = 0}
						}
					})
				end
				-- 皿はオートプレイのみ適用
				table.insert(parts.destination,	{
					id = "keybeam-"..init[8], offset = 3, timer = leftTimer[8], blend = 1, loop = time_keyoff, op = {33}, dst = {
						{time = 0, x = laneLeftPosX + keyLeftPosX[8], y = notesPositionY, w = width[8], h = keybeam_height, acc = 2},
						{time = time_keyoff, a = 0}
					}
				})
				table.insert(parts.destination,	{
					id = "keybeam-"..init[8], offset = 3, timer = rightTimer[8], blend = 1, loop = time_keyoff, op = {33}, dst = {
						{time = 0, x = laneRightPosX + keyRightPosX[8], y = notesPositionY, w = width[8], h = keybeam_height, acc = 2},
						{time = time_keyoff, a = 0}
					}
				})
			elseif isBeamDisappearanceTypeB() then
				-- TYPE-B
				local movePosxLeft = {144, 207, 258, 321, 372, 435, 486, 57}
				local movePosxRight = {33, 90, 147, 204, 261, 318, 375, 461}

				for i = 1, 7, 1 do
					-- 左
					table.insert(parts.destination,	{
						id = "keybeam-"..init[i], offset = 3, timer = leftTimer[i], blend = 1, loop = time_keyoff, dst = {
							{time = 0, x = laneLeftPosX + keyLeftPosX[i], y = notesPositionY, w = width[i], h = keybeam_height, acc = 2},
							{time = time_keyoff, x = laneLeftPosX + movePosxLeft[i], w = 0, a = 0}
						}
					})
					-- 右
					table.insert(parts.destination,	{
						id = "keybeam-"..init[i], offset = 3, timer = rightTimer[i], blend = 1, loop = time_keyoff, dst = {
							{time = 0, x = laneRightPosX + keyRightPosX[i], y = notesPositionY, w = width[i], h = keybeam_height, acc = 2},
							{time = time_keyoff, x = laneRightPosX + movePosxRight[i], w = 0, a = 0}
						}
					})
				end
				-- 皿はオートのみ適用
				table.insert(parts.destination,	{
					id = "keybeam-"..init[8], offset = 3, timer = leftTimer[8], blend = 1, loop = time_keyoff, op = {33}, dst = {
						{time = 0, x = laneLeftPosX + keyLeftPosX[8], y = notesPositionY, w = width[8], h = keybeam_height, acc = 2},
						{time = time_keyoff, x = laneLeftPosX + movePosxLeft[8], w = 0, a = 0}
					}
				})
				table.insert(parts.destination,	{
					id = "keybeam-"..init[8], offset = 3, timer = rightTimer[8], blend = 1, loop = time_keyoff, op = {33}, dst = {
						{time = 0, x = laneRightPosX + keyRightPosX[8], y = notesPositionY, w = width[8], h = keybeam_height, acc = 2},
						{time = time_keyoff, x = laneRightPosX + movePosxRight[8], w = 0, a = 0}
					}
				})
			end
		end
	end
	return parts
end

return {
	load = load
}