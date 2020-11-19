--[[
	爆発エフェクト
]]
local function isModernChicBomb()
	return skin_config.option["ボムの種類"] == 906
end
local function isOADXBomb()
	return skin_config.option["ボムの種類"] == 907
end
local function isJudgeTimingBombOff()
	return skin_config.option["判定タイミングボムの使用"] == 908
end
local function isJudgeTimingBombOn()
	return skin_config.option["判定タイミングボムの使用"] == 909
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

local function load(playsidePositionX, notesPositionY)

	local bombCycle = 251
	local lnbombCycle = 160

	local parts = {}
	
	parts.image = {}
	do
		local init = {"s", "1", "2", "3", "4", "5"}
		local bombTimer = {50, 51, 52, 53, 54, 55}
		local lnBombTimer = {70, 71, 72, 73, 74, 75}
		local modernchicLnPosY = {}
		local oadxLnPosY = {}
		-- 判定ボムを使う場合はLNボム色を同じものにする
		if isJudgeTimingBombOff() then
			modernchicLnPosY = {900, 300, 600, 300, 600, 300}
			oadxLnPosY = {576, 192, 384, 192, 384, 192}
		elseif isJudgeTimingBombOn() then
			modernchicLnPosY = {0, 0, 0, 0, 0, 0}
			oadxLnPosY = {0, 0, 0, 0, 0, 0}
		end
		if isModernChicBomb() then
			-- ModernChic規格ボム・通常
			table.insert(parts.image, {
				id = "bomb", src = 11, x = 0, y = 0, w = -1, h = -1
			})
			for i = 1, 6, 1 do
				table.insert(parts.image, {
					id = "bomb-"..init[i], src = 11, x = 0, y = 0, w = 6400, h = 300, divx = 16, divy = 1, cycle = bombCycle, timer = bombTimer[i]
				})
			end
			-- ModernChic規格ボム・LN
			table.insert(parts.image, {
				id = "lnbomb", src = 11, x = 0, y = 0, w = -1, h = -1
			})
			for i = 1, 6, 1 do
				table.insert(parts.image, {
					id = "lnbomb-"..init[i], src = 11, x = 0, y = modernchicLnPosY[i], w = 3200, h = 300, divx = 8, divy = 1, cycle = lnbombCycle, timer = lnBombTimer[i]
				})
			end
			-- ModernChic規格ボム・SLOW
			for i = 1, 6, 1 do
				table.insert(parts.image, {
					id = "slowbomb-"..init[i], src = 11, x = 0, y = 300, w = 6400, h = 300, divx = 16, divy = 1, cycle = bombCycle, timer = bombTimer[i]
				})
			end
			-- ModernChic規格ボム・FAST
			for i = 1, 6, 1 do
				table.insert(parts.image, {
					id = "fastbomb-"..init[i], src = 11, x = 0, y = 600, w = 6400, h = 300, divx = 16, divy = 1, cycle = bombCycle, timer = bombTimer[i]
				})
			end
		elseif isOADXBomb() then
			-- OADX規格ボム・通常
			table.insert(parts.image, {
				id = "bomb", src = 28, x = 0, y = 0, w = -1, h = -1
			})
			for i = 1, 6, 1 do
				table.insert(parts.image, {
					id = "bomb-"..init[i], src = 28, x = 0, y = 0, w = 2896, h = 192, divx = 16, divy = 1, cycle = bombCycle, timer = bombTimer[i]
				})
			end
			-- OADX規格ボム・LN
			table.insert(parts.image, {
				id = "lnbomb", src = 28, x = 0, y = 0, w = -1, h = -1
			})
			for i = 1, 6, 1 do
				table.insert(parts.image, {
					id = "lnbomb-"..init[i], src = 28, x = 0, y = oadxLnPosY[i], w = 1448, h = 192, divx = 8, divy = 1, cycle = lnbombCycle, timer = lnBombTimer[i]
				})
			end
			-- OADX規格ボム・SLOW
			for i = 1, 6, 1 do
				table.insert(parts.image, {
					id = "slowbomb-"..init[i], src = 28, x = 0, y = 192, w = 2896, h = 192, divx = 16, divy = 1, cycle = bombCycle, timer = bombTimer[i]
				})
			end
			-- OADX規格ボム・FAST
			for i = 1, 6, 1 do
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
		local init = {"1", "2", "3", "4", "5", "s"}
		-- 通常ボムタイマ
		local n_timer = {51, 52, 53, 54, 55, 50}
		-- LN用ボムタイマ
		local ln_timer = {71, 72, 73, 74, 75, 70}
		local posX = {}
		
		local bombWidth
		local bombHeight
		local adjustPosY
		
		if isModernChicBomb() then
			-- ボムの大きさ調整
			bombWidth, bombHeight, adjustPosY = offsetBombSize(400, 300, 0)
			-- ボム中心点
			if is_left_scratch() then
				posX = {142, 197, 257, 312, 372, 55}
			elseif is_right_scratch() then
				posX = {144, 200, 260, 315, 375, 459}
			end
		elseif isOADXBomb() then
			-- ボムの大きさ調整
			bombWidth, bombHeight, adjustPosY = offsetBombSize(376, 300, 18)
			-- ボム中心点
			if is_left_scratch() then
				posX = {167, 222, 282, 337, 397, 80}
			elseif is_right_scratch() then
				posX = {169, 225, 285, 340, 400, 484}
			end
		end
		
		-- 通常爆発エフェクトの配置
		if isJudgeTimingBombOff() then
			for i = 1, 6, 1 do
				table.insert(parts.destination, {
					id = "bomb-"..init[i], offset = 3, loop = -1, filter = 1, timer = n_timer[i], blend = 2, dst = {
						{time = 0, x = playsidePositionX + posX[i] - bombWidth / 2, y = notesPositionY - adjustPosY - (bombHeight / 2), w = bombWidth, h = bombHeight},
						{time = bombCycle - 1}
					}
				})
			end
		elseif isJudgeTimingBombOn() then
			-- 通常ボム
			for i = 1, 6, 1 do
				table.insert(parts.destination, {
					id = "bomb-"..init[i], offset = 3, loop = -1, filter = 1, timer = n_timer[i], blend = 2, op = {-1242, -1243}, dst = {
						{time = 0, x = playsidePositionX + posX[i] - bombWidth / 2, y = notesPositionY - adjustPosY - (bombHeight / 2), w = bombWidth, h = bombHeight},
						{time = bombCycle - 1}
					}
				})
			end
			-- op1242:OPTION_1P_FAST
			for i = 1, 6, 1 do
				table.insert(parts.destination, {
					id = "fastbomb-"..init[i], offset = 3, loop = -1, filter = 1, timer = n_timer[i], blend = 2, op = {1242}, dst = {
						{time = 0, x = playsidePositionX + posX[i] - bombWidth / 2, y = notesPositionY - adjustPosY - (bombHeight / 2), w = bombWidth, h = bombHeight},
						{time = bombCycle - 1}
					}
				})
			end
			-- op1243:OPTION_1P_LATE
			for i = 1, 6, 1 do
				table.insert(parts.destination, {
					id = "slowbomb-"..init[i], offset = 3, loop = -1, filter = 1, timer = n_timer[i], blend = 2, op = {1243}, dst = {
						{time = 0, x = playsidePositionX + posX[i] - bombWidth / 2, y = notesPositionY - adjustPosY - (bombHeight / 2), w = bombWidth, h = bombHeight},
						{time = bombCycle - 1}
					}
				})
			end
		end
		-- LN爆発エフェクトの配置
		for i = 1, 6, 1 do
			table.insert(parts.destination,	{
				id = "lnbomb-"..init[i], offset = 3, filter = 1, timer = ln_timer[i], blend = 2, dst = {
					{time = 0, x = playsidePositionX + posX[i] - bombWidth / 2, y = notesPositionY - adjustPosY - (bombHeight / 2), w = bombWidth, h = bombHeight},
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