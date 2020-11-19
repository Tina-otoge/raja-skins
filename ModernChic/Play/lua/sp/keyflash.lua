--[[
	キー画像と対応するキーフラッシュを配置
--]]
local function load(playsidePositionX, information)
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
		local flashTimer = information.timer
		local flashPosX = information.keyflashPosX
		local flashPosY = {whitePosY, blackPosY, whitePosY, blackPosY, whitePosY, blackPosY, whitePosY}
		local scratchflashPosX = information.scratchflashPosX
		
		if is_left_scratch() then
			-- キー部分
			table.insert(parts.destination,	{
				id = "keyframe1P", dst = {
					{x = playsidePositionX + 1, y = 110, w = 520, h = 110},
				}
			})
		elseif is_right_scratch() then
			-- キー部分
			table.insert(parts.destination,	{
				id = "keyframe2P", dst = {
					{x = playsidePositionX + 1, y = 110, w = 520, h = 110},
				}
			})
		end
		-- キーフラッシュ配置（鍵盤）
		for i = 1, information.num, 1 do
			table.insert(parts.destination,	{
				id = "keyflash_n", timer = flashTimer[i], blend = blendType, dst = {
					{x = playsidePositionX + flashPosX[i], y = flashPosY[i], w = keyflashNormalWidth, h = keyflashNormalHeight},
				}
			})
		end
		-- キーフラッシュ配置（皿）
		table.insert(parts.destination,	{
			id = "keyflash_s", timer = 100, blend = blendType, dst = {
				{x = playsidePositionX + scratchflashPosX, y = 106, w = keyflashScratchWidth, h = keyflashScratchHeight},
			}
		})
	end
	return parts
end

return {
	load = load
}