--[[
	開始アニメーション
--]]
local function load()
	local parts = {}
	
	parts.image = {
		-- シャッター
		{id = "shutter-l", src = 5, x = 0, y = 0, w = 1004, h = 1080},
		{id = "shutter-r", src = 5, x = 1020, y = 0, w = 1003, h = 1080},
		-- フェードイン
		{id = "fade-bg", src = 5, x = 2200, y = 0, w = 1, h = 1},
		{id = "fade-tex", src = 5, x = 0, y = 2900, w = 1200, h = 50},
	}
	
	parts.destination = {
		-- 背景に静止画を選択している場合はアニメーション
		{id = "bg", loop = -1, op = {900}, dst = {
			{time = 1000, x = -960, y = -540, w = 3840, h = 2160, a = 100},
			{time = 1250, x = 0, y = 0, w = 1920, h = 1080, a = 0}
		}},
		{id = "bg", loop = -1, op = {900}, dst = {
			{time = 1000, x = -960, y = -540, w = 3840, h = 2160, a = 100},
			{time = 1500, x = 0, y = 0, w = 1920, h = 1080, a = 0}
		}},
		{id = "bg", loop = -1, op = {900}, dst = {
			{time = 1000, x = -9600, y = -5400, w = 21120, h = 11880, a = 100},
			{time = 2000, x = 0, y = 0, w = 1920, h = 1080, a = 0}
		}},
		-- 開始パターン（フェードイン）
		{id = "fade-bg", loop = -1, op = {930}, dst = {
			{time = 0, x = 0, y = 0, w = 1920, h = 1080},
			{time = 800},
			{time = 1000, y = 540 , h = 0}
		}},
		{id = "fade-tex", loop = -1, op = {930}, dst = {
			{time = 0, x = 375, y = 513, w = 1200, h = 50, a = 0},
			{time = 300, a = 255},
			{time = 950}
		}},
		-- 開始パターン（シャッター）
		{id = "shutter-l", loop = -1, op = {931}, dst = {
			{time = 0, x = 0, y = 0, w = 1004, h = 1080, acc = 2},
			{time = 800},
			{time = 1000, x = -1004}
		}},
		{id = "shutter-r", loop = -1, op = {931}, dst = {
			{time = 0, x = 915, y = 0, w = 1003, h = 1080, acc = 2},
			{time = 800},
			{time = 1000, x = 1919}
		}},
	}
	
	return parts
end

return {
	load = load
}