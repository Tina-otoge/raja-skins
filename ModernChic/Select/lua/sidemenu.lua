--[[
	サイドメニュー
]]

local function load()
	local parts = {}

	local isMenuOpen = false
	local function menuSwitch()
		isMenuOpen = not isMenuOpen
	end

	-- 基準点
	local posX = 80
	local openTime = 200
	
	parts.image = {
		{id = "s_menu", src = 11, x = 0, y = 0, w = 930, h = 636},
		{id = "s_ramp", src = 11, x = 0, y = 640, w = 694, h = 603},
		{id = "s_rampName", src = 11, x = 700, y = 640, w = 245, h = 603},
		{id = "s_percentFrame", src = 11, x = 950, y = 640, w = 120, h = 603},
		{id = "s_selector", src = 11, x = 1000, y = 100, w = 70, h = 469},
	}

	-- ランプアイコン
	table.insert(parts.image, {
		id = "s_rampButtonOff", src = 11, x = 700, y = 1250, w = 62, h = 62, act = function()
			return menuSwitch()
		end,
	})
	table.insert(parts.image, {
		id = "s_rampButtonOn", src = 11, x = 762, y = 1250, w = 62, h = 62, act = function()
			return menuSwitch()
		end,
	})
	
	-- align:0,1,2 右、左、中央
	parts.value = {}
	parts.graph = {}

	-- カスタムタイマー
	local menuOpen = get_customTimer_id()
	local menuClose = get_customTimer_id()
	local graphStart = get_customTimer_id()
	parts.customTimers = {
		{id = menuOpen, timer = timer_util.timer_observe_boolean(function()
			return isMenuOpen
		end)},
		{id = menuClose, timer = timer_util.timer_observe_boolean(function()
			if isMenuOpen == true then
				return false
			elseif isMenuOpen == false then
				return true
			end
		end)},
		{id = graphStart, timer = timer_util.timer_observe_boolean(function()
			local success = main_state.timer(173)
			if success ~= main_state.timer_off_value and isMenuOpen == true then
				return true
			else
				return false
			end
		end)},
	}

	parts.destination = {}

	-- セレクターとボタン
	table.insert(parts.destination, {
		id = "s_selector", loop = 1500, dst = {
			{time = 1300, x = -72, y = 380, w = 70, h = 469, acc = 2},
			{time = 1500, x = -2}
		}
	})
	table.insert(parts.destination, {
		id = "s_rampButtonOff", timer = menuClose, dst = {
			{x = 2, y = 600, w = 62, h = 62},
		}
	})
	table.insert(parts.destination, {
		id = "s_rampButtonOn", timer = menuOpen, dst = {
			{x = 2, y = 600, w = 62, h = 62},
		}
	})

	-- フレーム
	table.insert(parts.destination, {
		id = "s_menu", loop = openTime, timer = menuOpen, dst = {
			{time = 0, x = -930, y = 228, w = 930, h = 636, acc = 2},
			{time = openTime, x = posX}
		}
	})
	table.insert(parts.destination, {
		id = "s_menu", loop = openTime, timer = menuClose, dst = {
			{time = 0, x = -posX, y = 228, w = 930, h = 636, acc = 2},
			{time = openTime, x = -930}
		}
	})
	table.insert(parts.destination, {
		id = "s_ramp", loop = openTime, timer = menuOpen, dst = {
			{time = openTime, x = posX + 200, y = 246, w = 694, h = 603},
		}
	})

	do
		-- 人数系
		local wd = {"max", "perfect", "fullcombo", "exHard", "hard", "normal", "easy", "assist", "lightAssist", "failed", "noPlay"}
		local ref = {224, 222, 218, 208, 216, 214, 212, 204, 206, 210, 202}
		-- 自身のクリア条件と一致するか
		local op = {1104, 1103, 105, 1102, 104, 103, 102, 1100, 1101, 101, 100}

		local posY = 805
		for i = 1, 11, 1 do
			table.insert(parts.value, {
				id = "s_" ..wd[i] .."num", src = 11, x = 1000, y = 0, w = 341, h = 36, divx = 11, digit = 5, ref = ref[i], align = 0
			})
		end
		for i = 1, 11, 1 do
			table.insert(parts.destination, {
				id = "s_" ..wd[i] .."num", loop = openTime, timer = menuOpen, draw = function()
					if main_state.option(op[i]) == true then
						return true
					else
						return false
					end
				end, dst = {
					{time = openTime, x = posX + 20, y = posY, w = 31, h = 36, r = 255, g = 161, b = 3},
				}
			})
			table.insert(parts.destination, {
				id = "s_" ..wd[i] .."num", loop = openTime, timer = menuOpen, draw = function()
					if main_state.option(op[i]) == false then
						return true
					else
						return false
					end
				end, dst = {
					{time = openTime, x = posX + 20, y = posY, w = 31, h = 36},
				}
			})
			posY = posY - 55
		end
	end

	do
		-- IR全体のクリア状況
		local graphLenght = 690
		local wd = {"max", "perfect", "fullcombo", "exhard", "hard", "normal", "easy", "assist", "lassist", "failed", "noplay"}
		local val = {225, 223, 219, 209, 217, 215, 213, 205, 207, 211, 203}
		local posY = 1250
		-- グラフバーの登録
		for i = 1, 11, 1 do
			table.insert(parts.graph, {
				id = "s_bar" ..wd[i], src = 11, x = 0, y = posY, w = graphLenght, h = 49, angle = 0, value = function()
					local rate = main_state.number(val[i])
					if rate == -2147483648 then
						return 0
					else
						-- 1は100％を表す
						return rate / 100
					end
				end
			})
			posY = posY + 49
		end
		-- グラフ描画
		-- IR読込中は表示させない
		local dstPosY = 798
		for i = 1, 11, 1 do
			table.insert(parts.destination, {
				id = "s_bar" ..wd[i], blend = 2, loop = 500, timer = graphStart, dst = {
					{time = openTime, x = posX + 202, y = dstPosY, w = 0, h = 49, acc = 2},
					{time = 500, w = 690}
				}
			})
			dstPosY = dstPosY - 55
		end
	end

	-- クリア状況
	table.insert(parts.destination, {
		id = "s_rampName", loop = openTime, timer = menuOpen, dst = {
			{time = openTime, x = posX + 400, y = 246, w = 245, h = 603},
		}
	})
	table.insert(parts.destination, {
		id = "s_percentFrame", loop = openTime, timer = menuOpen, dst = {
			{time = openTime, x = posX + 773, y = 246, w = 120, h = 603},
		}
	})
	
	do
		-- 自身のクリア条件と一致するか
		local op = {1104, 1103, 105, 1102, 104, 103, 102, 1100, 1101, 101, 100}
		do
			-- レート系
			local wd = {"max", "perfect", "fullcombo", "exHard", "hard", "normal", "easy", "assist", "lightAssist", "failed", "noPlay"}
			local ref = {225, 223, 219, 209, 217, 215, 213, 205, 207, 211, 203}
			for i = 1, 11, 1 do
				table.insert(parts.value, {
					id = "s_" ..wd[i] .."rate", src = 11, x = 1000, y = 0, w = 310, h = 36, divx = 10, digit = 3, ref = ref[i], align = 0
				})
			end
			local posY = 804
			for i = 1, 11, 1 do
				table.insert(parts.destination, {
					id = "s_" ..wd[i] .."rate", loop = openTime, timer = menuOpen, draw = function()
						if main_state.option(op[i]) == true then
							return true
						else
							return false
						end
					end, dst = {
						{time = openTime, x = posX + 692, y = posY, w = 31, h = 36, r = 255, g = 161, b = 3},
					}
				})
				table.insert(parts.destination, {
					id = "s_" ..wd[i] .."rate", loop = openTime, timer = menuOpen, draw = function()
						if main_state.option(op[i]) == false then
							return true
						else
							return false
						end
					end, dst = {
						{time = openTime, x = posX + 692, y = posY, w = 31, h = 36},
					}
				})
				posY = posY - 55
			end
		end
		do
			-- レート系（小数点）
			local wd = {"max", "perfect", "fullcombo", "exHard", "hard", "normal", "easy", "assist", "lightAssist", "failed", "noPlay"}
			local ref = {240, 239, 238, 233, 237, 236, 235, 231, 232, 234, 230}
			for i = 1, 11, 1 do
				table.insert(parts.value, {
					id = "s_" ..wd[i] .."rateAfterdot", src = 11, x = 1000, y = 0, w = 310, h = 36, divx = 10, digit = 1, ref = ref[i], align = 0
				})
			end
			local posY = 804
			for i = 1, 11, 1 do
				table.insert(parts.destination, {
					id = "s_" ..wd[i] .."rateAfterdot", loop = openTime, timer = menuOpen, draw = function()
						if main_state.option(op[i]) == true then
							return true
						else
							return false
						end
					end, dst = {
						{time = openTime, x = posX + 792, y = posY, w = 31, h = 36, r = 255, g = 161, b = 3},
					}
				})
				table.insert(parts.destination, {
					id = "s_" ..wd[i] .."rateAfterdot", loop = openTime, timer = menuOpen, draw = function()
						if main_state.option(op[i]) == false then
							return true
						else
							return false
						end
					end, dst = {
						{time = openTime, x = posX + 792, y = posY, w = 31, h = 36},
					}
				})
				posY = posY - 55
			end
		end
	end

	return parts
end

return {
	load = load
}