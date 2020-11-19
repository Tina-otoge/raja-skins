--[[
	中央部情報
]]

local function isTimestampOn()
	return skin_config.option["タイムスタンプ"] == 921
end
local function isTimestampOff()
	return skin_config.option["タイムスタンプ"] == 920
end

local function load(positionX)
	local parts = {}
	
	parts.image = {
		-- 鍵盤数と難易度カテゴリ
		{id = "diffFrame", src = 6, x = 0, y = 320, w = 520, h = 60},
		-- 残りノート数フレーム
		{id = "remainNotesFrame", src = 6, x = 0, y = 600, w = 526, h = 126},
		-- タイムスタンプフレーム
		{id = "timestampFrame", src = 6, x = 0, y = 726, w = 526, h = 126},
	}

	do
		local word = "Player : " ..main_state.text(2)

		parts.text = {
			{id = "playerName", font = 0, size = 30, constantText = word, overflow = 1, align = 1, shadowOffsetX = 2, shadowOffsetY = 2},
			{id = "break1", font = 0, size = 30, constantText = " / ", overflow = 1, align = 1, shadowOffsetX = 2, shadowOffsetY = 2},
			{id = "break2", font = 0, size = 30, constantText = " : ", overflow = 1, align = 1, shadowOffsetX = 2, shadowOffsetY = 2},
		}
	end
	
	parts.value = {
		{id = "year", src = 4, x = 440, y = 348, w = 341, h = 36, divx = 11, digit = 4, ref = 21, align = 0},
		{id = "month", src = 4, x = 440, y = 348, w = 341, h = 36, divx = 11, digit = 2, ref = 22, align = 0},
		{id = "day", src = 4, x = 440, y = 348, w = 341, h = 36, divx = 11, digit = 2, ref = 23, align = 0},
		{id = "hour", src = 4, x = 440, y = 348, w = 341, h = 36, divx = 11, digit = 2, ref = 24, align = 0},
		{id = "min", src = 4, x = 440, y = 348, w = 341, h = 36, divx = 11, digit = 2, ref = 25, align = 0},
		{id = "sec", src = 4, x = 440, y = 348, w = 341, h = 36, divx = 11, digit = 2, ref = 26, align = 0},
	}

	-- あと○○ノート
	table.insert(parts.value, {
		id = "remainNotes", src = 4, x = 440, y = 276, w = 310, h = 36, divx = 10, digit = 5, align = 2, value = function()
			return main_state.number(74) - (main_state.number(110) + main_state.number(111) + main_state.number(112) + main_state.number(113) + main_state.number(114))
		end,
	})
	
	parts.destination = {}

	if isTimestampOn() then
		local posY = 950
		table.insert(parts.destination, {
			id = "timestampFrame", dst = {
				{x = positionX - 3, y = posY, w = 526, h = 126, a = 0},
			}
		})
		local width = 25
		local height = 27
		local posymd = posY + 75
		table.insert(parts.destination, {
			id = "year", dst = {
				{x = positionX + 120, y = posymd, w = width, h = height},
			}
		})
		table.insert(parts.destination, {
			id = "break1", op = {}, dst = {
				{x = positionX + 240, y = posymd, w = 27, h = 27},
			}
		})
		table.insert(parts.destination, {
			id = "month", dst = {
				{x = positionX + 260, y = posymd, w = width, h = height},
			}
		})
		table.insert(parts.destination, {
			id = "break1", dst = {
				{x = positionX + 330, y = posymd, w = 27, h = 27},
			}
		})
		table.insert(parts.destination, {
			id = "day", dst = {
				{x = positionX + 350, y = posymd, w = width, h = height},
			}
		})
		-- タイムスタンプ機能
		table.insert(parts.destination, {
			id = "playerName", dst = {
				{x = positionX + 520 / 2, y = posY + 20, w = 520, h = 30},
			}
		})
	end

	-- 閉店時は残りノート数を表示
	-- op91 : OPTION_RESULT_FAIL
	do
		local posY = 115
		table.insert(parts.destination, {
			id = "remainNotesFrame", draw = function()
				-- 途中で閉店したのかを判定する
				-- TODO 意図的に中断した時に表示されてしまう
				local totalNotes = main_state.number(74)
				local processNotes = main_state.number(110) + main_state.number(111) + main_state.number(112) + main_state.number(113) + main_state.number(114)
				return main_state.option(91) and totalNotes ~= processNotes
			end, dst = {
				{x = positionX - 3, y = posY, w = 526, h = 126},
			}
		})
		table.insert(parts.destination, {
			id = "remainNotes", draw = function()
				-- 途中で閉店したのかを判定する
				-- TODO 意図的に中断した時に表示されてしまう
				local totalNotes = main_state.number(74)
				local processNotes = main_state.number(110) + main_state.number(111) + main_state.number(112) + main_state.number(113) + main_state.number(114)
				return main_state.option(91) and totalNotes ~= processNotes
			end, dst = {
				{time = 0, x = positionX + 237, y = posY + 47, w = 30, h = 36},
				{time = 500, a = 150},
				{time = 1000, a = 255}
			}
		})
	end

	-- モードと難易度カテゴリ
	table.insert(parts.destination, {
		id = "diffFrame", dst = {
			{x = positionX, y = 50, w = 520, h = 60},
		}
	})
	do
		-- モード
		local wd = {"5keys", "7keys", "10keys", "14keys", "9keys", "24keys", "48keys"}
		local op = {161, 160, 163, 162, 164, 1160, 1161}
		local posY = 40
		for i = 1, 7, 1 do
			table.insert(parts.image, {id = wd[i], src = 6, x = 0, y = posY, w = 190, h = 40})
			posY = posY + 40
		end
		for i = 1, 7, 1 do
			table.insert(parts.destination, {
				id = wd[i], op = {op[i]}, dst = {
					{x = positionX + 40, y = 58, w = 190, h = 40},
				}
			})
		end
	end
	do
		-- カテゴリくん
		local wd = {"unknown", "biginner", "normal", "hyper", "another", "insane"}
		local op = {150, 151, 152, 153, 154, 155}
		local posY = 0
		for i = 1, 6, 1 do
			table.insert(parts.image, {id = wd[i], src = 6, x = 190, y = posY, w = 250, h = 40})
			posY = posY + 40
		end
		for i = 1, 6, 1 do
			table.insert(parts.destination, {
				id = wd[i], op = {op[i]}, dst = {
					{x = positionX + 250, y = 58, w = 250, h = 40},
				}
			})
		end
	end
	
	return parts
end

return {
	load = load
}