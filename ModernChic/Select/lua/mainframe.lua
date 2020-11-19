--[[
	メインフレームパーツ
--]]

local function isIlluminationOff()
	return skin_config.option["ビーム（装飾）"] == 929
end
local function isIlluminationOn()
	return skin_config.option["ビーム（装飾）"] == 928
end

local function load()
	local parts = {}
	
	parts.image = {
		-- メイン
		{id = "main-top", src = 5, x = 0, y = 2400, w = 1920, h = 207},
		{id = "main-dia", src = 5, x = 0, y = 1160, w = 2200, h = 75},
		{id = "main-title", src = 5, x = 0, y = 1290, w = 540, h = 30},
		{id = "skinname", src = 5, x = 0, y = 1329, w = 396, h = 18},
		{id = "keyinfo", src = 5, x = 0, y = 1350, w = 350, h = 113},
		{id = "main-search", src = 5, x = 0, y = 1240, w = 463, h = 45},
		{id = "main-bottom", src = 5, x = 0, y = 2616, w = 1920, h = 270},
		-- 選択モード
		{id = "allkeys", src = 5, x = 2401, y = 0, w = 306, h = 39},
		{id = "5keys", src = 5, x = 2401, y = 39, w = 306, h = 39},
		{id = "7keys", src = 5, x = 2401, y = 78, w = 306, h = 39},
		{id = "10keys", src = 5, x = 2401, y = 117, w = 306, h = 39},
		{id = "14keys", src = 5, x = 2401, y = 156, w = 306, h = 39},
		{id = "9keys", src = 5, x = 2401, y = 195, w = 306, h = 39},
		{id = "24keys", src = 5, x = 2401, y = 234, w = 306, h = 39},
		{id = "48keys", src = 5, x = 2401, y = 273, w = 306, h = 39},
		-- 装飾パーツ
		{id = "beam-guide", src = 5, x = 2250, y = 1300, w = 57, h = 19, divx = 3, cycle = 100},
		{id = "info", src = 5, x = 900, y = 1470, w = 500, h = 630, divy = 7, cycle = 14000},
		{id = "beamBottom", src = 5, x = 0, y = 2950, w = 960, h = 30},
		-- スクロールパーツ
		{id = "scroll-frame", src = 7, x = 970, y = 0, w = 28, h = 540},
	}
	
	parts.slider = {
		{id = "scroll-lamp", src = 7, x = 1010, y = 20, w = 35, h = 70, type = 1, range = 481, angle = 2, changeable = true}
	}
	
	parts.imageset = {
		{id = "btn-modeset", ref = 11, images = {"allkeys", "5keys", "7keys", "10keys", "14keys", "9keys", "24keys", "48keys"}},
	}

	parts.destination = {}

	-- 下からのビーム
	table.insert(parts.destination, {
		id = "beamBottom", blend = 2, dst = {
			{time = 0, x = 0, y = 0, w = 1920, h = 30, a = 100},
			{time = 5000, y = 1080 / 2, a = 0}
		}
	})

	-- メインフレーム上
	table.insert(parts.destination, {
		id = "main-top", dst = {
			{x = 0, y = 874, w = 1920, h = 207}
		}
	})

	table.insert(parts.destination, {
		id = "main-dia", loop = 0, dst = {
			{time = 0, x = 0, y = 964, w = 2200, h = 75, a = 150},
			{time = 50000, x = -2200},
		}
	})

	table.insert(parts.destination, {
		id = "main-dia", loop = 0, dst = {
			{time = 0, x = 2200, y = 964, w = 2200, h = 75, a = 150},
			{time = 50000, x = 0},
		}
	})

	table.insert(parts.destination, {
		id = "main-title", dst = {
			{x = 40, y = 987, w = 540, h = 30},
		}
	})

	table.insert(parts.destination, {
		id = "skinname", dst = {
			{x = 1430, y = 1057, w = 396, h = 18},
		}
	})

	table.insert(parts.destination, {
		id = "version", filter = 1, dst = {
			{x = 1840, y = 1055, w = 80, h = 16},
		}
	})

	table.insert(parts.destination, {
		id = "keyinfo", dst = {
			{x = 680, y = 950, w = 350, h = 113},
		}
	})

	-- 検索エリア
	table.insert(parts.destination, {
		id = "main-search", dst = {
			{x = 5, y = 885, w = 463, h = 45},
		}
	})
	table.insert(parts.destination, {
		id = "search" , dst = {
			{x = 50, y = 895, w = 418, h = 30},
		}
	})

	-- メインフレーム下
	table.insert(parts.destination, {
		id = "main-bottom", dst = {
			{x = 0, y = 0, w = 1920, h = 270},
		}
	})

	-- プレイモード
	do
		local wd = {"5", "7", "10", "14", "9", "24", "48"}
		local op = {161, 160, 163, 162, 164, 1160, 1161}

		for i = 1, 7, 1 do
			table.insert(parts.destination, {
				id = wd[i] .."keys", op = {op[i]}, dst = {
					{x = 1527, y = 213, w = 306, h = 39},
				}
			})
		end
	end

	if isIlluminationOn() then
		-- 上
		table.insert(parts.destination, {
			id = "beam-guide", loop = 0, dst = {
				{time = 0, x = 1920, y = 917, w = 19, h = 19},
				{time = 10000, x = 470},
				{time = 10500, y = 867},
				{time = 15000, x = 0},
			}
		})
		table.insert(parts.destination, {
			id = "beam-guide", loop = 0, dst = {
				{time = 0, x = 1920, y = 917, w = 19, h = 19},
				{time = 6000, x = 470},
				{time = 6250, y = 867},
				{time = 8500, x = 0},
			}
		})

		-- 下
		table.insert(parts.destination, {
			id = "beam-guide", loop = 0, dst = {
				{time = 0, x = 0, y = 208, w = 19, h = 19},
				{time = 10000, x = 1430},
				{time = 10500, y = 258},
				{time = 15000, x = 1920},
			}
		})
		table.insert(parts.destination, {
			id = "beam-guide", loop = 0, dst = {
				{time = 0, x = 0, y = 208, w = 19, h = 19},
				{time = 6000, x = 1430},
				{time = 6250, y = 258},
				{time = 8500, x = 1920},
			}
		})
	end

	-- キーコマンド説明
	table.insert(parts.destination, {
		id = "info", dst = {
			{x = 90, y = 777, w = 500, h = 90},
		}
	})

	-- 選曲スクロール
	table.insert(parts.destination, {
		id = "scroll-frame", loop = 1000, dst = {
			{time = 0, x = 2000, y = 300, w = 28, h = 540},
			{time = 1000, x = 1860, acc = 2}
		}
	})
	table.insert(parts.destination, {
		id = "scroll-lamp", loop = 1000, dst = {
			{time = 1000, x = 1858, y = 775, w = 35, h = 70},
			{time = 2000, a = 200},
			{time = 3000, a = 255},
		}
	})

	return parts
end

return {
	load = load
}