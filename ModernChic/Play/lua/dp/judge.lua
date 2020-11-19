--[[
	判定文字とコンボ数
	judgeを正しく設定しないとtimer46,47の動作に影響する
--]]

local function load(laneLeftPosX, laneRightPosX, notesPositionY)

	-- コンボ表示時間
	local judgefontLooptime = 500
	local judgecomboLooptime = 500
	
	-- 判定表示位置
	local judgefont_position_y = notesPositionY + 153

	local parts = {}
	
	parts.image = {
		-- 判定文字
		{id = "judgef-pg", src = 4, x = 0, y = 0, w = 227, h = 252, divy = 3, cycle = 120},
		{id = "judgef-gr", src = 4, x = 0, y = 252, w = 227, h = 168, divy = 2, cycle = 80},
		{id = "judgef-gd", src = 4, x = 0, y = 420, w = 227, h = 168, divy = 2, cycle = 80},
		{id = "judgef-bd", src = 4, x = 227, y = 420, w = 227, h = 168, divy = 2, cycle = 80},
		{id = "judgef-pr", src = 4, x = 454, y = 420, w = 227, h = 168, divy = 2, cycle = 80},
		{id = "judgef-ms", src = 4, x = 454, y = 420, w = 227, h = 168, divy = 2, cycle = 80},
	}
	
	parts.value = {
		-- コンボ数（判定用）
		{id = "judgen-pg", src = 4, x = 227, y = 0, w = 550, h = 252, divx = 10, divy = 3, digit = 6, ref = 75, cycle = 120},
		{id = "judgen-gr", src = 4, x = 227, y = 252, w = 550, h = 168, divx = 10, divy = 2, digit = 6, ref = 75, cycle = 80},
		{id = "judgen-gd", src = 4, x = 227, y = 252, w = 550, h = 168, divx = 10, divy = 2, digit = 6, ref = 75, cycle = 80},
		{id = "judgen-bd", src = 4, x = 227, y = 252, w = 550, h = 168, divx = 10, divy = 2, digit = 6, ref = 75, cycle = 80},
		{id = "judgen-pr", src = 4, x = 227, y = 252, w = 550, h = 168, divx = 10, divy = 2, digit = 6, ref = 75, cycle = 80},
		{id = "judgen-ms", src = 4, x = 227, y = 252, w = 550, h = 168, divx = 10, divy = 2, digit = 6, ref = 75, cycle = 80},
	}
	
	-- offset 3: LIFT
	-- offset 32: JUDGE_1P
	parts.judge = {
		-- 1P
		{
			id = 2010,
			index = 0,
			images = {
				{id = "judgef-pg", loop = -1, timer = 46, offsets = {3,32}, dst = {
					{time = 0, x = laneLeftPosX + 130, y = judgefont_position_y, w = 227, h = 84},
					{time = judgefontLooptime}
				}},
				{id = "judgef-gr", loop = -1, timer = 46, offsets = {3,32}, dst = {
					{time = 0, x = laneLeftPosX + 130, y = judgefont_position_y, w = 227, h = 84},
					{time = judgefontLooptime}
				}},
				{id = "judgef-gd", loop = -1, timer = 46, offsets = {3,32}, dst = {
					{time = 0, x = laneLeftPosX + 130, y = judgefont_position_y, w = 227, h = 84},
					{time = judgefontLooptime}
				}},
				{id = "judgef-bd", loop = -1, timer = 46, offsets = {3,32}, dst = {
					{time = 0, x = laneLeftPosX + 130, y = judgefont_position_y, w = 227, h = 84},
					{time = judgefontLooptime}
				}},
				{id = "judgef-pr", loop = -1, timer = 46, offsets = {3,32}, dst = {
					{time = 0, x = laneLeftPosX + 130, y = judgefont_position_y, w = 227, h = 84},
					{time = judgefontLooptime}
				}},
				{id = "judgef-ms", loop = -1, timer = 46, offsets = {3,32}, dst = {
					{time = 0, x = laneLeftPosX + 130, y = judgefont_position_y, w = 227, h = 84},
					{time = judgefontLooptime}
				}}
			},
			-- コンボ数のx,yは判定文字からの相対距離を指定
			numbers = {
				{id = "judgen-pg", loop = -1, offset = 32, timer = 46, dst = {
					{time = 0, x = 237, y = 0, w = 55, h = 84},
					{time = judgecomboLooptime}
				}},
				{id = "judgen-gr", loop = -1, offset = 32, timer = 46, dst = {
					{time = 0, x = 237, y = 0, w = 55, h = 84},
					{time = judgecomboLooptime}
				}},
				{id = "judgen-gd", loop = -1, offset = 32, timer = 46, dst = {
					{time = 0, x = 237, y = 0, w = 55, h = 84},
					{time = judgecomboLooptime}
				}},
				{id = "judgen-bd", loop = -1, offset = 32, timer = 46, dst = {
					{time = 0, x = 237, y = 0, w = 55, h = 84},
					{time = judgecomboLooptime}
				}},
				{id = "judgen-pr", loop = -1, offset = 32, timer = 46, dst = {
					{time = 0, x = 237, y = 0, w = 55, h = 84},
					{time = judgecomboLooptime}
				}},
				{id = "judgen-ms", loop = -1, offset = 32, timer = 46, dst = {
					{time = 0, x = 237, y = 0, w = 55, h = 84},
					{time = judgecomboLooptime}
				}}
			},
			-- judgeとcomboを合わせて一つの定義とするか。二段に分ける場合はfalse
			shift = true
		},
		-- 2P
		{
			id = 2011,
			index = 1,
			images = {
				{id = "judgef-pg", loop = -1, timer = 47, offsets = {3,32}, dst = {
					{time = 0, x = laneRightPosX + 130, y = judgefont_position_y, w = 227, h = 84},
					{time = judgefontLooptime}
				}},
				{id = "judgef-gr", loop = -1, timer = 47, offsets = {3,32}, dst = {
					{time = 0, x = laneRightPosX + 130, y = judgefont_position_y, w = 227, h = 84},
					{time = judgefontLooptime}
				}},
				{id = "judgef-gd", loop = -1, timer = 47, offsets = {3,32}, dst = {
					{time = 0, x = laneRightPosX + 130, y = judgefont_position_y, w = 227, h = 84},
					{time = judgefontLooptime}
				}},
				{id = "judgef-bd", loop = -1, timer = 47, offsets = {3,32}, dst = {
					{time = 0, x = laneRightPosX + 130, y = judgefont_position_y, w = 227, h = 84},
					{time = judgefontLooptime}
				}},
				{id = "judgef-pr", loop = -1, timer = 47, offsets = {3,32}, dst = {
					{time = 0, x = laneRightPosX + 130, y = judgefont_position_y, w = 227, h = 84},
					{time = judgefontLooptime}
				}},
				{id = "judgef-ms", loop = -1, timer = 47, offsets = {3,32}, dst = {
					{time = 0, x = laneRightPosX + 130, y = judgefont_position_y, w = 227, h = 84},
					{time = judgefontLooptime}
				}}
			},
			-- コンボ数のx,yは判定文字からの相対距離を指定
			numbers = {
				{id = "judgen-pg", loop = -1, offset = 32, timer = 47, dst = {
					{time = 0, x = 237, y = 0, w = 55, h = 84},
					{time = judgecomboLooptime}
				}},
				{id = "judgen-gr", loop = -1, offset = 32, timer = 47, dst = {
					{time = 0, x = 237, y = 0, w = 55, h = 84},
					{time = judgecomboLooptime}
				}},
				{id = "judgen-gd", loop = -1, offset = 32, timer = 47, dst = {
					{time = 0, x = 237, y = 0, w = 55, h = 84},
					{time = judgecomboLooptime}
				}},
				{id = "judgen-bd", loop = -1, offset = 32, timer = 47, dst = {
					{time = 0, x = 237, y = 0, w = 55, h = 84},
					{time = judgecomboLooptime}
				}},
				{id = "judgen-pr", loop = -1, offset = 32, timer = 47, dst = {
					{time = 0, x = 237, y = 0, w = 55, h = 84},
					{time = judgecomboLooptime}
				}},
				{id = "judgen-ms", loop = -1, offset = 32, timer = 47, dst = {
					{time = 0, x = 237, y = 0, w = 55, h = 84},
					{time = judgecomboLooptime}
				}}
			},
			-- judgeとcomboを合わせて一つの定義とするか。二段に分ける場合はfalse
			shift = true
		}
	}
	
	parts.destination = {
		-- 判定
		{id = 2010},
		{id = 2011},
	}
	
	return parts
end

return {
	load = load
}