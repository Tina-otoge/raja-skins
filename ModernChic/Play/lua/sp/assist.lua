--[[
	レーンカバー、リフトカバー、hiddenカバー、緑数字
	スコア差分の配置
--]]

local function isDiffTargetOff()
	return skin_config.option["ターゲット差分表示"] == 910
end
local function isDiffTargetOn()
	return skin_config.option["ターゲット差分表示"] == 911
end
local function isTargetRank()
	return skin_config.option["ターゲット差分の種類"] == 983
end
local function isTargetMybest()
	return skin_config.option["ターゲット差分の種類"] == 984
end
local function isDiffTargetTypeA()
	return skin_config.option["ターゲット差分表示位置"] == 915
end
local function isDiffTargetTypeB()
	return skin_config.option["ターゲット差分表示位置"] == 916
end
local function isDiffTargetTypeC()
	return skin_config.option["ターゲット差分表示位置"] == 917
end
local function isDiffTargetTypeD()
	return skin_config.option["ターゲット差分表示位置"] == 918
end
local function isJudgeTimingOff()
	return skin_config.option["判定タイミング表示"] == 920
end
local function isJudgeTimingOn()
	return skin_config.option["判定タイミング表示"] == 921
end
local function isJudgeTimingWord()
	return skin_config.option["判定タイミングの種類"] == 923
end
local function isJudgeTimingMs()
	return skin_config.option["判定タイミングの種類"] == 924
end
local function isJudgeTimingTypeA()
	return skin_config.option["判定タイミング表示位置"] == 925
end
local function isJudgeTimingTypeB()
	return skin_config.option["判定タイミング表示位置"] == 926
end
local function isJudgeTimingTypeC()
	return skin_config.option["判定タイミング表示位置"] == 927
end
local function isJudgeTimingTypeD()
	return skin_config.option["判定タイミング表示位置"] == 928
end

-- ターゲット差分とfast/slow表示位置の決定
local function setDifTimPosition()
	-- ターゲット差分表示位置
	local difftargetPosition
	-- fast/slow表示位置
	local judgeTimingPosition
	
	-- 表示位置によってx値を変える
	local dpx
	local fpx
	if is_left_position() then
		dpx = 520
		fpx = 520
	elseif is_right_position() then
		dpx = -140
		fpx = -113
	end
	
	-- 差分表示位置
	if isDiffTargetOn() then
		if isDiffTargetTypeA() then
			difftargetPosition = {165, 253}
		elseif isDiffTargetTypeB() then
			difftargetPosition = {dpx, 160}
		elseif isDiffTargetTypeC() then
			difftargetPosition = {dpx, -20}
		elseif isDiffTargetTypeD() then
			difftargetPosition = {165, 123}
		end
	end
	if isJudgeTimingOn() then
		if isJudgeTimingTypeA() then
			judgeTimingPosition = {185, 250}
		elseif isJudgeTimingTypeB() then
			judgeTimingPosition = {fpx, 190}
		elseif isJudgeTimingTypeC() then
			judgeTimingPosition = {fpx, 10}
		elseif isJudgeTimingTypeD() then
			judgeTimingPosition = {185, 120}
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
			-- 両方TypeDで表示
			if isDiffTargetTypeD() then
				if isJudgeTimingTypeD() then
					difftargetPosition = {100, 123}
					judgeTimingPosition = {250, 123}
				end
			end
		end
	end
	return difftargetPosition, judgeTimingPosition
end

local function load(playsidePositionX, notesPositionY)
	local parts = {}
	
	parts.image = {
		-- FAST
		{id = "fast", src = 1, x = 1590, y = 410, w = 110, h = 20},
		-- SLOW
		{id = "slow", src = 1, x = 1590, y = 430, w = 110, h = 20},
	}
	
	parts.value = {
		-- マイベストとのEXSCORE差分
		-- zeropadding 1:0で埋める 2:裏0で埋める
		{id = "diffMybestTarget", src = 1, x = 1400, y = 201, w = 324, h = 40, divx = 12, divy = 2, digit = 5, ref = 152, zeropadding = 1},
		-- ターゲットとのEXSCORE差分
		{id = "diffExscoreTarget", src = 1, x = 1400, y = 201, w = 324, h = 40, divx = 12, divy = 2, digit = 5, ref = 153, zeropadding = 1},
		-- 判定タイミングのズレ（ミリ）
		{id = "judgeTiming-ms", src = 1, x = 1400, y = 121, w = 324, h = 40, divx = 12, divy = 2, digit = 4, ref = 525, zeropadding = 1},
	}
	
	parts.destination = {}
	
	do
		-- ターゲット差分
		-- op911:ターゲット差分表示あり
		-- timer46:TIMER_JUDGE_1P
		-- offset41: 判定文字の高さ
		-- ターゲット差分表示位置, fast/slow表示位置
		local difftargetPosition, judgeTimingPosition = setDifTimPosition()
		if isDiffTargetOn() then
			if isTargetRank() then
				-- 目標ランク
				table.insert(parts.destination,	{
					id = "diffExscoreTarget", offsets = {3, 41}, op = {911, 983, 32}, loop = -1, timer = 46, dst = {
						{time = 0, x = playsidePositionX + difftargetPosition[1], y = notesPositionY + difftargetPosition[2], w = 27, h = 20},
						{time = 500}
					}
				})
			elseif isTargetMybest() then
				-- 自己べターゲット
				table.insert(parts.destination,	{
					id = "diffMybestTarget", offsets = {3, 41}, op = {911, 984, 32}, loop = -1, timer = 46, dst = {
						{time = 0, x = playsidePositionX + difftargetPosition[1], y = notesPositionY + difftargetPosition[2], w = 27, h = 20},
						{time = 500}
					}
				})
			end
		end
		-- 判定タイミング表示
		-- op921:判定タイミング表示あり
		-- op1242:OPTION_1P_EARLY
		-- op32: オートプレイではない
		if isJudgeTimingOn() then
			if isJudgeTimingWord() then
				-- FAST/SLOW
				table.insert(parts.destination,	{
					id = "fast", offsets = {3, 41}, op = {921, 923, 1242, 32}, loop = -1, timer = 46, dst = {
						{time = 0, x = playsidePositionX + judgeTimingPosition[1], y = notesPositionY + judgeTimingPosition[2], w = 110, h = 20},
						{time = 500}
					}
				})
				-- op1243:OPTION_1P_LATE
				table.insert(parts.destination,	{
					id = "slow", offsets = {3, 41}, op = {921, 923, 1243, 32}, loop = -1, timer = 46, dst = {
						{time = 0, x = playsidePositionX + judgeTimingPosition[1], y = notesPositionY + judgeTimingPosition[2], w = 110, h = 20},
						{time = 500}
					}
				})
			elseif isJudgeTimingMs() then
				-- +-ms
				table.insert(parts.destination,	{
					id = "judgeTiming-ms", offsets = {3, 41}, op = {921, 924, 32}, loop = -1, timer = 46, dst = {
						{time = 0, x = playsidePositionX + judgeTimingPosition[1], y = notesPositionY + judgeTimingPosition[2], w = 27, h = 20},
						{time = 500}
					}
				})
			end
		end
	end
	
	return parts
end

return {
	load = load
}