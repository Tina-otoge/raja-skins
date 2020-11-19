--[[
	アシストオプションを表示
--]]
local function load()
	local parts = {}

	-- カスタムタイマー
	local sw1 = get_customTimer_id()
	local sw2 = get_customTimer_id()
	local sw3 = get_customTimer_id()
	local sw4 = get_customTimer_id()
	local sw5 = get_customTimer_id()
	local sw6 = get_customTimer_id()
	local sw7 = get_customTimer_id()
	parts.customTimers = {}
--[[
	do
		local op = {101, 102, 103, 104, 105, 106, 107}
		for i = 1, 7, 1 do
			table.insert(parts.customTimers, {
				-- アシストオプションを開いていて　かつ　キーを押している
				id = sw ..i, timer = timer_util.timer_observe_boolean(function()
					-- アシストオプションを開いている
					local open = main_state.timer(22)
					local switch = main_state.timer(op[i])
					if open == main_state.timer_off_value or switch == main_state.timer_off_value then
						return false
					else
						return true
					end
				end)
			})
		end
	end
]]
	
	parts.image = {
		-- アシストオプション画面用
		{id = "assist-top", src = 3, x = 0, y = 0, w = 1920, h = 565},
		{id = "assist-bottom", src = 3, x = 0, y = 570, w = 1920, h = 565},
		{id = "assist-dia", src = 3, x = 0, y = 1150, w = 1950, h = 50},
		{id = "assist-title", src = 3, x = 0, y = 1200, w = 1521, h = 50},
		{id = "assist-menu", src = 3, x = 0, y = 1260, w = 618, h = 642},
		{id = "assist-info", src = 3, x = 630, y = 1260, w = 628, h = 83},
		{id = "assist-config", src = 3, x = 630, y = 1350, w = 558, h = 86},
		{id = "assist-info-l", src = 3, x = 630, y = 1450, w = 550, h = 732},
		{id = "assist-info-r", src = 3, x = 1260, y = 1450, w = 550, h = 732},
		{id = "assist-switch", src = 3, x = 1260, y = 1260, w = 70, h = 18},
		{id = "assist-selector2-1", src = 3, x = 0, y = 1937, w = 143, h = 48},
		{id = "assist-selector2-2", src = 3, x = 0, y = 1913, w = 143, h = 48},
		{id = "assist-keyflash", src = 3, x = 157, y = 1910, w = 43, h = 65},
	}
	
	parts.imageset = {
		{id = "option-exjudge", ref = 301, images = {"assist-selector2-1", "assist-selector2-2"}},
		{id = "option-judgearea", ref = 303, images = {"assist-selector2-1", "assist-selector2-2"}},
		{id = "option-marknote", ref = 305, images = {"assist-selector2-1", "assist-selector2-2"}},
		{id = "option-nomine", ref = 307, images = {"assist-selector2-1", "assist-selector2-2"}},
		{id = "option-constant", ref = 302, images = {"assist-selector2-1", "assist-selector2-2"}},
		{id = "option-legacy", ref = 304, images = {"assist-selector2-1", "assist-selector2-2"}},
		{id = "option-bpmguide", ref = 306, images = {"assist-selector2-1", "assist-selector2-2"}},
	}
	
	parts.destination = {
		{id = "assist-top", loop = 100, op = {22}, timer = 22, dst = {
			{time = 0, x = 0, y = 1080, w = 1920, h = 565},
			{time = 100, y = 515, acc = 2}
		}},
		{id = "assist-bottom", loop = 100, op = {22}, timer = 22, dst = {
			{time = 0, x = 0, y = -565, w = 1920, h = 565},
			{time = 100, y = 0, acc = 2}
		}},
		-- ウィンドウ閉じる
		{id = "assist-top", loop = 100, timer = 32, dst = {
			{time = 0, x = 0, y = 515, w = 1920, h = 565},
			{time = 100, y = 1080, acc = 2}
		}},
		{id = "assist-bottom", loop = 100, timer = 32, dst = {
			{time = 0, x = 0, y = 0, w = 1920, h = 565},
			{time = 100, y = -565, acc = 2}
		}},
		-- 左に流れる
		{id = "assist-dia", loop = 100, op = {22}, timer = 22, dst = {
			{time = 100, x = 0, y = 58, w = 1950, h = 50},
			{time = 50000, x = -1950}
		}},
		{id = "assist-dia", loop = 100, op = {22}, timer = 22, dst = {
			{time = 100, x = 1950, y = 58, w = 1950, h = 50},
			{time = 50000, x = 0}
		}},
		-- 右に流れる
		{id = "assist-dia", loop = 100, op = {22}, timer = 22, dst = {
			{time = 100, x = 0, y = 970, w = 1950, h = 50},
			{time = 50000, x = 1950}
		}},
		{id = "assist-dia", loop = 100, op = {22}, timer = 22, dst = {
			{time = 100, x = -1950, y = 970, w = 1950, h = 50},
			{time = 50000, x = 0}
		}},
		{id = "assist-title", loop = 100, op = {22}, timer = 22, dst = {
			{time = 100, x = 198, y = 58, w = 1521, h = 50}
		}},
		{id = "assist-menu", loop = 100, op = {22}, timer = 22, dst = {
			{time = 100, x = 651, y = 201, w = 618, h = 642}
		}},
		-- 切り替え点滅上段
		{id = "assist-switch", loop = 100, op = {22}, timer = 22, dst = {
			{time = 100, x = 820, y = 623, w = 70, h = 18},
			{time = 1100, a = 100},
			{time = 2100, a = 255}
		}},
		{id = "assist-switch", loop = 100, op = {22}, timer = 22, dst = {
			{time = 100, x = 926, y = 623, w = 70, h = 18},
			{time = 1100, a = 100},
			{time = 2100, a = 255}
		}},
		{id = "assist-switch", loop = 100, op = {22}, timer = 22, dst = {
			{time = 100, x = 1032, y = 623, w = 70, h = 18},
			{time = 1100, a = 100},
			{time = 2100, a = 255}
		}},
		-- 切り替え点滅下段
		{id = "assist-switch", loop = 100, op = {22}, timer = 22, dst = {
			{time = 100, x = 767, y = 440, w = 70, h = 18},
			{time = 1100, a = 100},
			{time = 2100, a = 255}
		}},
		{id = "assist-switch", loop = 100, op = {22}, timer = 22, dst = {
			{time = 100, x = 873, y = 440, w = 70, h = 18},
			{time = 1100, a = 100},
			{time = 2100, a = 255}
		}},
		{id = "assist-switch", loop = 100, op = {22}, timer = 22, dst = {
			{time = 100, x = 979, y = 440, w = 70, h = 18},
			{time = 1100, a = 100},
			{time = 2100, a = 255}
		}},
		{id = "assist-switch", loop = 100, op = {22}, timer = 22, dst = {
			{time = 100, x = 1085, y = 440, w = 70, h = 18},
			{time = 1100, a = 100},
			{time = 2100, a = 255}
		}},
		{id = "assist-info", loop = 100, op = {22}, timer = 22, dst = {
			{time = 100, x = 646, y = 915, w = 628, h = 83}
		}},
		{id = "assist-config", loop = 100, op = {22}, timer = 22, dst = {
			{time = 100, x = 52, y = 915, w = 558, h = 86}
		}},
		{id = "assist-info-l", loop = 100, op = {22}, timer = 22, dst = {
			{time = 100, x = 56, y = 162, w = 550, h = 732}
		}},
		{id = "assist-info-r", loop = 100, op = {22}, timer = 22, dst = {
			{time = 100, x = 1315, y = 162, w = 550, h = 732}
		}},
		{id = "assist-config", loop = 100, op = {22}, timer = 22, dst = {
			{time = 100, x = 1311, y = 915, w = 558, h = 86}
		}},
		-- TODO キーフラッシュが動かない
--[[
		{id = "assist-keyflash", timer = sw1, dst = {
			{time = 0, x = 780, y = 418, w = 43, h = 65}
		}},
]]
		-- ON,OFF切り替え
		{id = "option-exjudge", loop = 100, op = {22}, timer = 22, blend = 2, dst = {
			{time = 100, x = 653, y = 204, w = 143, h = 48}
		}},
		{id = "option-judgearea", loop = 100, op = {22}, timer = 22, blend = 2, dst = {
			{time = 100, x = 810, y = 204, w = 143, h = 48}
		}},
		{id = "option-marknote", loop = 100, op = {22}, timer = 22, blend = 2, dst = {
			{time = 100, x = 967, y = 204, w = 143, h = 48}
		}},
		{id = "option-nomine", loop = 100, op = {22}, timer = 22, blend = 2, dst = {
			{time = 100, x = 1124, y = 204, w = 143, h = 48}
		}},
		{id = "option-constant", loop = 100, op = {22}, timer = 22, blend = 2, dst = {
			{time = 100, x = 673, y = 738, w = 143, h = 48}
		}},
		{id = "option-legacy", loop = 100, op = {22}, timer = 22, blend = 2, dst = {
			{time = 100, x = 889, y = 738, w = 143, h = 48}
		}},
		{id = "option-bpmguide", loop = 100, op = {22}, timer = 22, blend = 2, dst = {
			{time = 100, x = 1106, y = 738, w = 143, h = 48}
		}},
	}
	
	return parts
end

return {
	load = load
}