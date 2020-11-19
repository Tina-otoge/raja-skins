--[[
	オプションメニュー表示用
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
				-- オプションを開いていて　かつ　キーを押している
				id = sw ..i, timer = timer_util.timer_observe_boolean(function()
					-- アシストオプションを開いている
					local open = main_state.timer(21)
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
		{id = "op-top", src = 6, x = 0, y = 0, w = 1920, h = 565},
		{id = "op-bottom", src = 6, x = 0, y = 570, w = 1920, h = 565},
		{id = "op-dia", src = 6, x = 0, y = 1150, w = 1950, h = 50},
		{id = "op-title", src = 6, x = 0, y = 1210, w = 853, h = 50},
		{id = "op-menu", src = 6, x = 0, y = 2050, w = 1273, h = 680},
		{id = "op-info", src = 6, x = 900, y = 1730, w = 1001, h = 91},
		{id = "op-up", src = 6, x = 900, y = 1210, w = 34, h = 13},
		{id = "op-down", src = 6, x = 900, y = 1230, w = 65, h = 13},
		{id = "op-dponly", src = 6, x = 1300, y = 1860, w = 627, h = 698},
		{id = "op-target-info", src = 6, x = 900, y = 1860, w = 303, h = 86},
		{id = "op-target-frame", src = 6, x = 0, y = 3529, w = 315, h = 300},
		{id = "op-target", src = 6, x = 0, y = 3230, w = 3465, h = 300, divx = 11, act = 77, len = 11, ref = 77},
		{id = "op-target-select", src = 6, x = 315, y = 3529, w = 315, h = 30},
		{id = "op-selector10-1", src = 6, x = 0, y = 2964, w = 143, h = 240},
		{id = "op-selector10-2", src = 6, x = 0, y = 2940, w = 143, h = 240},
		{id = "op-selector10-3", src = 6, x = 0, y = 2916, w = 143, h = 240},
		{id = "op-selector10-4", src = 6, x = 0, y = 2892, w = 143, h = 240},
		{id = "op-selector10-5", src = 6, x = 0, y = 2868, w = 143, h = 240},
		{id = "op-selector10-6", src = 6, x = 0, y = 2844, w = 143, h = 240},
		{id = "op-selector10-7", src = 6, x = 0, y = 2820, w = 143, h = 240},
		{id = "op-selector10-8", src = 6, x = 0, y = 2796, w = 143, h = 240},
		{id = "op-selector10-9", src = 6, x = 0, y = 2772, w = 143, h = 240},
		{id = "op-selector10-10", src = 6, x = 0, y = 2748, w = 143, h = 240},
		{id = "op-selector6-1", src = 6, x = 143, y = 2860, w = 143, h = 144},
		{id = "op-selector6-2", src = 6, x = 143, y = 2836, w = 143, h = 144},
		{id = "op-selector6-3", src = 6, x = 143, y = 2812, w = 143, h = 144},
		{id = "op-selector6-4", src = 6, x = 143, y = 2788, w = 143, h = 144},
		{id = "op-selector6-5", src = 6, x = 143, y = 2764, w = 143, h = 144},
		{id = "op-selector6-6", src = 6, x = 143, y = 2740, w = 143, h = 144},
		{id = "op-selector5-1", src = 6, x = 286, y = 2834, w = 143, h = 120},
		{id = "op-selector5-2", src = 6, x = 286, y = 2810, w = 143, h = 120},
		{id = "op-selector5-3", src = 6, x = 286, y = 2786, w = 143, h = 120},
		{id = "op-selector5-4", src = 6, x = 286, y = 2762, w = 143, h = 120},
		{id = "op-selector5-5", src = 6, x = 286, y = 2738, w = 143, h = 120},
		{id = "op-selector4-1", src = 6, x = 429, y = 2809, w = 143, h = 96},
		{id = "op-selector4-2", src = 6, x = 429, y = 2785, w = 143, h = 96},
		{id = "op-selector4-3", src = 6, x = 429, y = 2761, w = 143, h = 96},
		{id = "op-selector4-4", src = 6, x = 429, y = 2737, w = 143, h = 96},
		{id = "op-random-selector10-1", src = 6, x = 0, y = 1270, w = 156, h = 273},
		{id = "op-random-selector10-2", src = 6, x = 156, y = 1270, w = 156, h = 273},
		{id = "op-random-selector10-3", src = 6, x = 312, y = 1270, w = 156, h = 273},
		{id = "op-random-selector10-4", src = 6, x = 468, y = 1270, w = 156, h = 273},
		{id = "op-random-selector10-5", src = 6, x = 624, y = 1270, w = 156, h = 273},
		{id = "op-random-selector10-6", src = 6, x = 780, y = 1270, w = 156, h = 273},
		{id = "op-random-selector10-7", src = 6, x = 936, y = 1270, w = 156, h = 273},
		{id = "op-random-selector10-8", src = 6, x = 1092, y = 1270, w = 156, h = 273},
		{id = "op-random-selector10-9", src = 6, x = 1248, y = 1270, w = 156, h = 273},
		{id = "op-random-selector10-10", src = 6, x = 1404, y = 1270, w = 156, h = 273},
		{id = "op-gauge-selector6-1", src = 6, x = 0, y = 1550, w = 196, h = 178},
		{id = "op-gauge-selector6-2", src = 6, x = 196, y = 1550, w = 196, h = 178},
		{id = "op-gauge-selector6-3", src = 6, x = 392, y = 1550, w = 196, h = 178},
		{id = "op-gauge-selector6-4", src = 6, x = 588, y = 1550, w = 196, h = 178},
		{id = "op-gauge-selector6-5", src = 6, x = 784, y = 1550, w = 196, h = 178},
		{id = "op-gauge-selector6-6", src = 6, x = 980, y = 1550, w = 196, h = 178},
		{id = "op-dp-selector4-1", src = 6, x = 0, y = 1730, w = 196, h = 130},
		{id = "op-dp-selector4-2", src = 6, x = 196, y = 1730, w = 196, h = 130},
		{id = "op-dp-selector4-3", src = 6, x = 392, y = 1730, w = 196, h = 130},
		{id = "op-dp-selector4-4", src = 6, x = 588, y = 1730, w = 196, h = 130},
		{id = "op-hsfix-selector5-1", src = 6, x = 0, y = 1860, w = 171, h = 154},
		{id = "op-hsfix-selector5-2", src = 6, x = 171, y = 1860, w = 171, h = 154},
		{id = "op-hsfix-selector5-3", src = 6, x = 342, y = 1860, w = 171, h = 154},
		{id = "op-hsfix-selector5-4", src = 6, x = 513, y = 1860, w = 171, h = 154},
		{id = "op-hsfix-selector5-5", src = 6, x = 684, y = 1860, w = 171, h = 154},
	}
	
	parts.imageset = {
		{id = "option-random-1p-info", ref = 42, images = {"op-random-selector10-1", "op-random-selector10-2", "op-random-selector10-3", "op-random-selector10-4", "op-random-selector10-5", "op-random-selector10-6", "op-random-selector10-7", "op-random-selector10-8", "op-random-selector10-9", "op-random-selector10-10"}},
		{id = "option-random-1p", ref = 42, images = {"op-selector10-1", "op-selector10-2", "op-selector10-3", "op-selector10-4", "op-selector10-5", "op-selector10-6", "op-selector10-7", "op-selector10-8", "op-selector10-9", "op-selector10-10"}},
		{id = "option-random-2p-info", ref = 43, images = {"op-random-selector10-1", "op-random-selector10-2", "op-random-selector10-3", "op-random-selector10-4", "op-random-selector10-5", "op-random-selector10-6", "op-random-selector10-7", "op-random-selector10-8", "op-random-selector10-9", "op-random-selector10-10"}},
		{id = "option-random-2p", ref = 43, images = {"op-selector10-1", "op-selector10-2", "op-selector10-3", "op-selector10-4", "op-selector10-5", "op-selector10-6", "op-selector10-7", "op-selector10-8", "op-selector10-9", "op-selector10-10"}},
		{id = "option-gauge-info", ref = 40, images = {"op-gauge-selector6-1", "op-gauge-selector6-2", "op-gauge-selector6-3", "op-gauge-selector6-4", "op-gauge-selector6-5", "op-gauge-selector6-6"}},
		{id = "option-gauge", ref = 40, images = {"op-selector6-1", "op-selector6-2", "op-selector6-3", "op-selector6-4", "op-selector6-5", "op-selector6-6"}},
		{id = "option-dp-info", ref = 54, images = {"op-dp-selector4-1", "op-dp-selector4-2", "op-dp-selector4-3", "op-dp-selector4-4"}},
		{id = "option-dp", ref = 54, images = {"op-selector4-1", "op-selector4-2", "op-selector4-3", "op-selector4-4"}},
		{id = "option-hsfix-info", ref = 55, images = {"op-hsfix-selector5-1", "op-hsfix-selector5-2", "op-hsfix-selector5-3", "op-hsfix-selector5-4", "op-hsfix-selector5-5"}},
		{id = "option-hsfix", ref = 55, images = {"op-selector5-1", "op-selector5-2", "op-selector5-3", "op-selector5-4", "op-selector5-5"}},
	}
	
	parts.destination = {
		-- ウィンドウ開く
		{id = "op-top", loop = 100, op = {21}, timer = 21, dst = {
			{time = 0, x = 0, y = 1080, w = 1920, h = 565},
			{time = 100, y = 515, acc = 2}
		}},
		{id = "op-bottom", loop = 100, op = {21}, timer = 21, dst = {
			{time = 0, x = 0, y = -565, w = 1920, h = 565},
			{time = 100, y = 0, acc = 2}
		}},
		-- ウィンドウ閉じる
		{id = "op-top", loop = 100, timer = 31, dst = {
			{time = 0, x = 0, y = 515, w = 1920, h = 565},
			{time = 100, y = 1080, acc = 2}
		}},
		{id = "op-bottom", loop = 100, timer = 31, dst = {
			{time = 0, x = 0, y = 0, w = 1920, h = 565},
			{time = 100, y = -565, acc = 2}
		}},
		-- 左に流れる
		{id = "op-dia", loop = 100, op = {21}, timer = 21, dst = {
			{time = 100, x = 0, y = 58, w = 1950, h = 50},
			{time = 50000, x = -1950}
		}},
		{id = "op-dia", loop = 100, op = {21}, timer = 21, dst = {
			{time = 100, x = 1950, y = 58, w = 1950, h = 50},
			{time = 50000, x = 0}
		}},
		-- 右に流れる
		{id = "op-dia", loop = 100, op = {21}, timer = 21, dst = {
			{time = 100, x = 0, y = 970, w = 1950, h = 50},
			{time = 50000, x = 1950}
		}},
		{id = "op-dia", loop = 100, op = {21}, timer = 21, dst = {
			{time = 100, x = -1950, y = 970, w = 1950, h = 50},
			{time = 50000, x = 0}
		}},
		{id = "op-title", loop = 100, op = {21}, timer = 21, dst = {
			{time = 100, x = 533, y = 58, w = 853, h = 50}
		}},
		{id = "op-menu", loop = 100, op = {21}, timer = 21, dst = {
			{time = 100, x = 351, y = 156, w = 1273, h = 680}
		}},
		{id = "op-info", loop = 100, op = {21}, timer = 21, dst = {
			{time = 100, x = 487, y = 866, w = 1001, h = 91}
		}},
		{id = "op-target-info", loop = 100, op = {21}, timer = 21, dst = {
			{time = 100, x = 52, y = 790, w = 303, h = 86}
		}},
		-- 上段
		{id = "op-up", loop = 100, op = {21}, timer = 21, dst = {
			{time = 100, x = 850, y = 781, w = 34, h = 13},
			{time = 1100, a = 100},
			{time = 2100, a = 255}
		}},
		{id = "op-down", loop = 100, op = {21}, timer = 21, dst = {
			{time = 100, x = 940, y = 781, w = 65, h = 13, a = 100},
			{time = 1100, a = 255},
			{time = 2100, a = 100}
		}},
		{id = "op-up", loop = 100, op = {21}, timer = 21, dst = {
			{time = 100, x = 1062, y = 781, w = 34, h = 13},
			{time = 1100, a = 100},
			{time = 2100, a = 255}
		}},
		-- 下段
		{id = "op-down", loop = 100, op = {21}, timer = 21, dst = {
			{time = 100, x = 780, y = 665, w = 65, h = 13, a = 100},
			{time = 1100, a = 255},
			{time = 2100, a = 100}
		}},
		{id = "op-down", loop = 100, op = {21}, timer = 21, dst = {
			{time = 100, x = 887, y = 665, w = 65, h = 13, a = 100},
			{time = 1100, a = 255},
			{time = 2100, a = 100}
		}},
		{id = "op-down", loop = 100, op = {21}, timer = 21, dst = {
			{time = 100, x = 994, y = 665, w = 65, h = 13, a = 100},
			{time = 1100, a = 255},
			{time = 2100, a = 100}
		}},
		{id = "op-down", loop = 100, op = {21}, timer = 21, dst = {
			{time = 100, x = 1101, y = 665, w = 65, h = 13, a = 100},
			{time = 1100, a = 255},
			{time = 2100, a = 100}
		}},
		{id = "option-random-1p-info", loop = 100, op = {21}, timer = 21, dst = {
			{time = 100, x = 495, y = 198, w = 156, h = 273}
		}},
		{id = "option-random-1p", loop = 100, op = {21}, blend = 2, timer = 21, dst = {
			{time = 100, x = 353, y = 204, w = 143, h = 240}
		}},
		{id = "option-random-2p-info", loop = 100, op = {21}, timer = 21, dst = {
			{time = 100, x = 1468, y = 198, w = 156, h = 273}
		}},
		{id = "option-random-2p", loop = 100, op = {21}, blend = 2, timer = 21, dst = {
			{time = 100, x = 1326, y = 204, w = 143, h = 240}
		}},
		{id = "option-gauge-info", loop = 100, op = {21}, timer = 21, dst = {
			{time = 100, x = 801, y = 293, w = 196, h = 178}
		}},
		{id = "option-gauge", loop = 100, op = {21}, blend = 2, timer = 21, dst = {
			{time = 100, x = 659, y = 299, w = 143, h = 144}
		}},
		{id = "option-dp-info", loop = 100, op = {21}, timer = 21, dst = {
			{time = 100, x = 961, y = 157, w = 196, h = 130}
		}},
		{id = "option-dp", loop = 100, op = {21}, blend = 2, timer = 21, dst = {
			{time = 100, x = 819, y = 162, w = 143, h = 96}
		}},
		{id = "option-hsfix-info", loop = 100, op = {21}, timer = 21, dst = {
			{time = 100, x = 1147, y = 317, w = 171, h = 154}
		}},
		{id = "option-hsfix", loop = 100, op = {21}, blend = 2, timer = 21, dst = {
			{time = 100, x = 1006, y = 323, w = 143, h = 120}
		}},
		-- DPでない時に表示
		{id = "op-dponly", loop = 100, op = {21, -162, 2}, timer = 21, dst = {
			{time = 100, x = 1013, y = 156, w = 627, h = 698}
		}},
		-- ターゲット
		{id = "op-target-frame", loop = 100, op = {21}, timer = 21, dst = {
			{time = 100, x = 36, y = 480, w = 315, h = 300}
		}},
		{id = "op-target", loop = 100, op = {21}, timer = 21, dst = {
			{time = 100, x = 36, y = 480, w = 315, h = 300}
		}},
		{id = "op-target-select", loop = 100, op = {21}, timer = 21, dst = {
			{time = 100, x = 35, y = 617, w = 315, h = 30},
			{time = 1100, a = 100},
			{time = 2100, a = 255},
		}},
	}
	
	return parts
end

return {
	load = load
}