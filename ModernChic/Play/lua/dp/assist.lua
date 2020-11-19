--[[
	レーンカバー、リフトカバー、hiddenカバー、緑数字
	スコア差分の配置
--]]

local function isDiffTargetOff()
	return skin_config.option["ターゲット差分表示"] == 900
end
local function isDiffTargetOn()
	return skin_config.option["ターゲット差分表示"] == 901
end
local function isTargetRank()
	return skin_config.option["ターゲット差分の種類"] == 903
end
local function isTargetMybest()
	return skin_config.option["ターゲット差分の種類"] == 904
end
local function isDiffTargetTypeA()
	return skin_config.option["ターゲット差分表示位置"] == 906
end
local function isDiffTargetTypeB()
	return skin_config.option["ターゲット差分表示位置"] == 907
end
local function isDiffTargetTypeC()
	return skin_config.option["ターゲット差分表示位置"] == 908
end
local function isJudgeTimingOff()
	return skin_config.option["判定タイミング表示"] == 910
end
local function isJudgeTimingOn()
	return skin_config.option["判定タイミング表示"] == 911
end
local function isJudgeTimingWord()
	return skin_config.option["判定タイミングの種類"] == 913
end
local function isJudgeTimingMs()
	return skin_config.option["判定タイミングの種類"] == 914
end
local function isJudgeTimingTypeA()
	return skin_config.option["判定タイミング表示位置"] == 915
end
local function isJudgeTimingTypeB()
	return skin_config.option["判定タイミング表示位置"] == 916
end
local function isJudgeTimingTypeC()
	return skin_config.option["判定タイミング表示位置"] == 917
end

-- ターゲット差分とfast/slow表示位置の決定
-- playsSide 0:1P 1:2P
local function setDifTimPosition(playSide)
	-- ターゲット差分表示位置
	local difftargetPosition
	-- fast/slow表示位置
	local judgeTimingPosition
	local dpx = 0
	local fpx = 0
	
	-- 表示位置によってx値を変える
	if playSide == 0 then
		-- 左
		if isDiffTargetTypeB() then
			dpx = -165
		elseif isDiffTargetTypeC() then
			dpx = 520
		end
		if isJudgeTimingTypeB() then
			fpx = -140
		elseif isJudgeTimingTypeC() then
			fpx = 535
		end
	elseif playSide == 1 then
		-- 右
		if isDiffTargetTypeB() then
			dpx = 565
		elseif isDiffTargetTypeC() then
			-- 使わないが一応残す
			dpx = 0
		end
		if isJudgeTimingTypeB() then
			fpx = 567
		elseif isJudgeTimingTypeC() then
			fpx = -55
		end
	end

	-- 差分表示位置
	if isDiffTargetOn() then
		if isDiffTargetTypeA() then
			difftargetPosition = {195, 253}
		elseif isDiffTargetTypeB() then
			difftargetPosition = {dpx, 170}
		elseif isDiffTargetTypeC() then
			difftargetPosition = {dpx, 170}
		end
	end
	-- 判定タイミング位置
	if isJudgeTimingOn() then
		if isJudgeTimingTypeA() then
			judgeTimingPosition = {185, 250}
		elseif isJudgeTimingTypeB() then
			judgeTimingPosition = {fpx, 200}
		elseif isJudgeTimingTypeC() then
			judgeTimingPosition = {fpx, 200}
		end
	end
	if isDiffTargetOn() then
		if isJudgeTimingOn() then
			-- 両方TypeAで表示
			if isDiffTargetTypeA() then
				if isJudgeTimingTypeA() then
					difftargetPosition = {100, 253}
					judgeTimingPosition = {250, 253}
				end
			end
		end
	end
	return difftargetPosition, judgeTimingPosition
end

local function load(laneLeftPosX, laneRightPosX, notesPositionY)
	local parts = {}
	
	parts.image = {
		-- FAST(TYPEAのみ)
		{id = "fast", src = 1, x = 380, y = 1020, w = 95, h = 20},
		-- SLOW（TYPEAのみ）
		{id = "slow", src = 1, x = 380, y = 1040, w = 95, h = 20},

		-- FA（TYPEB,C）
		{id = "fa", src = 1, x = 407, y = 1060, w = 48, h = 20},
		-- SL（TYPEB,C）
		{id = "sl", src = 1, x = 407, y = 1080, w = 48, h = 20},
	}
	
	parts.value = {
		-- マイベストとのEXSCORE差分
		-- zeropadding 1:0で埋める 2:裏0で埋める
		{id = "diffMybestTarget", src = 1, x = 720, y = 1040, w = 288, h = 40, divx = 12, divy = 2, digit = 5, ref = 152, zeropadding = 1},
		-- ターゲットとのEXSCORE差分
		{id = "diffExscoreTarget", src = 1, x = 720, y = 1040, w = 288, h = 40, divx = 12, divy = 2, digit = 5, ref = 153, zeropadding = 1},
		-- 判定タイミングのズレ（ミリ）
		{id = "judgeTimingMsLeft", src = 1, x = 720, y = 1100, w = 288, h = 40, divx = 12, divy = 2, digit = 4, ref = 525, zeropadding = 1},
		{id = "judgeTimingMsRight", src = 1, x = 720, y = 1100, w = 288, h = 40, divx = 12, divy = 2, digit = 4, ref = 526, zeropadding = 1},
	}
	
	parts.destination = {}
	
	do
		-- ターゲット差分
		-- op911:ターゲット差分表示あり
		-- timer46:TIMER_JUDGE_1P
		-- offset41: 判定文字の高さ
		-- ターゲット差分表示位置, fast/slow表示位置
		local difftargetPositionL, judgeTimingPositionL = setDifTimPosition(0)
		local difftargetPositionR, judgeTimingPositionR = setDifTimPosition(1)

		if isDiffTargetOn() then
			if isTargetRank() then
				-- TYPECの場合は一つのみ
				if isDiffTargetTypeC() then
					table.insert(parts.destination,	{
						id = "diffExscoreTarget", offsets = {3, 41}, op = {32}, loop = -1, timer = 46, dst = {
							{time = 0, x = laneLeftPosX + difftargetPositionL[1], y = notesPositionY + difftargetPositionL[2], w = 24, h = 20},
							{time = 500}
						}
					})
				elseif isDiffTargetTypeA() or isDiffTargetTypeB() then
					-- 目標ランク
					table.insert(parts.destination,	{
						id = "diffExscoreTarget", offsets = {3, 41}, op = {32}, loop = -1, timer = 46, dst = {
							{time = 0, x = laneLeftPosX + difftargetPositionL[1], y = notesPositionY + difftargetPositionL[2], w = 24, h = 20},
							{time = 500}
						}
					})
					table.insert(parts.destination,	{
						id = "diffExscoreTarget", offsets = {3, 41}, op = {32}, loop = -1, timer = 47, dst = {
							{time = 0, x = laneRightPosX + difftargetPositionR[1], y = notesPositionY + difftargetPositionR[2], w = 24, h = 20},
							{time = 500}
						}
					})
				end
			elseif isTargetMybest() then
				-- TYPECの場合は一つのみ
				if isDiffTargetTypeC() then
					table.insert(parts.destination,	{
						id = "diffMybestTarget", offsets = {3, 41}, op = {32}, loop = -1, timer = 46, dst = {
							{time = 0, x = laneLeftPosX + difftargetPositionL[1], y = notesPositionY + difftargetPositionL[2], w = 24, h = 20},
							{time = 500}
						}
					})
				elseif isDiffTargetTypeA() or isDiffTargetTypeB() then
					-- 自己べターゲット
					table.insert(parts.destination,	{
						id = "diffMybestTarget", offsets = {3, 41}, op = {32}, loop = -1, timer = 46, dst = {
							{time = 0, x = laneLeftPosX + difftargetPositionL[1], y = notesPositionY + difftargetPositionL[2], w = 24, h = 20},
							{time = 500}
						}
					})
					table.insert(parts.destination,	{
						id = "diffMybestTarget", offsets = {3, 41}, op = {32}, loop = -1, timer = 47, dst = {
							{time = 0, x = laneRightPosX + difftargetPositionR[1], y = notesPositionY + difftargetPositionR[2], w = 24, h = 20},
							{time = 500}
						}
					})
				end
			end
		end
		-- 判定タイミング表示
		-- op911:判定タイミング表示あり
		-- op915:判定タイミングTYPEA
		-- op916: tyoeB
		-- op917: typeC

		-- op1242 : 1P_EARLY
		-- op1243 : 1P_LAT
		-- op1262 : 2P_EARLY
		-- op1263 : 2P_LATE
		-- op32: オートプレイではない
		if isJudgeTimingOn() then
			if isJudgeTimingWord() then
				if isJudgeTimingTypeC() then
					-- FA/SL
					-- 左
					table.insert(parts.destination,	{
						id = "fa", offsets = {3, 41}, op = {1242, 32}, loop = -1, timer = 46, dst = {
							{time = 0, x = laneLeftPosX + judgeTimingPositionL[1], y = notesPositionY + judgeTimingPositionL[2], w = 48, h = 20},
							{time = 500}
						}
					})
					table.insert(parts.destination,	{
						id = "sl", offsets = {3, 41}, op = {1243, 32}, loop = -1, timer = 46, dst = {
							{time = 0, x = laneLeftPosX + judgeTimingPositionL[1], y = notesPositionY + judgeTimingPositionL[2], w = 48, h = 20},
							{time = 500}
						}
					})
					-- 右
					table.insert(parts.destination,	{
						id = "fa", offsets = {3, 41}, op = {1262, 32}, loop = -1, timer = 47, dst = {
							{time = 0, x = laneRightPosX + judgeTimingPositionR[1], y = notesPositionY + judgeTimingPositionR[2], w = 48, h = 20},
							{time = 500}
						}
					})
					table.insert(parts.destination,	{
						id = "sl", offsets = {3, 41}, op = {1263, 32}, loop = -1, timer = 47, dst = {
							{time = 0, x = laneRightPosX + judgeTimingPositionR[1], y = notesPositionY + judgeTimingPositionR[2], w = 48, h = 20},
							{time = 500}
						}
					})
				elseif isJudgeTimingTypeA() or isJudgeTimingTypeB() then
					-- FAST/SLOW
					-- 左
					table.insert(parts.destination,	{
						id = "fast", offsets = {3, 41}, op = {1242, 32}, loop = -1, timer = 46, dst = {
							{time = 0, x = laneLeftPosX + judgeTimingPositionL[1], y = notesPositionY + judgeTimingPositionL[2], w = 95, h = 20},
							{time = 500}
						}
					})
					table.insert(parts.destination,	{
						id = "slow", offsets = {3, 41}, op = {1243, 32}, loop = -1, timer = 46, dst = {
							{time = 0, x = laneLeftPosX + judgeTimingPositionL[1], y = notesPositionY + judgeTimingPositionL[2], w = 95, h = 20},
							{time = 500}
						}
					})
					-- 右
					table.insert(parts.destination,	{
						id = "fast", offsets = {3, 41}, op = {1262, 32}, loop = -1, timer = 47, dst = {
							{time = 0, x = laneRightPosX + judgeTimingPositionR[1], y = notesPositionY + judgeTimingPositionR[2], w = 95, h = 20},
							{time = 500}
						}
					})
					table.insert(parts.destination,	{
						id = "slow", offsets = {3, 41}, op = {1263, 32}, loop = -1, timer = 47, dst = {
							{time = 0, x = laneRightPosX + judgeTimingPositionR[1], y = notesPositionY + judgeTimingPositionR[2], w = 95, h = 20},
							{time = 500}
						}
					})
				end
			elseif isJudgeTimingMs() then
				-- +-ms
				if isJudgeTimingTypeC() then
					-- 左
					table.insert(parts.destination,	{
						id = "judgeTimingMsLeft", offsets = {3, 41}, op = {32}, loop = -1, timer = 46, dst = {
							{time = 0, x = laneLeftPosX + judgeTimingPositionL[1], y = notesPositionY + judgeTimingPositionL[2], w = 12, h = 20},
							{time = 500}
						}
					})
					-- 右
					table.insert(parts.destination,	{
						id = "judgeTimingMsRight", offsets = {3, 41}, op = {32}, loop = -1, timer = 47, dst = {
							{time = 0, x = laneRightPosX + judgeTimingPositionR[1], y = notesPositionY + judgeTimingPositionR[2], w = 12, h = 20},
							{time = 500}
						}
					})
				elseif isJudgeTimingTypeA() or isJudgeTimingTypeB() then
					-- 左
					table.insert(parts.destination,	{
						id = "judgeTimingMsLeft", offsets = {3, 41}, op = {32}, loop = -1, timer = 46, dst = {
							{time = 0, x = laneLeftPosX + judgeTimingPositionL[1], y = notesPositionY + judgeTimingPositionL[2], w = 24, h = 20},
							{time = 500}
						}
					})
					-- 右
					table.insert(parts.destination,	{
						id = "judgeTimingMsRight", offsets = {3, 41}, op = {32}, loop = -1, timer = 47, dst = {
							{time = 0, x = laneRightPosX + judgeTimingPositionR[1], y = notesPositionY + judgeTimingPositionR[2], w = 24, h = 20},
							{time = 500}
						}
					})
				end
			end
		end
	end
	
	return parts
end

return {
	load = load
}