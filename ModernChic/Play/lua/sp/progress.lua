--[[
	進捗バー
	timer 140: TIMER_RHYTHM
	timer 40: READY
	
	op 80: ロード中
	op 81: ロード完了
	op 2245: POOR_EXIST
	op 2244: BAD_EXIST
	op 2243: GOOD_EXIST
--]]

local function load(progressbarPositionX)
	local parts = {}
	
	parts.image = {
		{id = "progress_frame", src = 1, x = 1880, y = 0, w = 16, h = 807},
	}
	
	parts.slider = {
		{id = "progress", src = 10, x = 0, y = 0, w = 24, h = 37, angle = 2, range = 773, type = 6},
	}
	
	parts.destination = {
		-- フレーム部
		{id = "progress_frame", dst = {
			{x = progressbarPositionX, y = 247, w = 16, h = 807},
		}},
		-- スタート処理（下から上に）
		{id = "progress", loop = 1500, op = {80, -2245, -2244, -2243}, dst = {
			{time = 0, x = progressbarPositionX - 4, y = 247, w = 24, h = 37, a = 0, acc = 2},
			{time = 500},
			{time = 1500, y = 1020, a = 255}
		}},
		
		-- パーフェクト状態(ロード完了→スタート)
		{id = "progress",timer = 40, loop = -1, op = {81, -2245, -2244, -2243}, dst = {
			{time = 0, x = progressbarPositionX - 4, y = 1020, w = 24, h = 37},
			{time = 1200}
		}},		
		-- パーフェクト状態
		{id = "progress", op = {81, -2245, -2244, -2243}, dst = {
			{x = progressbarPositionX - 4, y = 1020, w = 24, h = 37}
		}},
		-- フルコンボ状態
		-- timer:140 RHYHM（1000を一拍とする）
		{id = "progress", timer = 140, op = {81, -2245, -2244, 2243}, dst = {
			{time = 0, x = progressbarPositionX - 4, y = 1020, w = 24, h = 37},
			{time = 1000, a = 120}
		}},
		-- 通常
		{id = "progress", timer = 140, op = {81, 2245, -2244}, dst = {
			{time = 0, x = progressbarPositionX - 4, y = 1020, w = 24, h = 37},
			{time = 1000, a = 100}
		}},
		-- 通常
		{id = "progress", timer = 140, op = {81, 2244}, dst = {
			{time = 0, x = progressbarPositionX - 4, y = 1020, w = 24, h = 37},
			{time = 1000, a = 100}
		}},
	}
	
	return parts
end

return {
	load = load
}