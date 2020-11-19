--[[
	IRランキング、クリアレート表示用
	op2 OPTION_SONGBAR
	op625 : ライバル比較時
	op51 : オンライン時
--]]
local function isIrClearrateFullcomborate()
	return skin_config.option["IR情報表示"] == 935
end
local function isIrRanking()
	return skin_config.option["IR情報表示"] == 936
end
local function load()
	local parts = {}
	local irFramePosX = 18
	local irFramePosY = 235
	local crFramePosX = 590
	local crFramePosY = 325
	local fcFramePosX = 590
	local fcFramePosY = 235
	local posRankingFrame = {590, 235}
	
	parts.image = {
		{id = "qco_ir_frame", src = 9, x = 0, y = 0, w = 560, h = 160},
		{id = "qco_fc_frame", src = 9, x = 570, y = 0, w = 410, h = 70},
		{id = "qco_cr_frame", src = 9, x = 570, y = 80, w = 410, h = 70},
		
		{id = "qco_fc_per", src = 9, x = 881, y = 170, w = 100, h = 70},
		{id = "qco_cr_per", src = 9, x = 881, y = 242, w = 100, h = 70},
		
		{id = "qco_ranking_frame", src = 9, x = 0, y = 370, w = 410, h = 160},
		
		{id = "qcoNoPlay", src = 9, x = 500, y = 170, w = 110, h = 22},
		{id = "qcoFailed", src = 9, x = 500, y = 192, w = 110, h = 22},
		{id = "qcoLaEasy", src = 9, x = 500, y = 214, w = 110, h = 22},
		{id = "qcoClear", src = 9, x = 500, y = 236, w = 110, h = 22},
		{id = "qcoEasy", src = 9, x = 500, y = 258, w = 110, h = 22},
		{id = "qcoFullCombo", src = 9, x = 500, y = 280, w = 330, h = 22, divx = 3, cycle = 300},
		{id = "qcoHardClear", src = 9, x = 500, y = 302, w = 110, h = 22},
		{id = "qcoExHard", src = 9, x = 500, y = 324, w = 220, h = 22, divx = 2, cycle = 200},
		{id = "qcoPerfect", src = 9, x = 500, y = 346, w = 110, h = 22},
		{id = "qcoMax", src = 9, x = 500, y = 368, w = 110, h = 22},
		{id = "qcoAssist", src = 9, x = 500, y = 390, w = 110, h = 22},
		
		{id = "qcoLoading", src = 9, x = 830, y = 390, w = 75, h = 44},
		{id = "qcoFCLoading", src = 9, x = 830, y = 434, w = 75, h = 44},
		{id = "qcoClearLoading", src = 9, x = 830, y = 478, w = 75, h = 44},

		-- 自身のポジション枠
		{id = "qcoMyRank", src = 9, x = 980, y = 0, w = 420, h = 80, divy = 2, cycle = 100},
	}
	-- クリアランク
	do
		local wd = {"AAA", "AA", "A", "B", "C", "D", "E", "F"}
		local y = {530, 552, 574, 596, 618, 640, 662, 684}
		for i = 1, 8, 1 do
			table.insert(parts.image, {
				id = "qco"..wd[i], src = 9, x = 500, y = y[i], w = 59, h = 22
			})
		end
	end
	
	parts.imageset = {}
	do
		-- TOP10のクリア状況
		local ref = {390, 391, 392, 393, 394, 395, 396, 397, 398, 399}
		for i = 1, 10, 1 do
			table.insert(parts.imageset,{
				id = "clearTypeIr"..i, ref = ref[i], images = {"qcoNoPlay", "qcoFailed", "qcoAssist", "qcoLaEasy", "qcoEasy", "qcoClear", "qcoHardClear", "qcoExHard", "qcoFullCombo", "qcoPerfect", "qcoPerfect"}
			})
		end
	end
	
	parts.text = {}
	if is_outlinefont() then
		-- IRTOP10
		local ref = {120, 121, 122, 123, 124, 125, 126, 127, 128, 129}
		for i = 1, 10, 1 do
			table.insert(parts.text,{id = "irRankName"..i, font = 3, size = 16, ref = ref[i], align = 0, overflow = 1, shadowOffsetX = 1, shadowOffsetY = 1})
		end
	elseif is_bitmapfont() then
		-- IRTOP10
		local ref = {120, 121, 122, 123, 124, 125, 126, 127, 128, 129}
		for i = 1, 10, 1 do
			table.insert(parts.text,{id = "irRankName"..i, font = 1, size = 16, ref = ref[i], align = 0, overflow = 1})
		end
	end
	
	parts.value = {
		-- 現在のIR順位
		-- align:0,1,2 右、左、中央
		{id = "ir_rank2", src = 9, x = 0, y = 170, w = 430, h = 42, divx = 10, digit = 5, ref = 179, align = 2},
		{id = "ir_eliteRank", src = 9, x = 0, y = 530, w = 430, h = 126, divx = 10, divy = 3, digit = 5, ref = 179, align = 2, cycle = 100},
		-- IR参加人数
		{id = "ir_totalplayer2", src = 9, x = 0, y = 170, w = 430, h = 42, divx = 10, digit = 5, ref = 180, align = 2},
		-- IRクリアレート
		{id = "ir_clearrate2", src = 9, x = 0, y = 254, w = 430, h = 42, divx = 10, digit = 3, ref = 227},
		{id = "ir_clearrate2_ad", src = 9, x = 0, y = 327, w = 310, h = 31, divx = 10, digit = 1, ref = 241},
--		{id = "ir_clearrate2_wh", src = 9, x = 0, y = 614, w = 430, h = 42, divx = 10, digit = 3, ref = 227},
--		{id = "ir_clearrate2_ad_wh", src = 9, x = 0, y = 718, w = 310, h = 31, divx = 10, digit = 1, ref = 241},
		-- IRフルコンレート
		{id = "ir_fcrate2", src = 9, x = 0, y = 212, w = 430, h = 42, divx = 10, digit = 3, ref = 229},
		{id = "ir_fcrate2_ad", src = 9, x = 0, y = 296, w = 310, h = 31, divx = 10, digit = 1, ref = 242},
	}
	
	do
		-- TOP10のEXSCORE
		local ref = {380, 381, 382, 383, 384, 385, 386, 387, 388, 389}
		for i = 1, 10, 1 do
			table.insert(parts.value,{
				id = "exscoreIr"..i, src = 5, x = 2401, y = 510, w = 242, h = 15, divx = 11, digit = 4, ref = ref[i]
			})
		end
	end
	
	parts.destination = {}
	
	-- IR情報
	table.insert(parts.destination,	{
		id = "qco_ir_frame", op = {2, 51}, dst = {
			{x = irFramePosX, y = irFramePosY, w = 560, h = 160},
		}
	})
	table.insert(parts.destination,	{
		id = "ir_rank2",
		draw = function()
			local totalPlayerNum = main_state.number(180)
			local myRank = main_state.number(179)
			local rankPer = myRank / totalPlayerNum * 100
			return main_state.option(2) and main_state.option(51) and rankPer >= 10
		end,
		dst = {
			{x = irFramePosX + 19, y = irFramePosY + 33, w = 43, h = 42},
		}
	})
	-- 未プレイ
	table.insert(parts.destination,	{
		id = "qcoLoading",
		draw = function()
			local myRank = main_state.number(179)
			return main_state.option(2) and main_state.option(51) and myRank == 0
		end,
		dst = {
			{x = irFramePosX + 90, y = irFramePosY + 30, w = 75, h = 44},
		}
	})
	-- 自身の順位が上位10%の時に表示
	table.insert(parts.destination,	{
		id = "ir_eliteRank",
		draw = function()
			local totalPlayerNum = main_state.number(180)
			local myRank = main_state.number(179)
			local rankPer = myRank / totalPlayerNum * 100
			return main_state.option(2) and main_state.option(51) and rankPer <= 10 and myRank ~= 0
		end,
		dst = {
			{x = irFramePosX + 19, y = irFramePosY + 33, w = 43, h = 42},
		}
	})
	table.insert(parts.destination,	{
		id = "ir_totalplayer2", op = {2, 51}, dst = {
			{x = irFramePosX + 300, y = irFramePosY + 33, w = 43, h = 42},
		}
	})
	-- ロード中または失敗
	-- op606: IR_WAITING
	do
		local posX = {90, 370}
		for i = 1, 2, 1 do
			table.insert(parts.destination,{
				id = "qcoLoading", op = {2, 51, 606}, dst = {
					{time = 0, x = irFramePosX + posX[i], y = irFramePosY + 30, w = 75, h = 44},
					{time = 1000, a = 50},
					{time = 2000, a = 255}
				}
			})
		end
	end
	
	if isIrClearrateFullcomborate() then
		-- クリアレート
		table.insert(parts.destination,	{
			id = "qco_cr_frame", op = {2, 51}, dst = {
				{x = crFramePosX, y = crFramePosY, w = 410, h = 70}
			}
		})
		table.insert(parts.destination,	{
			id = "qco_cr_per", op = {2, 51, -606}, dst = {
				{x = crFramePosX + 320, y = crFramePosY + 5, w = 100, h = 70}
			}
		})
		table.insert(parts.destination,	{
			id = "ir_clearrate2", op = {2, 51}, dst = {
				{x = crFramePosX + 203, y = crFramePosY + 15, w = 43, h = 42}
			}
		})
		table.insert(parts.destination,	{
			id = "ir_clearrate2_ad", op = {2, 51}, dst = {
				{x = crFramePosX + 342, y = crFramePosY + 15, w = 31, h = 31}
			}
		})
		table.insert(parts.destination, {
			id = "qcoClearLoading", op = {2, 51, 606}, dst = {
				{time = 0, x = crFramePosX + 270, y = crFramePosY + 15, w = 75, h = 44},
				{time = 1000, a = 50},
				{time = 2000, a = 255}
			}
		})
		-- フルコン率
		table.insert(parts.destination,	{
			id = "qco_fc_frame", op = {2, 51}, dst = {
				{x = fcFramePosX, y = fcFramePosY, w = 410, h = 70},
			}
		})
		table.insert(parts.destination,	{
			id = "qco_fc_per", op = {2, 51, -606}, dst = {
				{x = fcFramePosX + 320, y = fcFramePosY + 5, w = 100, h = 70},
			}
		})
		table.insert(parts.destination,	{
			id = "ir_fcrate2", op = {2, 51}, dst = {
				{x = fcFramePosX + 203, y = fcFramePosY + 15, w = 43, h = 42},
			}
		})
		table.insert(parts.destination,	{
			id = "ir_fcrate2_ad", op = {2, 51}, dst = {
				{x = fcFramePosX + 342, y = fcFramePosY + 15, w = 31, h = 31},
			}
		})
		table.insert(parts.destination, {
			id = "qcoFCLoading", op = {2, 51, 606}, dst = {
				{time = 0, x = fcFramePosX + 270, y = fcFramePosY + 15, w = 75, h = 44},
				{time = 1000, a = 50},
				{time = 2000, a = 255}
			}
		})
	elseif isIrRanking() then
		table.insert(parts.destination, {
			id = "qco_ranking_frame", op = {2, 51}, dst = {
				{x = posRankingFrame[1], y = posRankingFrame[2], w = 410, h = 160},
			}
		})
		do
			-- 1位から5位のy座標
			local PosY = {112, 85, 59, 33, 6}
			for i = 1, 5, 1 do
				-- 自身の場合は強調表示する
				table.insert(parts.destination, {
					id = "qcoMyRank", draw = function()
						return main_state.option(2) and main_state.option(51) and main_state.number(179) == i
					end, dst = {
						{x = posRankingFrame[1] - 6, y = posRankingFrame[2] + PosY[i] - 12, w = 420, h = 40},
					}
				})
				-- 名前
				table.insert(parts.destination,{
					id = "irRankName"..i, op = {2, 51}, dst = {
						{x = posRankingFrame[1] + 40, y = posRankingFrame[2] + PosY[i] - 3, w = 120, h = 16},
					}
				})
				-- EXSCORE
				table.insert(parts.destination,{
					id = "exscoreIr"..i, op = {2, 51}, dst = {
						{x = posRankingFrame[1] + 170, y = posRankingFrame[2] + PosY[i], w = 16, h = 15},
					}
				})
				-- クリア状況
				table.insert(parts.destination,{
					id = "clearTypeIr"..i, op = {2, 51}, dst = {
						{x = posRankingFrame[1] + 295, y = posRankingFrame[2] + PosY[i] - 3, w = 110, h = 22},
					}
				})
				-- クリアランク
				do
					local refRate = {100, 88, 77, 66, 55, 44, 33, 22, 0}
					local wd = {"AAA", "AA", "A", "B", "C", "D", "E", "F"}
					for j = 1, 8, 1 do
						table.insert(parts.destination, {
							id = "qco"..wd[j],
							draw = function()
								-- exスコアを取得
								local exScore = main_state.number(379 + i)
								-- 最大exスコアを取得
								local maxExScore = main_state.number(74) * 2
								local rankRate = (exScore / maxExScore) * 100
								return main_state.option(2) and main_state.option(51) and rankRate <= refRate[j] and rankRate > refRate[j + 1]
							end,
							dst = {
								{x = posRankingFrame[1] + 240, y = posRankingFrame[2] + PosY[i] - 3, w = 59, h = 22},
							}
						})
					end
				end
			end
		end
	end
	
	return parts
end

return {
	load = load
}