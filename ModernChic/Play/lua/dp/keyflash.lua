--[[
	キー画像と対応するキーフラッシュを配置
--]]
local function load(laneLeftPosX, laneRightPosX, information)
	local parts = {}
	
	local keyflashNormalWidth = 67
	local keyflashNormalHeight = 73
	local keyflashScratchWidth = 108
	local keyflashScratchHeight = 110
	local blendType = 2
	local whitePosY = 134
	local blackPosY = 144
	
	parts.image = {
		-- キー部分
		{id = "keyframe1P", src = 15, x = 0, y = 0, w = 520, h = 110},
		{id = "keyframe2P", src = 15, x = 0, y = 110, w = 520, h = 110},
		-- キーフラッシュ
		{id = "keyflash_n", src = 16, x = 5, y = 19, w = keyflashNormalWidth, h = keyflashNormalHeight},
		{id = "keyflash_s", src = 16, x = 74, y = 3, w = keyflashScratchWidth, h = keyflashScratchHeight},
	}
	
	parts.destination = {}
	
	do
		local flashLeftTimer = information.flashLeftTimer
		local flashRightTimer = information.flashRightTimer

		local flashLeftPosX = information.flashLeftPosX
		local flashRightPosX = information.flashRightPosX

		local flashLeftPosY = {whitePosY, blackPosY, whitePosY, blackPosY, whitePosY, blackPosY, whitePosY}
		local flashRightPosY = {whitePosY, blackPosY, whitePosY, blackPosY, whitePosY, blackPosY, whitePosY}

		local scratchflashPosX = {5, 410}
		
		-- キー部分
		table.insert(parts.destination,	{
			id = "keyframe1P", dst = {
				{x = laneLeftPosX, y = 110, w = 520, h = 110},
			}
		})
		-- キー部分
		table.insert(parts.destination,	{
			id = "keyframe2P", dst = {
				{x = laneRightPosX, y = 110, w = 520, h = 110},
			}
		})

		-- キーフラッシュ配置（鍵盤）
		for i = 1, information.num, 1 do
			-- 左
			table.insert(parts.destination,	{
				id = "keyflash_n", timer = flashLeftTimer[i], blend = blendType, dst = {
					{x = laneLeftPosX + flashLeftPosX[i], y = flashLeftPosY[i], w = keyflashNormalWidth, h = keyflashNormalHeight},
				}
			})
			-- 右
			table.insert(parts.destination,	{
				id = "keyflash_n", timer = flashRightTimer[i], blend = blendType, dst = {
					{x = laneRightPosX + flashRightPosX[i], y = flashRightPosY[i], w = keyflashNormalWidth, h = keyflashNormalHeight},
				}
			})
		end

		-- キーフラッシュ配置（皿）
		table.insert(parts.destination,	{
			id = "keyflash_s", timer = 100, blend = blendType, dst = {
				{x = laneLeftPosX + scratchflashPosX[1], y = 106, w = keyflashScratchWidth, h = keyflashScratchHeight},
			}
		})
		table.insert(parts.destination,	{
			id = "keyflash_s", timer = 110, blend = blendType, dst = {
				{x = laneRightPosX + scratchflashPosX[2], y = 106, w = keyflashScratchWidth, h = keyflashScratchHeight},
			}
		})
	end
	return parts
end

return {
	load = load
}