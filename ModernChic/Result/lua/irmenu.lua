--[[
	IR関係メニュー
	オプションONかつオンライン時で表示
]]

-- 自己ベストの取得
local function myScoreBest()
	-- 自己ベ
	local myScoreBest = main_state.number(170)
	-- 今回のスコア
	local myScoreNow = main_state.number(171)
	if myScoreBest >= myScoreNow then
		return myScoreBest
	else
		return myScoreNow
	end
end

-- カバーの表示切り替え
local function hiddenCounter()
	local screenHidden = false
	return {
		change = function()
			if screenHidden == false then
				screenHidden = true
			elseif screenHidden == true then
				screenHidden = false
			end
		end,
		get = function()
			return screenHidden
		end
	}
end

-- IR更新前と更新後の差分
local function irRankDiff()
	-- IRにスコアを更新したか
	local begin = main_state.timer(172)
	local success = main_state.timer(173)
	if begin == main_state.timer_off_value or success == main_state.timer_off_value then
		return 0
	else
		-- 更新前
		prevRank = main_state.number(182)
		-- 更新後
		updateRank = main_state.number(179)
		-- 初見時
		if prevRank == 0 then
			return 0
		else
			-- 差を返す（+になることは順位が下がった事を示す）
			diff = updateRank - prevRank
			return diff
		end
	end
end

local function load(positionx)
	local parts = {}

	-- カスタムタイマー
	local irRankUpdate = get_customTimer_id()
	local irRankNoupdate = get_customTimer_id()
	local irRankTop10PerInUpdate = get_customTimer_id()
	local irRankTop10PerInNoUpdate = get_customTimer_id()
	local irLoading = get_customTimer_id()
	local irRankUpdate2 = get_customTimer_id()
	parts.customTimers = {
		-- IR順位が更新され かつ IR上位10％でない
		{id = irRankUpdate, timer = timer_util.timer_observe_boolean(function()
			-- IRにスコアを更新したか
			local begin = main_state.timer(172)
			local success = main_state.timer(173)
			if begin == main_state.timer_off_value or success == main_state.timer_off_value then
				return false
			else
				local rankPer = main_state.number(179) / main_state.number(180) * 100
				local prevNum = main_state.number(182)
				local nowNum = main_state.number(179)
				if prevNum > nowNum and rankPer > 10 then
					return true
				else
					return false
				end
			end
		end)},
		-- IR順位更新なし時 かつ 上位10％でない
		{id = irRankNoupdate, timer = timer_util.timer_observe_boolean(function()
			-- IRにスコアを更新したか
			local begin = main_state.timer(172)
			local success = main_state.timer(173)
			if begin == main_state.timer_off_value or success == main_state.timer_off_value then
				return false
			else
				local rankPer = main_state.number(179) / main_state.number(180) * 100
				local totalPlayerNum = main_state.number(180)
				local prevNum = main_state.number(182)
				local nowNum = main_state.number(179)
				if prevNum <= nowNum and rankPer > 10 then
					return true
				else
					return false
				end
			end
		end)},
		-- IR順位が更新され かつ IR上位10％
		{id = irRankTop10PerInUpdate, timer = timer_util.timer_observe_boolean(function()
			-- IRにスコアを更新したか
			local begin = main_state.timer(172)
			local success = main_state.timer(173)
			if begin == main_state.timer_off_value or success == main_state.timer_off_value then
				return false
			else
				local rankPer = main_state.number(179) / main_state.number(180) * 100
				local prevNum = main_state.number(182)
				local nowNum = main_state.number(179)
				if prevNum > nowNum and rankPer <= 10 then
					return true
				else
					return false
				end
			end
		end)},
		-- IR順位更新なし かつ IR上位10％
		{id = irRankTop10PerInNoUpdate, timer = timer_util.timer_observe_boolean(function()
			-- IRにスコアを更新したか
			local begin = main_state.timer(172)
			local success = main_state.timer(173)
			if begin == main_state.timer_off_value or success == main_state.timer_off_value then
				return false
			else
				local rankPer = main_state.number(179) / main_state.number(180) * 100
				local prevNum = main_state.number(182)
				local nowNum = main_state.number(179)
				if prevNum <= nowNum and rankPer <= 10 then
					return true
				else
					return false
				end
			end
		end)},
		-- IR読み込み中
		{id = irLoading, timer = timer_util.timer_observe_boolean(function()
			local begin = main_state.timer(172)
			local success = main_state.timer(173)
			if bigin ~= main_state.timer_off_value and success == main_state.timer_off_value then
				return true
			else
				return false
			end
		end)},
		-- 単純にIR順位が更新されたかを判定
		{id = irRankUpdate2, timer = timer_util.timer_observe_boolean(function()
			-- IRにスコアを更新したか
			local begin = main_state.timer(172)
			local success = main_state.timer(173)
			if begin == main_state.timer_off_value or success == main_state.timer_off_value then
				return false
			else
				local prevNum = main_state.number(182)
				local nowNum = main_state.number(179)
				if prevNum > nowNum then
					return true
				else
					return false
				end
			end
		end)},
	}
	
	parts.image = {
		{id = "irTopFrame", src = 2, x = 670, y = 380, w = 665, h = 714},
		{id = "irRankingFrame", src = 2, x = 670, y = 160, w = 665, h = 210},
		{id = "irSending", src = 2, x = 670, y = 100, w = 665, h = 50},
		{id = "irSendComp", src = 2, x = 670, y = 50, w = 665, h = 50},
		{id = "irSendFaild", src = 2, x = 670, y = 0, w = 665, h = 50},
		{id = "IrOvertake", src = 6, x = 0, y = 380, w = 142, h = 142},
		{id = "IrLoading", src = 6, x = 199, y = 420, w = 89, h = 19},

		-- TOP10名前隠し
		{id = "irTop10Cover", src = 11, x = 0, y = 0, w = 200, h = 645},

		-- 自身のポジション枠
		{id = "irMyPositionFrame", src = 2, x = 0, y = 1630, w = 655, h = 148, divy = 2, cycle = 100},

		-- IRライバルタイプ
		{id = "irRivaltypeMybestdif", src = 2, x = 852, y = 1153, w = 167, h = 43},
		{id = "irRivaltypeRank", src = 2, x = 852, y = 1110, w = 167, h = 43},

		-- ランプ状況
		{id = "irNoplay", src = 5, x = 0, y = 684, w = 38, h = 76},
		{id = "irFailed", src = 5, x = 0, y = 0, w = 76, h = 76, divx = 2, cycle = 50},
		{id = "irEasy", src = 5, x = 0, y = 76, w = 38, h = 76},
		{id = "irNormal", src = 5, x = 0, y = 152, w = 38, h = 76},
		{id = "irHard", src = 5, x = 0, y = 228, w = 38, h = 76},
		{id = "irExhard", src = 5, x = 0, y = 304, w = 76, h = 76, divx = 2, cycle = 50},
		{id = "irFullCombo", src = 5, x = 0, y = 380, w = 114, h = 76, divx = 3, cycle = 50},
		{id = "irPerfect", src = 5, x = 0, y = 456, w = 114, h = 76, divx = 3, cycle = 50},
		{id = "irAssist", src = 5, x = 0, y = 532, w = 38, h = 76},
		{id = "irLaAssist", src = 5, x = 0, y = 608, w = 38, h = 76},
	}
	-- スクショ用ボタン
	local screenHidden = hiddenCounter()
	table.insert(parts.image, {
		id = "screenShot", src = 2, x = 1200, y = 1110, w = 86, h = 43, divx = 2, cycle = 200, act = screenHidden.change
	})

	parts.imageset = {}
	do
		-- TOP10のクリア状況
		local ref = {390, 391, 392, 393, 394, 395, 396, 397, 398, 399}
		for i = 1, 10, 1 do
			table.insert(parts.imageset,{
				id = "clearTypeIr"..i, ref = ref[i], images = {"irNoplay", "irFailed", "irAssist", "irLaAssist", "irEasy", "irNormal", "irHard", "irExhard", "irFullCombo", "irPerfect", "irPerfect"}
			})
		end
	end

	parts.text = {}
	do
		-- ランキングTop10
		local ref = {120, 121, 122, 123, 124, 125, 126, 127, 128, 129}
		for i = 1, 10, 1 do
			table.insert(parts.text,{id = "irRankName"..i, font = 1, size = 30, ref = ref[i], align = 0, overflow = 1, shadowOffsetX = 1, shadowOffsetY = 1})
		end
	end
	
	parts.value = {
		-- 現在のIR順位179
		-- align:0,1,2 右、左、中央
		{id = "irMyRank", src = 4, x = 0, y = 0, w = 440, h = 60, divx = 10, digit = 5, ref = 179, align = 2},
		-- 上位10％時
		{id = "irEliteRank", src = 4, x = 0, y = 384, w = 440, h = 180, divx = 10, divy = 3, digit = 5, ref = 179, align = 2, cycle = 50},
		-- 更新前の順位
		{id = "irPrevMyRank", src = 4, x = 0, y = 0, w = 440, h = 60, divx = 10, digit = 5, ref = 182, align = 2},
		-- IR参加人数
		{id = "irTotalPlayer", src = 4, x = 0, y = 0, w = 440, h = 60, divx = 10, digit = 5, ref = 180, align = 2},
	}

	do
		-- TOP10のEXSCORE
		local ref = {380, 381, 382, 383, 384, 385, 386, 387, 388, 389}
		for i = 1, 10, 1 do
			table.insert(parts.value,{
				id = "exscoreIr"..i, src = 4, x = 440, y = 60, w = 310, h = 36, divx = 10, digit = 5, align = 2, ref = ref[i]
			})
		end

		-- TOP10からのスコア差分
		local myScore = myScoreBest()
		for i = 1, 10, 1 do
			table.insert(parts.value,{
				id = "exscoreIrDiff"..i, src = 4, x = 440, y = 276, w = 372, h = 72, divx = 12, divy = 2, digit = 6, align = 2, value = function()
					if main_state.number(ref[i]) == -2147483648 then
						return 0
					else
						return main_state.number(ref[i]) - myScore
					end
				end,
			})
		end
	end

	do
		-- 更新前と更新後の順位差分
		table.insert(parts.value, {
			id = "irRankDiff", src = 4, x = 440, y = 276, w = 372, h = 72, divx = 12, divy = 2, digit = 6, align = 2, value = function()
				return irRankDiff()
			end,
		})
	end

	parts.destination = {}

	-- IR送信中
	table.insert(parts.destination, {
		id = "irSending", timer = 172, dst = {
			{x = positionx, y = 1024, w = 665, h = 50},
		}
	})
	-- IR送信完了
	table.insert(parts.destination, {
		id = "irSendComp", timer = 173, dst = {
			{x = positionx, y = 1024, w = 665, h = 50},
		}
	})
	-- IR送信失敗
	table.insert(parts.destination, {
		id = "irSendFaild", timer = 174, dst = {
			{x = positionx, y = 1024, w = 665, h = 50},
		}
	})

	do
		local posY = 806
		table.insert(parts.destination, {
			id = "irRankingFrame", dst = {
				{x = positionx, y = posY, w = 665, h = 210},
			}
		})

		-- op606: IR_WAITING
		-- IR更新中
		do
			local posX = {105, 437}
			for i = 1, 2, 1 do
				table.insert(parts.destination, {
					id = "IrLoading", loop = 0, timer = irLoading, dst = {
						{time = 0, x = positionx + posX[i], y = posY + 64, w = 89, h = 19},
						{time = 1000, a = 100},
						{time = 2000, a = 255},
					}
				})
			end
		end

		-- IR順位を更新した時(上位10%でない)
		table.insert(parts.destination, {
			id = "irPrevMyRank", loop = 500, timer = irRankUpdate, op = {-606}, dst = {
				{time = 0, x = positionx + 30, y = posY + 48, w = 44, h = 60, a = 255},
				{time = 500, y = posY + 24, a = 0}
			}
		})
		table.insert(parts.destination, {
			id = "irMyRank", loop = 500, timer = irRankUpdate, op = {-606}, dst = {
				{time = 0, x = positionx + 30, y = posY + 72, w = 44, h = 60, a = 0},
				{time = 500, y = posY + 48, a = 255}
			}
		})

		-- IR順位に変化なし(上位10％でない)
		table.insert(parts.destination, {
			id = "irMyRank", timer = irRankNoupdate, op = {-606}, dst = {
				{x = positionx + 30, y = posY + 48, w = 44, h = 60}
			}
		})

		-- IR順位を更新した時（上位10％）
		table.insert(parts.destination, {
			id = "irPrevMyRank", loop = 500, timer = irRankTop10PerInUpdate, op = {-606}, dst = {
				{time = 0, x = positionx + 30, y = posY + 48, w = 44, h = 60, a = 255},
				{time = 500, y = posY + 24, a = 0}
			}
		})
		table.insert(parts.destination, {
			id = "irEliteRank", loop = 500, timer = irRankTop10PerInUpdate, op = {-606}, dst = {
				{time = 0, x = positionx + 30, y = posY + 72, w = 44, h = 60, a = 0},
				{time = 500, y = posY + 48, a = 255}
			}
		})

		-- IR順位に変化なし（上位10％）
		table.insert(parts.destination, {
			id = "irEliteRank", timer = irRankTop10PerInNoUpdate, op = {-606}, dst = {
				{x = positionx + 30, y = posY + 48, w = 44, h = 60}
			}
		})

		-- 更新前と更新後の差分
		table.insert(parts.destination, {
			id = "irRankDiff", draw = function()
				return irRankDiff() ~= 0
			end, dst = {
				{x = positionx + 80, y = posY + 15, w = 22, h = 25}
			}
		})

		-- 全体人数
		table.insert(parts.destination, {
			id = "irTotalPlayer", timer = 173, dst = {
				{x = positionx + 365, y = posY + 48, w = 44, h = 60},
			}
		})

		-- 順位を更新した
		-- op334 : UPDATE_IRRANK
		table.insert(parts.destination, {
			id = "IrOvertake", loop = 1300, timer = irRankUpdate2, dst = {
				{time = 700, x = positionx - 95, y = posY + 35, w = 142 * 2, h = 142 * 2, a = 0},
				{time = 1300, x = positionx - 23, y = posY + 107, w = 142, h = 142, a = 255},
			}
		})
	end

	-- ランキングトップ10
	table.insert(parts.destination, {
		id = "irTopFrame", dst = {
			{x = positionx, y = 70, w = 665, h = 714},
		}
	})
	table.insert(parts.destination, {
		id = "screenShot", dst = {
			{x = positionx + 265, y = 733, w = 43, h = 43},
		}
	})
	table.insert(parts.destination, {
		id = "irRivaltypeMybestdif", dst = {
			{x = positionx + 480, y = 733, w = 167, h = 43},
		}
	})
	do
		local posY = {}
		local initPosY = 677

		for i = 1, 10, 1 do
			posY[i] = initPosY
			initPosY = initPosY - 65
		end

		for i = 1, 10, 1 do

			-- 自分の場合は枠を追加
			table.insert(parts.destination, {
				id = "irMyPositionFrame", draw = function()
					return main_state.number(179) == i
				end, dst = {
					{x = positionx + 6, y = posY[i] - 19, w = 655, h = 74},
				}
			})

			-- ライバルのランプ状況
			table.insert(parts.destination, {
				id = "clearTypeIr" ..i, dst = {
					{time = 0, x = positionx + 4, y = posY[i] - 20, w = 38, h = 76},
					{time = 3000, a = 200},
					{time = 5000, a = 255}
				}
			})

			-- ライバルネーム
			-- 自分の場合は色を変化
			table.insert(parts.destination, {
				id = "irRankName"..i, draw = function()
					return main_state.number(179) == i
				end,
				dst = {
						{x = positionx + 130, y = posY[i], w = 180, h = 30, r = 255, g = 161, b = 3},
				}
			})
			table.insert(parts.destination, {
				id = "irRankName"..i, draw = function()
					return main_state.number(179) ~= i
				end,
				dst = {
						{x = positionx + 130, y = posY[i], w = 180, h = 30},
				}
			})
			-- ライバルのEXSCORE
			table.insert(parts.destination,{
				id = "exscoreIr"..i, draw = function()
					return main_state.number(179) == i
				end,
				dst = {
					{x = positionx + 330, y = posY[i] + 3, w = 28, h = 36, r = 255, g = 161, b = 3},
				}
			})
			table.insert(parts.destination,{
				id = "exscoreIr"..i, draw = function()
					return main_state.number(179) ~= i
				end,
				dst = {
					{x = positionx + 330, y = posY[i] + 3, w = 28, h = 36},
				}
			})
			-- 自己ベとの差分
			table.insert(parts.destination,{
				id = "exscoreIrDiff"..i, timer = 173, draw = function()
					return main_state.number(179) ~= i and main_state.number(379 + i) ~= -2147483648
				end,
				dst = {
					{x = positionx + 475, y = posY[i] + 3, w = 28, h = 36},
				}
			})
		end
	end

	-- スクショ用隠し（スクショボタンを押された場合に表示を切り替える）
	table.insert(parts.destination, {
		id = "irTop10Cover", draw = screenHidden.get, dst = {
			{x = positionx + 120, y = 80, w = 200, h = 645},
		}
	})
	
	return parts
end

return {
	load = load
}