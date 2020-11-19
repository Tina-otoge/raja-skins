--[[
	グラフ、判定数、メインメニュー
]]

local function load(positionx, flag)
	local parts = {}
	
	do
		local gaugeWidth = 8
		local gaugeHeight = 35
		parts.image = {
			{id = "mainInfo", src = 2, x = 0, y = 0, w = 665, h = 150, divy = 3, cycle = 9000},
			{id = "mainGraphFrame", src = 2, x = 0, y = 160, w = 665, h = 356},
			{id = "mainJudgeFrame", src = 2, x = 0, y = 520, w = 665, h = 582},
			-- ランプ（修飾用）
			{id = "lampGreen", src = 5, x = 0, y = 760, w = 38, h = 76},

			-- クリア状況
			{id = "clearType", src = 2, x = 150, y = 1110, w = 702, h = 473, divx = 3, divy = 11, cycle = 192, len = 11, ref = 370, act = 370},
			-- ベストクリア状況
			{id = "clearType2", src = 2, x = 150, y = 1110, w = 702, h = 473, divx = 3, divy = 11, cycle = 192, len = 11, ref = 371, act = 371},

			-- 自己ベスト更新
			{id = "scoreUpdate", src = 6, x = 199, y = 380, w = 214, h = 36, divx = 2, cycle = 200},

			-- トータルノート数、使用OP表示フレーム
			{id = "infoFrame", src = 6, x = 0, y = 530, w = 649, h = 44},
			-- 使用OP 1P
			{id = "useOption1P", src = 6, x = 520, y = 0, w = 175, h = 400, divy = 10, len = 10, ref = 42, act = 42},
			-- 使用OP 2P
			{id = "useOption2P", src = 6, x = 520, y = 0, w = 175, h = 400, divy = 10, len = 10, ref = 43, act = 43},

			-- ノーマルゲージ（赤over80明）
			{id = "gauge-r1", src = 2, x = 0, y = 1500, w = gaugeWidth, h = gaugeHeight},
			-- ノーマルゲージ（赤over80暗）
			{id = "gauge-r2", src = 2, x = 16, y = 1500, w = gaugeWidth, h = gaugeHeight},
			-- ノーマルゲージ（赤over80明）
			{id = "gauge-r3", src = 2, x = 0, y = 1500, w = gaugeWidth, h = gaugeHeight},
			
			-- ノーマルゲージ（青under80明）
			{id = "gauge-b1", src = 2, x = 8, y = 1500, w = gaugeWidth, h = gaugeHeight},
			-- ノーマルゲージ（青under80暗）
			{id = "gauge-b2", src = 2, x = 24, y = 1500, w = gaugeWidth, h = gaugeHeight},
			-- ノーマルゲージ（青over60明）
			{id = "gauge-b3", src = 2, x = 8, y = 1500, w = gaugeWidth, h = gaugeHeight},
			
			-- ノーマルゲージ（緑under80明）
			{id = "gauge-g1", src = 2, x = 32, y = 1500, w = gaugeWidth, h = gaugeHeight},
			-- ノーマルゲージ（緑under80暗）
			{id = "gauge-g2", src = 2, x = 48, y = 1500, w = gaugeWidth, h = gaugeHeight},
			-- ノーマルゲージ（緑under80明）
			{id = "gauge-g3", src = 2, x = 32, y = 1500, w = gaugeWidth, h = gaugeHeight},
			
			-- アシストゲージ（ピンクover60明）
			{id = "gauge-p1", src = 2, x = 40, y = 1500, w = gaugeWidth, h = gaugeHeight},
			-- アシストゲージ（ピンク暗）
			{id = "gauge-p2", src = 2, x = 56, y = 1500, w = gaugeWidth, h = gaugeHeight},
			-- アシストゲージ（ピンク明）
			{id = "gauge-p3", src = 2, x = 40, y = 1500, w = gaugeWidth, h = gaugeHeight},
			
			-- EXゲージ（黄明）
			{id = "gauge-y1", src = 2, x = 0, y = 1535, w = gaugeWidth, h = gaugeHeight},
			-- EXゲージ（黄暗）
			{id = "gauge-y2", src = 2, x = 16, y = 1535, w = gaugeWidth, h = gaugeHeight},
			-- EXゲージ（黄明）
			{id = "gauge-y3", src = 2, x = 0, y = 1535, w = gaugeWidth, h = gaugeHeight},
			
			-- HAZARDゲージ（紫明）
			{id = "gauge-h1", src = 2, x = 64, y = 1500, w = gaugeWidth, h = gaugeHeight},
			-- HAZARDゲージ（紫暗）
			{id = "gauge-h2", src = 2, x = 72, y = 1500, w = gaugeWidth, h = gaugeHeight},
			-- HAZARDゲージ（紫明）
			{id = "gauge-h3", src = 2, x = 64, y = 1500, w = gaugeWidth, h = gaugeHeight},
		}
	end
	
	parts.value = {
		-- 今回のEXSCORE
		{id = "mainExscore", src = 4, x = 440, y = 60, w = 341, h = 36, divx = 11, digit = 4, ref = 171, align = 0, zeropadding = 1},
		-- 自己べとのEXSCORE差分
		{id = "mainExscoreDiff", src = 4, x = 440, y = 96, w = 372, h = 72, divx = 12, divy = 2, digit = 5, ref = 172, align = 0},

		-- 今回のコンボ
		{id = "mainCombo", src = 4, x = 440, y = 96, w = 341, h = 36, divx = 11, digit = 4, ref = 105, align = 0, zeropadding = 1},
		-- 自己べとのコンボ差分
		{id = "mainComboDiff", src = 4, x = 440, y = 96, w = 372, h = 72, divx = 12, divy = 2, digit = 5, ref = 175, align = 0},

		-- ピカグレ数
		{id = "numPG", src = 4, x = 440, y = 96, w = 341, h = 36, divx = 11, digit = 4, ref = 110, align = 0, zeropadding = 1},
		-- グレ数
		{id = "numGR", src = 4, x = 440, y = 96, w = 341, h = 36, divx = 11, digit = 4, ref = 111, align = 0, zeropadding = 1},
		{id = "numGR_ER", src = 4, x = 440, y = 312, w = 341, h = 36, divx = 11, digit = 4, ref = 412, align = 0, zeropadding = 1},
		{id = "numGR_SL", src = 4, x = 440, y = 276, w = 341, h = 36, divx = 11, digit = 4, ref = 413, align = 0, zeropadding = 1},
		-- good数
		{id = "numGD", src = 4, x = 440, y = 96, w = 341, h = 36, divx = 11, digit = 4, ref = 112, align = 0, zeropadding = 1},
		{id = "numGD_ER", src = 4, x = 440, y = 312, w = 341, h = 36, divx = 11, digit = 4, ref = 414, align = 0, zeropadding = 1},
		{id = "numGD_SL", src = 4, x = 440, y = 276, w = 341, h = 36, divx = 11, digit = 4, ref = 415, align = 0, zeropadding = 1},
		-- bad数
		{id = "numBD", src = 4, x = 440, y = 96, w = 341, h = 36, divx = 11, digit = 4, ref = 113, align = 0, zeropadding = 1},
		{id = "numBD_ER", src = 4, x = 440, y = 312, w = 341, h = 36, divx = 11, digit = 4, ref = 416, align = 0, zeropadding = 1},
		{id = "numBD_SL", src = 4, x = 440, y = 276, w = 341, h = 36, divx = 11, digit = 4, ref = 417, align = 0, zeropadding = 1},
		-- poor数
		{id = "numPR", src = 4, x = 440, y = 96, w = 341, h = 36, divx = 11, digit = 4, ref = 114, align = 0, zeropadding = 1},
		{id = "numPR_ER", src = 4, x = 440, y = 312, w = 341, h = 36, divx = 11, digit = 4, ref = 418, align = 0, zeropadding = 1},
		{id = "numPR_SL", src = 4, x = 440, y = 276, w = 341, h = 36, divx = 11, digit = 4, ref = 419, align = 0, zeropadding = 1},
		-- miss数
		{id = "numMS", src = 4, x = 440, y = 96, w = 341, h = 36, divx = 11, digit = 4, ref = 420, align = 0, zeropadding = 1},
		{id = "numMS_ER", src = 4, x = 440, y = 312, w = 341, h = 36, divx = 11, digit = 4, ref = 421, align = 0, zeropadding = 1},
		{id = "numMS_SL", src = 4, x = 440, y = 276, w = 341, h = 36, divx = 11, digit = 4, ref = 422, align = 0, zeropadding = 1},

		-- ゲージ
		{id = "numGauge", src = 4, x = 0, y = 96, w = 440, h = 36, divx = 10, digit = 3, ref = 107, align = 0},
		{id = "numGaugeAfterdot", src = 4, x = 0, y = 132, w = 440, h = 36, divx = 10, digit = 1, ref = 407, align = 0},

		-- 総ノート数
		{id = "totalNotes", src = 4, x = 440, y = 96, w = 341, h = 36, divx = 11, digit = 4, ref = 74, align = 0, zeropadding = 1},
	}

	parts.gaugegraph = {
		{id = "grooveGaugeGraph", assistClearBGColor = "44004455", assistAndEasyFailBGColor = "00444455", grooveFailBGColor = "00440055", grooveClearAndHardBGColor = "44000055", exHardBGColor = "44440055", hazardBGColor = "44444455", borderColor = "44000055"},
	}

	-- backTexOff 0：背景黒 1:背景を透過
	parts.judgegraph = {
		{id = "judgesGraph", noGap = 0, orderReverse = 1, type = 1, backTexOff = 1},
	}

	parts.destination = {}

	table.insert(parts.destination, {
		id = "mainInfo", dst = {
			{x = positionx, y = 1024, w = 665, h = 50},
		}
	})

	-- ゲージグラフ
	table.insert(parts.destination, {
		id = "mainGraphFrame", dst = {
			{x = positionx, y = 659, w = 665, h = 356},
		}
	})
	-- 通常リザルトの時のみ
	if flag == 0 then
		table.insert(parts.destination, {
			id = "judgesGraph", dst = {
				{x = positionx + 5, y = 774, w = 655, h = 236},
			}
		})
	end
	table.insert(parts.destination, {
		id = "grooveGaugeGraph", dst = {
			{x = positionx + 5, y = 774, w = 655, h = 236},
		}
	})

	-- 今回のクリアランク（ゲージ部分）
	do
		local wd = {"rankAAA", "rankAA", "rankA", "rankB", "rankC", "rankD", "rankE", "rankF"}
		local op = {300, 301, 302, 303, 304, 305, 306, 307}
		local posY = 0

		for i = 1, 8, 1 do
			table.insert(parts.image, {id = wd[i], src = 7, x = 0, y = posY, w = 400, h = 168})
			posY = posY + 168
		end

		for i = 1, 8, 1 do
			table.insert(parts.destination, {
				id = wd[i], loop = -1, op = {op[i]}, dst = {
					{time = 0, x = positionx + 60, y = 800, w = 400, h = 168, a = 0},
					{time = 1000, a = 255},
					{time = 4000},
					{time = 5000, a = 0}
				}
			})
		end
	end

	-- 使用OP、総ノート数
	table.insert(parts.destination, {
		id = "infoFrame", dst = {
			{x = positionx + 8, y = 727, w = 649, h = 44},
		}
	})
	-- 使用OP
	table.insert(parts.destination, {
		id = "useOption1P", dst = {
			{x = positionx + 31, y = 726, w = 175, h = 40},
		}
	})
	table.insert(parts.destination, {
		id = "useOption2P", draw = function()
			return main_state.option(162) or main_state.option(163) or main_state.option(1161)
		end, dst = {
			{x = positionx + 216, y = 726, w = 175, h = 40},
		}
	})
	-- 総ノート数
	table.insert(parts.destination, {
		id = "totalNotes", dst = {
			{x = positionx + 404, y = 730, w = 31, h = 36},
		}
	})

	-- ゲージ本体
	table.insert(parts.destination,	{
		id = "2001", dst = {
			{x = positionx + 21, y = 674, w = 400, h = 35},
		}
	})
	-- 残りゲージ
	table.insert(parts.destination, {
		id = "numGauge", dst = {
			{x = positionx + 409, y = 674, w = 44, h = 36},
		}
	})
	table.insert(parts.destination, {
		id = "numGaugeAfterdot", dst = {
			{x = positionx + 559, y = 674, w = 44, h = 36},
		}
	})

	do
		local exscorePosY = 545
		local comboPosY = exscorePosY - 65
		local pgPosY = comboPosY - 65
		local greatPosY = pgPosY - 65
		local goodPosY = greatPosY - 65
		local badPosY = goodPosY - 65
		local poorPosY = badPosY - 65
		local missPosY = poorPosY - 65

		-- スコア表示
		table.insert(parts.destination, {
			id = "mainJudgeFrame", dst = {
				{x = positionx, y = 70, w = 665, h = 582},
			}
		})

		-- 今回のEXSCORE
		table.insert(parts.destination, {
			id = "mainExscore", dst = {
				{x = positionx + 250, y = exscorePosY, w = 28, h = 36},
			}
		})
		-- EXSCORE差分
		table.insert(parts.destination, {
			id = "mainExscoreDiff", dst = {
				{x = positionx + 390, y = exscorePosY, w = 22, h = 28},
			}
		})
		-- EXSCORE更新
		table.insert(parts.destination, {
			id = "scoreUpdate", loop = 3000, op = {330}, dst = {
				{time = 2500, x = positionx + 535 - (107 / 2), y = exscorePosY - (36 / 2), w = 107 * 2, h = 36 * 2},
				{time = 3000, x = positionx + 535, y = exscorePosY, w = 107, h = 36}
			}
		})

		-- コンボ数
		table.insert(parts.destination, {
			id = "mainCombo", dst = {
				{x = positionx + 250, y = comboPosY, w = 28, h = 36},
			}
		})
		-- コンボ差分
		table.insert(parts.destination, {
			id = "mainComboDiff", dst = {
				{x = positionx + 390, y = comboPosY, w = 22, h = 28},
			}
		})
		-- コンボ更新
		table.insert(parts.destination, {
			id = "scoreUpdate", loop = 3000, op = {331}, dst = {
				{time = 2500, x = positionx + 535 - (107 / 2), y = comboPosY - (36 / 2), w = 107 * 2, h = 36 * 2},
				{time = 3000, x = positionx + 535, y = comboPosY, w = 107, h = 36}
			}
		})

		-- ピカグレ数
		table.insert(parts.destination, {
			id = "numPG", dst = {
				{x = positionx + 250, y = pgPosY, w = 28, h = 36},
			}
		})

		-- GREAT, GOOD, BAD, POOR, MISS数
		do
			local wd = {"numGR", "numGD", "numBD", "numPR", "numMS"}
			local pos = {greatPosY, goodPosY, badPosY, poorPosY, missPosY}
			for i = 1, 5, 1 do
				-- グレ数
				table.insert(parts.destination, {
					id = wd[i], dst = {
						{x = positionx + 250, y = pos[i], w = 28, h = 36},
					}
				})
				table.insert(parts.destination, {
					id = wd[i] .."_SL", dst = {
						{x = positionx + 390, y = pos[i], w = 28, h = 36},
					}
				})
				table.insert(parts.destination, {
					id = wd[i] .."_ER", dst = {
						{x = positionx + 530, y = pos[i], w = 28, h = 36},
					}
				})
			end
		end
	end

	-- 今回のクリアランク
	do
		local wd = {"thisTimeAAA", "thisTimeAA", "thisTimeA", "thisTimeB", "thisTimeC", "thisTimeD", "thisTimeE", "thisTimeF"}
		local op = {300, 301, 302, 303, 304, 305, 306, 307}
		local posY = 1110
		for i = 1, 8, 1 do
			table.insert(parts.image, {id = wd[i], src = 2, x = 0, y = posY, w = 142, h = 43})
			posY = posY + 43
		end
		for i = 1, 8, 1 do
			table.insert(parts.destination, {
				id = wd[i], op = {op[i]}, dst = {
					{x = positionx + 510, y = 601, w = 142, h = 43},
				}
			})
		end
	end

	-- 今回のクリアタイプ
	table.insert(parts.destination, {
		id = "clearType", dst = {
			{x = positionx + 261, y = 601, w = 234, h = 43},
		}
	})

	do
		-- 修飾用パーツ
		local posY = {525, 460, 395, 330, 265, 200, 135, 70}
		local delay = 0

		for i = 1, 8, 1 do
			table.insert(parts.destination, {
				id = "lampGreen", blend = 2, dst = {
					{time = 0, x = positionx + 4, y = posY[i], w = 38, h = 76, a = 255},
					{time = 0 + delay},
					{time = 2000 - delay, a = 50},
					{time = 2000 + delay},
					{time = 4000, a = 255}
				}
			})
			delay = delay + 100
		end
	end

	return parts
end

return {
	load = load
}