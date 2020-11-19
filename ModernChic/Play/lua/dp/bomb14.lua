--[[
	爆発エフェクト
]]
local function isModernChicBomb()
	return skin_config.option["ボムの種類"] == 923
end
local function isOADXBomb()
	return skin_config.option["ボムの種類"] == 924
end
local function isJudgeTimingBombOff()
	return skin_config.option["判定タイミングボムの使用"] == 920
end
local function isJudgeTimingBombOn()
	return skin_config.option["判定タイミングボムの使用"] == 921
end

local function offsetBombSize(width, height, adjustPosY)
	local magnification = skin_config.offset["ボムの大きさ 1~100%（0以下は100%になります）"].w
	if magnification < 1 or magnification > 100 then
		return width, height, adjustPosY
	else
		width = width * (magnification / 100)
		height = height * (magnification / 100)
		adjustPosY = adjustPosY * (magnification / 100)
		return width, height, adjustPosY
	end
end

local function load(laneLeftPosX, laneRightPosX, notesPositionY)

	local bombCycle = 251
	local lnbombCycle = 160

	local parts = {}
	
	parts.image = {}
	do
		local init = {"sl", "1", "2", "3", "4", "5", "6", "7", "sr", "8", "9", "10", "11", "12", "13", "14"}
		local bombTimer = {50, 51, 52, 53, 54, 55, 56, 57, 60, 61, 62, 63, 64, 65, 66, 67}
		local lnBombTimer = {70, 71, 72, 73, 74, 75, 76, 77, 80, 81, 82, 83, 84, 85, 86, 87}
		local modernchicLnPosY = {}
		local oadxLnPosY = {}

		-- 判定ボムを使う場合はLNボム色を同じものにする
		if isJudgeTimingBombOff() then
			modernchicLnPosY = {900, 300, 600, 300, 600, 300, 600, 300, 900, 300, 600, 300, 600, 300, 600, 300}
			oadxLnPosY = {576, 192, 384, 192, 384, 192, 384, 192, 576, 192, 384, 192, 384, 192, 384, 192}
		elseif isJudgeTimingBombOn() then
			modernchicLnPosY = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
			oadxLnPosY = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
		end

		if isModernChicBomb() then
			-- ModernChic規格ボム・通常
			table.insert(parts.image, {
				id = "bomb", src = 11, x = 0, y = 0, w = -1, h = -1
			})
			for i = 1, 16, 1 do
				table.insert(parts.image, {
					id = "bomb-"..init[i], src = 11, x = 0, y = 0, w = 6400, h = 300, divx = 16, divy = 1, cycle = bombCycle, timer = bombTimer[i]
				})
			end
			-- ModernChic規格ボム・LN
			table.insert(parts.image, {
				id = "lnbomb", src = 11, x = 0, y = 0, w = -1, h = -1
			})
			for i = 1, 16, 1 do
				table.insert(parts.image, {
					id = "lnbomb-"..init[i], src = 11, x = 0, y = modernchicLnPosY[i], w = 3200, h = 300, divx = 8, divy = 1, cycle = lnbombCycle, timer = lnBombTimer[i]
				})
			end
			-- ModernChic規格ボム・SLOW
			for i = 1, 16, 1 do
				table.insert(parts.image, {
					id = "slowbomb-"..init[i], src = 11, x = 0, y = 300, w = 6400, h = 300, divx = 16, divy = 1, cycle = bombCycle, timer = bombTimer[i]
				})
			end
			-- ModernChic規格ボム・FAST
			for i = 1, 16, 1 do
				table.insert(parts.image, {
					id = "fastbomb-"..init[i], src = 11, x = 0, y = 600, w = 6400, h = 300, divx = 16, divy = 1, cycle = bombCycle, timer = bombTimer[i]
				})
			end
		elseif isOADXBomb() then
			-- OADX規格ボム・通常
			table.insert(parts.image, {
				id = "bomb", src = 28, x = 0, y = 0, w = -1, h = -1
			})
			for i = 1, 16, 1 do
				table.insert(parts.image, {
					id = "bomb-"..init[i], src = 28, x = 0, y = 0, w = 2896, h = 192, divx = 16, divy = 1, cycle = bombCycle, timer = bombTimer[i]
				})
			end
			-- OADX規格ボム・LN
			table.insert(parts.image, {
				id = "lnbomb", src = 28, x = 0, y = 0, w = -1, h = -1
			})
			for i = 1, 16, 1 do
				table.insert(parts.image, {
					id = "lnbomb-"..init[i], src = 28, x = 0, y = oadxLnPosY[i], w = 1448, h = 192, divx = 8, divy = 1, cycle = lnbombCycle, timer = lnBombTimer[i]
				})
			end
			-- OADX規格ボム・SLOW
			for i = 1, 16, 1 do
				table.insert(parts.image, {
					id = "slowbomb-"..init[i], src = 28, x = 0, y = 192, w = 2896, h = 192, divx = 16, divy = 1, cycle = bombCycle, timer = bombTimer[i]
				})
			end
			-- OADX規格ボム・FAST
			for i = 1, 16, 1 do
				table.insert(parts.image, {
					id = "fastbomb-"..init[i], src = 28, x = 0, y = 384, w = 2896, h = 192, divx = 16, divy = 1, cycle = bombCycle, timer = bombTimer[i]
				})
			end
		end
	end
	
	parts.destination = {}
	-- ボム先読み
	table.insert(parts.destination,{
		id = "bomb", dst = {
			{x = 0, y = 0, w = 1, h = 1},
		}
	})
	table.insert(parts.destination,{
		id = "lnbomb", dst = {
			{x = 0, y = 0, w = 1, h = 1},
		}
	})
	
	-- 爆発エフェクト
	do
		local initLeft = {"1", "2", "3", "4", "5", "6", "7", "sl"}
		local initRight = {"8", "9", "10", "11", "12", "13", "14", "sr"}
		-- 通常ボムタイマ
		local normalTimerLeft = {51, 52, 53, 54, 55, 56, 57, 50}
		local normalTimerRight = {61, 62, 63, 64, 65, 66, 67, 60}
		-- LN用ボムタイマ
		local lnTimerLeft = {71, 72, 73, 74, 75, 76, 77, 70}
		local lnTimerRight = {81, 82, 83, 84, 85, 86, 87, 80}

		local leftPostionX = {}
		local rightPostionX = {}
		
		local bombWidth
		local bombHeight
		local adjustPosY
		
		if isModernChicBomb() then
			-- ボムの大きさ調整
			bombWidth, bombHeight, adjustPosY = offsetBombSize(400, 300, 0)
			-- ボム中心点
			leftPostionX = {142, 197, 257, 312, 372, 427, 487, 55}
			rightPostionX = {30, 85, 144, 200, 260, 315, 375, 459}
		elseif isOADXBomb() then
			-- ボムの大きさ調整
			bombWidth, bombHeight, adjustPosY = offsetBombSize(376, 300, 18)
			-- ボム中心点
			leftPostionX = {167, 222, 282, 337, 397, 452, 512, 80}
			rightPostionX = {55, 110, 169, 225, 285, 340, 400, 484}
		end
		
		-- 通常爆発エフェクトの配置
		if isJudgeTimingBombOff() then
			for i = 1, 8, 1 do
				-- 左 bomb-1 ~ bomb-sl
				table.insert(parts.destination, {
					id = "bomb-"..initLeft[i], offset = 3, loop = -1, filter = 1, timer = normalTimerLeft[i], blend = 2, dst = {
						{time = 0, x = laneLeftPosX + leftPostionX[i] - bombWidth / 2, y = notesPositionY - adjustPosY - (bombHeight / 2), w = bombWidth, h = bombHeight},
						{time = bombCycle - 1}
					}
				})
				-- 右 bomb-8 ~ bomb-sr
				table.insert(parts.destination, {
					id = "bomb-"..initRight[i], offset = 3, loop = -1, filter = 1, timer = normalTimerRight[i], blend = 2, dst = {
						{time = 0, x = laneRightPosX + rightPostionX[i] - bombWidth / 2, y = notesPositionY - adjustPosY - (bombHeight / 2), w = bombWidth, h = bombHeight},
						{time = bombCycle - 1}
					}
				})
			end
		elseif isJudgeTimingBombOn() then
			-- 通常ボム
			for i = 1, 8, 1 do
				-- 左 bomb-1 ~ bomb-sl
				table.insert(parts.destination, {
					id = "bomb-"..initLeft[i], offset = 3, loop = -1, filter = 1, timer = normalTimerLeft[i], blend = 2, op = {-1242, -1243}, dst = {
						{time = 0, x = laneLeftPosX + leftPostionX[i] - bombWidth / 2, y = notesPositionY - adjustPosY - (bombHeight / 2), w = bombWidth, h = bombHeight},
						{time = bombCycle - 1}
					}
				})
				-- 右 bomb-8 ~ bomb-sr
				table.insert(parts.destination, {
					id = "bomb-"..initRight[i], offset = 3, loop = -1, filter = 1, timer = normalTimerRight[i], blend = 2, op = {-1262, - 1263}, dst = {
						{time = 0, x = laneRightPosX + rightPostionX[i] - bombWidth / 2, y = notesPositionY - adjustPosY - (bombHeight / 2), w = bombWidth, h = bombHeight},
						{time = bombCycle - 1}
					}
				})
			end
			-- op1242:OPTION_1P_FAST
			for i = 1, 8, 1 do
				-- 左 fastbomb-1 ~ fastbomb-sl
				table.insert(parts.destination, {
					id = "fastbomb-"..initLeft[i], offset = 3, loop = -1, filter = 1, timer = normalTimerLeft[i], blend = 2, op = {1242}, dst = {
						{time = 0, x = laneLeftPosX + leftPostionX[i] - bombWidth / 2, y = notesPositionY - adjustPosY - (bombHeight / 2), w = bombWidth, h = bombHeight},
						{time = bombCycle - 1}
					}
				})
				-- 右 fastbomb-8 ~ fastbomb-sr
				table.insert(parts.destination, {
					id = "fastbomb-"..initRight[i], offset = 3, loop = -1, filter = 1, timer = normalTimerRight[i], blend = 2, op = {1262}, dst = {
						{time = 0, x = laneRightPosX + rightPostionX[i] - bombWidth / 2, y = notesPositionY - adjustPosY - (bombHeight / 2), w = bombWidth, h = bombHeight},
						{time = bombCycle - 1}
					}
				})
			end
			-- op1243:OPTION_1P_LATE
			for i = 1, 8, 1 do
				-- 左 slowbomb-1 ~ slowbomb-sl
				table.insert(parts.destination, {
					id = "slowbomb-"..initLeft[i], offset = 3, loop = -1, filter = 1, timer = normalTimerLeft[i], blend = 2, op = {1243}, dst = {
						{time = 0, x = laneLeftPosX + leftPostionX[i] - bombWidth / 2, y = notesPositionY - adjustPosY - (bombHeight / 2), w = bombWidth, h = bombHeight},
						{time = bombCycle - 1}
					}
				})
				-- 右 slowbomb-8 ~ slowbomb-sr
				table.insert(parts.destination, {
					id = "slowbomb-"..initRight[i], offset = 3, loop = -1, filter = 1, timer = normalTimerRight[i], blend = 2, op = {1263}, dst = {
						{time = 0, x = laneRightPosX + rightPostionX[i] - bombWidth / 2, y = notesPositionY - adjustPosY - (bombHeight / 2), w = bombWidth, h = bombHeight},
						{time = bombCycle - 1}
					}
				})
			end
		end
		-- LN爆発エフェクトの配置
		for i = 1, 8, 1 do
			-- 左 lnbomb-1 ~ lnbomb-sl
			table.insert(parts.destination,	{
				id = "lnbomb-"..initLeft[i], offset = 3, filter = 1, timer = lnTimerLeft[i], blend = 2, dst = {
					{time = 0, x = laneLeftPosX + leftPostionX[i] - bombWidth / 2, y = notesPositionY - adjustPosY - (bombHeight / 2), w = bombWidth, h = bombHeight},
					{time = lnbombCycle - 1}
				}
			})
			-- 右 lnbomb-8 ~ lnbomb-sr
			table.insert(parts.destination,	{
				id = "lnbomb-"..initRight[i], offset = 3, filter = 1, timer = lnTimerRight[i], blend = 2, dst = {
					{time = 0, x = laneRightPosX + rightPostionX[i] - bombWidth / 2, y = notesPositionY - adjustPosY - (bombHeight / 2), w = bombWidth, h = bombHeight},
					{time = lnbombCycle - 1}
				}
			})
		end
	end
	
	return parts
end

return {
	load = load
}