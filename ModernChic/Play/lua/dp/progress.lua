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

local function load()
	local parts = {}
	
	parts.image = {
		{id = "progress_frame", src = 1, x = 10, y = 20, w = 16, h = 807},
	}
	
	parts.slider = {
		{id = "progress", src = 10, x = 0, y = 0, w = 24, h = 37, angle = 2, range = 773, type = 6},
		{id = "progress2", src = 10, x = 0, y = 0, w = 24, h = 37, angle = 1, range = 486, type = 6},
	}
	
	parts.destination = {}

	-- 縦プログレスの配置
	local posx = {350, 1554}
	for i = 1, 2, 1 do
		table.insert(parts.destination, {
			-- フレーム部
			id = "progress_frame", dst = {
				{x = posx[i], y = 247, w = 16, h = 807},
			}
		})
		table.insert(parts.destination, {
			-- スタート処理（下から上に）
			id = "progress", loop = 1500, op = {80, -2245, -2244, -2243}, dst = {
				{time = 0, x = posx[i] - 4, y = 247, w = 24, h = 37, a = 0, acc = 2},
				{time = 500},
				{time = 1500, y = 1020, a = 255}
			}
		})
		table.insert(parts.destination, {
			-- パーフェクト状態(ロード完了→スタート)
			id = "progress",timer = 40, loop = -1, op = {81, -2245, -2244, -2243}, dst = {
				{time = 0, x = posx[i] - 4, y = 1020, w = 24, h = 37},
				{time = 1200}
			}
		})
		table.insert(parts.destination, {
			-- パーフェクト状態
			id = "progress", op = {81, -2245, -2244, -2243}, dst = {
				{x = posx[i] - 4, y = 1020, w = 24, h = 37}
			}
		})
		table.insert(parts.destination, {
			-- フルコンボ状態
			-- timer:140 RHYHM（1000を一拍とする）
			id = "progress", timer = 140, op = {81, -2245, -2244, 2243}, dst = {
				{time = 0, x = posx[i] - 4, y = 1020, w = 24, h = 37},
				{time = 1000, a = 120}
			}
		})
		table.insert(parts.destination, {
			-- 通常
			id = "progress", timer = 140, op = {81, 2245, -2244}, dst = {
				{time = 0, x = posx[i] - 4, y = 1020, w = 24, h = 37},
				{time = 1000, a = 100}
			}
		})
		table.insert(parts.destination, {
			-- 通常
			id = "progress", timer = 140, op = {81, 2244}, dst = {
				{time = 0, x = posx[i] - 4, y = 1020, w = 24, h = 37},
				{time = 1000, a = 100}
			}
		})
	end

	-- 横プログレス
	table.insert(parts.destination, {
		-- スタート処理（下から上に）
		id = "progress2", loop = 1500, op = {80, -2245, -2244, -2243}, dst = {
			{time = 0, x = 1186, y = 148, w = 24, h = 37, a = 0, acc = 2},
			{time = 500},
			{time = 1500, x = 700, a = 255}
		}
	})
	table.insert(parts.destination, {
		-- パーフェクト状態(ロード完了→スタート)
		id = "progress2",timer = 40, loop = -1, op = {81, -2245, -2244, -2243}, dst = {
			{time = 0, x = 700, y = 148, w = 24, h = 37},
			{time = 1200}
		}
	})
	table.insert(parts.destination, {
		id = "progress2", timer = 140, dst = {
			{time = 0, x = 700, y = 148, w = 24, h = 37},
			{time = 1000, a = 100}
		}
	})

	return parts
end

return {
	load = load
}