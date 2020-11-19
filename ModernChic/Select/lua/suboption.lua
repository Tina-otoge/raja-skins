--[[
	サブオプション（数字キー5）を表示
--]]
local function load()
	local parts = {}
	
	parts.image = {
		{id = "subop-top", src = 4, x = 0, y = 0, w = 1920, h = 565},
		{id = "subop-bottom", src = 4, x = 0, y = 571, w = 1920, h = 565},
		{id = "subop-dia", src = 4, x = 0, y = 1220, w = 1950, h = 50},
		{id = "subop-title", src = 4, x = 0, y = 1150, w = 1200, h = 71},
		{id = "subop-menu", src = 4, x = 0, y = 1280, w = 619, h = 632},
		{id = "subop-info", src = 4, x = 630, y = 1280, w = 628, h = 83},
		{id = "subop-info-l", src = 4, x = 630, y = 1370, w = 558, h = 86},
		{id = "subop-info-r", src = 4, x = 630, y = 1460, w = 558, h = 86},
		{id = "subop-menu-l", src = 4, x = 630, y = 1550, w = 550, h = 732},
		{id = "subop-menu-r", src = 4, x = 1200, y = 1550, w = 550, h = 732},
		{id = "subop-selector5-1", src = 4, x = 0, y = 2024, w = 143, h = 120},
		{id = "subop-selector5-2", src = 4, x = 0, y = 2000, w = 143, h = 120},
		{id = "subop-selector5-3", src = 4, x = 0, y = 1976, w = 143, h = 120},
		{id = "subop-selector5-4", src = 4, x = 0, y = 1952, w = 143, h = 120},
		{id = "subop-selector5-5", src = 4, x = 0, y = 1928, w = 143, h = 120},
		{id = "subop-selector3-1", src = 4, x = 0, y = 2024, w = 143, h = 72},
		{id = "subop-selector3-2", src = 4, x = 0, y = 2000, w = 143, h = 72},
		{id = "subop-selector3-3", src = 4, x = 0, y = 1976, w = 143, h = 72},
		{id = "subop-up", src = 6, x = 900, y = 1210, w = 34, h = 13},
		{id = "subop-down", src = 6, x = 900, y = 1230, w = 65, h = 13},
	}
	
	parts.value = {
		-- 判定タイミング（+-あり3桁）
		{id = "judgetiming", src = 4, x = 143, y = 1948, w = 108, h = 28, divx = 12, divy = 2, digit = 3, ref = 12},
		-- 緑数字（SP）
		{id = "duration-green", src = 4, x = 143, y = 1920, w = 90, h = 14, divx = 10, digit = 4, ref = 313},
		-- ノーツ表示時間
		{id = "duration", src = 4, x = 143, y = 1934, w = 90, h = 14, divx = 10, digit = 4, ref = 312},
	}
	
	parts.imageset = {
		{id = "option-gas", ref = 78, images = {"subop-selector5-1", "subop-selector5-2", "subop-selector5-3", "subop-selector5-4", "subop-selector5-5"}},
		{id = "option-bga", ref = 72, images = {"subop-selector3-1", "subop-selector3-2", "subop-selector3-3"}},
	}
	
	parts.destination = {
		{id = "subop-top", loop = 100, op = {23}, timer = 23, dst = {
			{time = 0, x = 0, y = 1080, w = 1920, h = 565},
			{time = 100, y = 515, acc = 2}
		}},
		{id = "subop-bottom", loop = 100, op = {23}, timer = 23, dst = {
			{time = 0, x = 0, y = -565, w = 1920, h = 565},
			{time = 100, y = 0, acc = 2}
		}},
		-- ウィンドウ閉じる
		{id = "subop-top", loop = 100, timer = 33, dst = {
			{time = 0, x = 0, y = 515, w = 1920, h = 565},
			{time = 100, y = 1080, acc = 2}
		}},
		{id = "subop-bottom", loop = 100, timer = 33, dst = {
			{time = 0, x = 0, y = 0, w = 1920, h = 565},
			{time = 100, y = -565, acc = 2}
		}},
		-- 左に流れる
		{id = "subop-dia", loop = 100, op = {23}, timer = 23, dst = {
			{time = 100, x = 0, y = 58, w = 1950, h = 50},
			{time = 50000, x = -1950}
		}},
		{id = "subop-dia", loop = 100, op = {23}, timer = 23, dst = {
			{time = 100, x = 1950, y = 58, w = 1950, h = 50},
			{time = 50000, x = 0}
		}},
		-- 右に流れる
		{id = "subop-dia", loop = 100, op = {23}, timer = 23, dst = {
			{time = 100, x = 0, y = 970, w = 1950, h = 50},
			{time = 50000, x = 1950}
		}},
		{id = "subop-dia", loop = 100, op = {23}, timer = 23, dst = {
			{time = 100, x = -1950, y = 970, w = 1950, h = 50},
			{time = 50000, x = 0}
		}},
		{id = "subop-title", loop = 100, op = {23}, timer = 23, dst = {
			{time = 100, x = (1920 - 1200) / 2, y = 55, w = 1200, h = 71}
		}},
		{id = "subop-menu", loop = 100, op = {23}, timer = 23, dst = {
			{time = 100, x = 651, y = 216, w = 619, h = 632}
		}},
		{id = "subop-info", loop = 100, op = {23}, timer = 23, dst = {
			{time = 100, x = 646, y = 915, w = 628, h = 83}
		}},
		{id = "subop-info-l", loop = 100, op = {23}, timer = 23, dst = {
			{time = 100, x = 52, y = 915, w = 558, h = 86}
		}},
		{id = "subop-info-r", loop = 100, op = {23}, timer = 23, dst = {
			{time = 100, x = 1311, y = 915, w = 558, h = 86}
		}},
		{id = "subop-menu-l", loop = 100, op = {23}, timer = 23, dst = {
			{time = 100, x = 56, y = 162, w = 550, h = 732}
		}},
		{id = "subop-menu-r", loop = 100, op = {23}, timer = 23, dst = {
			{time = 100, x = 1315, y = 162, w = 550, h = 732}
		}},
		{id = "judgetiming", loop = 100, op = {23}, timer = 23, dst = {
			{time = 100, x = 1087, y = 272, w = 9, h = 14}
		}},
		{id = "duration", loop = 100, op = {23}, timer = 23, dst = {
			{time = 100, x = 1060, y = 775, w = 9, h = 14}
		}},
		{id = "duration-green", loop = 100, op = {23}, timer = 23, dst = {
			{time = 100, x = 1130, y = 775, w = 9, h = 14}
		}},
		-- ON,OFF切り替え
		{id = "option-gas", loop = 100, op = {23}, timer = 23, blend = 2, dst = {
			{time = 100, x = 653, y = 676, w = 143, h = 120}
		}},
		{id = "option-bga", loop = 100, op = {23}, timer = 23, blend = 2, dst = {
			{time = 100, x = 653, y = 220, w = 143, h = 72}
		}},
		-- 上段
		{id = "subop-down", loop = 100, op = {23}, timer = 23, dst = {
			{time = 100, x = 820, y = 624, w = 65, h = 13, a = 100},
			{time = 1100, a = 255},
			{time = 2100, a = 100}
		}},
		{id = "subop-down", loop = 100, op = {23}, timer = 23, dst = {
			{time = 100, x = 927, y = 624, w = 65, h = 13, a = 100},
			{time = 1100, a = 255},
			{time = 2100, a = 100}
		}},
		{id = "subop-up", loop = 100, op = {23}, timer = 23, dst = {
			{time = 100, x = 1050, y = 624, w = 34, h = 13},
			{time = 1100, a = 100},
			{time = 2100, a = 255}
		}},
		-- 下段
		{id = "subop-down", loop = 100, op = {23}, timer = 23, dst = {
			{time = 100, x = 770, y = 443, w = 65, h = 13, a = 100},
			{time = 1100, a = 255},
			{time = 2100, a = 100}
		}},
		{id = "subop-down", loop = 100, op = {23}, timer = 23, dst = {
			{time = 100, x = 980, y = 443, w = 65, h = 13, a = 100},
			{time = 1100, a = 255},
			{time = 2100, a = 100}
		}},
		{id = "subop-up", loop = 100, op = {23}, timer = 23, dst = {
			{time = 100, x = 1103, y = 443, w = 34, h = 13},
			{time = 1100, a = 100},
			{time = 2100, a = 255}
		}},
	}
	
	return parts
end

return {
	load = load
}