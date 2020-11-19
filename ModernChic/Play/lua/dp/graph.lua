--[[
	グラフバー
--]]
local function isGraphareaLeft()
	return skin_config.option["グラフバー表示位置"] == 930
end
local function isGraphareaRight()
	return skin_config.option["グラフバー表示位置"] == 931
end
local function isGraphareaNone()
	return skin_config.option["グラフバー表示位置"] == 932
end

local function load()
	local parts = {}
	
	local cycleNum = 20000
	
	parts.image = {
		-- スコアグラフフレーム
		{id = "graFrame", src = 22, x = 0, y = 0, w = 331, h = 198},
		-- nowscore bestscore target lankフレーム
		{id = "graFrame2", src = 22, x = 0, y = 729, w = 331, h = 112},
		-- グラフバー
		{id = "graBarMAX", src = 22, x = 0, y = 199, w = 331, h = 29},
		{id = "graBarA1", src = 22, x = 0, y = 850, w = 340, h = 29},
		{id = "graBarAA1", src = 22, x = 0, y = 879, w = 340, h = 29},
		{id = "graBarAAA1", src = 22, x = 0, y = 908, w = 340, h = 29},
		{id = "graBarA2", src = 22, x = 0, y = 937, w = 340, h = 29},
		{id = "graBarAA2", src = 22, x = 0, y = 966, w = 340, h = 29},
		{id = "graBarAAA2", src = 22, x = 0, y = 995, w = 340, h = 29},
		-- 現在のランク
		{id = "graNowAAA", src = 22, x = 340, y = 0, w = 74, h = 20},
		{id = "graNowAA", src = 22, x = 340, y = 20, w = 74, h = 20},
		{id = "graNowA", src = 22, x = 340, y = 40, w = 74, h = 20},
		{id = "graNowB", src = 22, x = 340, y = 60, w = 74, h = 20},
		{id = "graNowC", src = 22, x = 340, y = 80, w = 74, h = 20},
		{id = "graNowD", src = 22, x = 340, y = 100, w = 74, h = 20},
		{id = "graNowE", src = 22, x = 340, y = 120, w = 74, h = 20},
		{id = "graNowF", src = 22, x = 340, y = 140, w = 74, h = 20},
		-- ターゲットラベル
		{id = "graTarget", src = 22, x = 500, y = 530, w = 160, h = 198, divy = 11, len = 11, ref = 77},
		-- 判定ランク
		{id = "graJudgeVE", src = 22, x = 340, y = 530, w = 160, h = 18},
		{id = "graJudgeE", src = 22, x = 340, y = 548, w = 160, h = 18},
		{id = "graJudgeN", src = 22, x = 340, y = 566, w = 160, h = 18},
		{id = "graJudgeH", src = 22, x = 340, y = 584, w = 160, h = 18},
		{id = "graJudgeVH", src = 22, x = 340, y = 602, w = 160, h = 18},

		-- 背景
		{id = "graBg", src = 25, x = 0, y = 0, w = 331, h = 531},
	}
	
	parts.value = {
		-- 自スコア
		{id = "numMyExscore", src = 1, x = 1008, y = 940, w = 330, h = 40, divx = 11, divy = 1, digit = 4, ref = 101},
		-- ターゲットスコア
		{id = "numTarExscore", src = 1, x = 1008, y = 940, w = 330, h = 40, divx = 11, divy = 1, digit = 4, ref = 121},
		-- マイベストとのEXSCORE差分
		-- zeropadding 1:0で埋める 2:裏0で埋める
		{id = "numDiffExscoreMybest", src = 1, x = 720, y = 1040, w = 288, h = 40, divx = 12, divy = 2, digit = 5, ref = 152, align = 0},
		-- ターゲットとのEXSCORE差分
		{id = "numDiffExscoreTarget", src = 1, x = 720, y = 1040, w = 288, h = 40, divx = 12, divy = 2, digit = 5, ref = 153, align = 0},
	}
	
	--110: SCORERATE
	parts.graph = {
		{id = "graph-now", src = 22, x = 580, y = 0, w = 78, h = 523, divy = 523, cycle = cycleNum, type = 110, angle = 1},
		{id = "graph-now-best", src = 22, x = 580, y = 0, w = 78, h = 523, divy = 523, type = 111, angle = 1},

		{id = "graph-best-bg", src = 22, x = 500, y = 0, w = 78, h = 523, type = 113, angle = 1},
		{id = "graph-best", src = 22, x = 500, y = 0, w = 78, h = 523, divy = 523, cycle = cycleNum, type = 112, angle = 1},

		{id = "graph-target-bg", src = 22, x = 420, y = 0, w = 78, h = 523, type = 115, angle = 1},
		{id = "graph-target", src = 22, x = 420, y = 0, w = 78, h = 523, divy = 523, cycle = cycleNum, type = 114, angle = 1},
	}
	
	parts.destination = {}

	local positionX = 0
	local positionY = 239
	local graphPosY = 351

	if isGraphareaLeft() or isGraphareaRight() then
		if isGraphareaLeft() then
			positionX = 10
		elseif isGraphareaRight() then
			positionX = 1579
		end
		-- グラフフレーム
		table.insert(parts.destination, {
			id = "graFrame", dst = {
				{x = positionX + 0, y = positionY + 643, w = 331, h = 198},
			}
		})
		table.insert(parts.destination, {
			id = "graFrame2", dst = {
				{x = positionX + 0, y = positionY + 0, w = 331, h = 112},
			}
		})
		-- ターゲットラベル
		table.insert(parts.destination, {
			id = "graTarget", dst = {
				{x = positionX + 4, y = positionY + 23, w = 160, h = 18},
			}
		})
		do
			-- 判定ランク
			local wd = {"VH", "H", "N", "E", "VE"}
			local op = {180, 181, 182, 183, 184}
			for i = 1, 5, 1 do
				table.insert(parts.destination, {
					id = "graJudge"..wd[i], op = {op[i]}, dst = {
						{x = positionX + 169, y = positionY + 23, w = 160, h = 18},
					}
				})
			end
		end

		-- 背景
		table.insert(parts.destination, {
			id = "graBg", dst = {
				{x = positionX + 0, y = positionY + 112, w = 331, h = 531, a = 245},
			}
		})
		-- グラフ用明るさ調整
		table.insert(parts.destination,	{
			id = -110, offset = 43, dst = {
				{x = positionX + 0, y = positionY + 112, w = 331, h = 531, a = 0},
			}
		})
		-- 現在のスコアとターゲットスコア
		table.insert(parts.destination, {
			id = "numMyExscore", dst = {
				{x = positionX + 100, y = positionY + 777, w = 33, h = 40},
			}
		})
		table.insert(parts.destination, {
			id = "numTarExscore", dst = {
				{x = positionX + 100, y = positionY + 666, w = 33, h = 40},
			}
		})
		-- 基準点
		table.insert(parts.destination, {
			id = "graBarMAX", dst = {
				{x = positionX + 0, y = graphPosY + 501, w = 331, h = 29},
			}
		})
		-- 8/9
		table.insert(parts.destination, {
			id = "graBarAAA1", op = {-220}, dst = {
				{x = positionX + 0, y = graphPosY + 464, w = 340, h = 29},
			}
		})
		-- 7/9
		table.insert(parts.destination, {
			id = "graBarAA1", op = {-221}, dst = {
				{x = positionX + 0, y = graphPosY + 406, w = 340, h = 29},
			}
		})
		-- 6/9
		table.insert(parts.destination, {
			id = "graBarA1", op = {-222}, dst = {
				{x = positionX + 0, y = graphPosY + 348, w = 340, h = 29},
			}
		})
		table.insert(parts.destination, {
			id = "graBarAAA2", op = {220}, dst = {
				{x = positionX + 0, y = graphPosY + 464, w = 340, h = 29},
			}
		})
		table.insert(parts.destination, {
			id = "graBarAA2", op = {221}, dst = {
				{x = positionX + 0, y = graphPosY + 406, w = 340, h = 29},
			}
		})
		table.insert(parts.destination, {
			id = "graBarA2", op = {222}, dst = {
				{x = positionX + 0, y = graphPosY + 348, w = 340, h = 29},
			}
		})

		-- 基準点の白いあの線
		table.insert(parts.destination,	{
			id = -111, dst = {
				{x = positionX + 0, y = positionY + 109, w = 331, h = 2},
			}
		})

		-- 現在のベストレート
		table.insert(parts.destination, {
			id = "graph-now-best", dst = {
				{x = positionX + 243, y = positionY + 112, w = 78, h = 523, a = 50},
			}
		})
		-- 現在のスコア
		table.insert(parts.destination, {
			id = "graph-now", dst = {
				{x = positionX + 243, y = positionY + 112, w = 78, h = 523},
			}
		})
		do
			-- 現在のランク
			local wd = {"AAA", "AA", "A", "B", "C", "D", "E", "F"}
			local op = {200, 201, 202, 203, 204, 205, 206, 207}
			for i = 1, 7, 1 do
				table.insert(parts.destination, {
					id = "graNow"..wd[i], op = {op[i]}, dst = {
						{x = positionX + 244, y = positionY + 125, w = 74, h = 20},
					}
				})
			end
		end

		-- 自己ベスト
		table.insert(parts.destination, {
			id = "graph-best-bg", dst = {
				{x = positionX + 161, y = positionY + 112, w = 78, h = 523, a = 50},
			}
		})
		table.insert(parts.destination, {
			id = "graph-best", dst = {
				{x = positionX + 161, y = positionY + 112, w = 78, h = 523},
			}
		})
		-- 自己ベストとの差

		-- ターゲットスコア
		table.insert(parts.destination, {
			id = "graph-target-bg", dst = {
				{x = positionX + 80, y = positionY + 112, w = 78, h = 523, a = 50},
			}
		})
		table.insert(parts.destination, {
			id = "graph-target", dst = {
				{x = positionX + 80, y = positionY + 112, w = 78, h = 523},
			}
		})
		-- ターゲットスコアとの差
	end

	return parts
end

return {
	load = load
}