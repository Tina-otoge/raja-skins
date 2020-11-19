--[[
	リザルト開始時のアニメーション
]]

-- コース中のリザルトなのか？（op280~293が機能しない？）
local function isCourse()
	-- コース1タイトルがあればコースであると判断
	if main_state.text(150) ~= "" then
		return true
	else
		return false
	end
end

local function load()
	local parts = {}

	-- コース中のリザルトなのか？（op280~293が機能しないため）
	local isCourse = isCourse()
	
	parts.image = {
		{id = "frameDot", src = 3, x = 2000, y = 0, w = 1, h = 1},
		{id = "preClearType", src = 3, x = 0, y = 0, w = 1920, h = 3630, divy = 11, len = 11, ref = 370, act = 370},
		{id = "stripe", src = 3, x = 0, y = 3630, w = 2500, h = 170},

		{id = "stageFailed", src = 3, x = 2000, y = 330, w = 1920, h = 330},
		{id = "stagePass", src = 3, x = 2000, y = 660, w = 1920, h = 330},
	}
	
	parts.destination = {}

	-- まずは線を左右に伸ばす
	table.insert(parts.destination, {
		id = "frameDot", loop = -1, dst = {
			{time = 0, x = 0, y = 379, w = 1, h = 3},
			{time = 500, w = 1920},
			{time = 1500},
			{time = 2000, x = 0, w = 1}
		}
	})
	table.insert(parts.destination, {
		id = "frameDot", loop = -1, dst = {
			{time = 0, x = 1920, y = 697, w = 1, h = 3},
			{time = 500, x = 0, w = 1920},
			{time = 1500},
			{time = 2000, x = 1920, w = 1}
		}
	})

	-- 次に半透明な背景を追加
	table.insert(parts.destination, {
		id = -110, loop = -1, dst = {
			{time = 500, x = 0, y = 1080 / 2, w = 1920, h = 1, a = 200, acc = 2},
			{time = 1000, y = 382, h = 315},
			{time = 1500},
			{time = 2000, y = 1080 / 2, w = 1920, h = 1}
		}
	})

	-- 次に波線
	table.insert(parts.destination, {
		id = "stripe", loop = -1, dst = {
			{time = 1000, x = 0, y = 455, w = 2500, h = 170, acc = 2, a = 150},
			{time = 1500, x = -100},
			{time = 2500, a = 0}
		}
	})

	if isCourse == false then
		-- 開始時にクリア状況をアニメーション（コース時には反映されない）
		table.insert(parts.destination, {
			id = "preClearType", loop = -1, dst = {
				{time = 1000, x = 0 - (1920 / 2), y = 370 - (330 / 2), w = 1920 * 2, h = 330 * 2, acc = 2, a = 50},
				{time = 1200, x = 0, y = 370, w = 1920, h = 330, a = 255},
				{time = 1500},
				{time = 2000, a = 0}
			}
		})
	elseif isCourse == true then
		-- 段位などのコース時に表示
		-- op90 : クリア
		-- op91 : クリアしっぱい
		local op = {90, 91}
		local wd = {"stagePass", "stageFailed"}
		for i = 1, 2, 1 do
			table.insert(parts.destination, {
				id = wd[i], loop = -1, op = {op[i]}, dst = {
					{time = 1000, x = 0 - (1920 / 2), y = 370 - (330 / 2), w = 1920 * 2, h = 330 * 2, acc = 2, a = 50},
					{time = 1200, x = 0, y = 370, w = 1920, h = 330, a = 255},
					{time = 1500},
					{time = 2000, a = 0}
				}
			})
		end
	end

--[[ TODO 同じ曲がコースに存在するとバグってしまうので通過したかどうかだけ判断
	do
		-- 各ステージの曲名
		local op = {150, 151, 152, 153, 154}
		for i = 1, 5, 1 do
			table.insert(parts.destination, {
				id = i .."Pass", draw = function()
					-- ステージ名の取得
					local title = main_state.text(op[i])
					local playedTitle = main_state.text(10)
					-- ステージ名が存在してかつクリア状態
					return title == playedTitle and main_state.option(90)
				end, dst = {
					{time = 1000, x = 0 - (1920 / 2), y = 370 - (330 / 2), w = 1920 * 2, h = 330 * 2, acc = 2, a = 50},
					{time = 1200, x = 0, y = 370, w = 1920, h = 330, a = 255},
					{time = 1500},
					{time = 2000, a = 0}
				}
			})
		end
	end
]]

	return parts
end

return {
	load = load
}