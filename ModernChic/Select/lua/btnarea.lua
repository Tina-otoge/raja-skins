--[[
	ボタン関係
--]]
local function load()
	local parts = {}
	
	parts.image = {
		-- ボタン類
		{id = "tex-autoplay", src = 5, x = 350, y = 1350, w = 110, h = 11},
		{id = "tex-practice", src = 5, x = 350, y = 1361, w = 110, h = 11},
		{id = "tex-text", src = 5, x = 350, y = 1372, w = 110, h = 11},
		{id = "tex-replay", src = 5, x = 350, y = 1383, w = 110, h = 11},
		{id = "tex-lnmode", src = 5, x = 350, y = 1394, w = 110, h = 11},
		{id = "tex-keymode", src = 5, x = 350, y = 1405, w = 110, h = 11},
		{id = "tex-sortmode", src = 5, x = 350, y = 1416, w = 110, h = 11},
		{id = "btn-autoplay", src = 5, x = 0, y = 1470, w = 104, h = 91, act = 16},
		{id = "btn-practice", src = 5, x = 104, y = 1470, w = 104, h = 91, act = 315},
		{id = "btn-no-text", src = 5, x = 208, y = 1470, w = 104, h = 91},
		{id = "btn-text", src = 5, x = 208, y = 1561, w = 104, h = 91, act = 17},
		{id = "btn-lnmode", src = 5, x = 312, y = 1470, w = 104, h = 273, divy = 3, len = 3, ref = 308, act = 308},
		{id = "btn-keymode", src = 5, x = 416, y = 1470, w = 104, h = 730, divy = 8, len = 8, ref = 11, act = 11},
		{id = "btn-sortmode", src = 5, x = 520, y = 1470, w = 104, h = 730, divy = 8, len = 8, ref = 12, act = 12},
		{id = "btn-replay1-on", src = 5, x = 630, y = 1470, w = 53, h = 46, act = 19},
		{id = "btn-replay1-off", src = 5, x = 630, y = 1516, w = 53, h = 46},
		{id = "btn-replay1-select", src = 5, x = 630, y = 1562, w = 53, h = 46},
		{id = "btn-replay2-on", src = 5, x = 683, y = 1470, w = 53, h = 46, act = 316},
		{id = "btn-replay2-off", src = 5, x = 683, y = 1516, w = 53, h = 46},
		{id = "btn-replay2-select", src = 5, x = 683, y = 1562, w = 53, h = 46},
		{id = "btn-replay3-on", src = 5, x = 736, y = 1470, w = 53, h = 46, act = 317},
		{id = "btn-replay3-off", src = 5, x = 736, y = 1516, w = 53, h = 46},
		{id = "btn-replay3-select", src = 5, x = 736, y = 1562, w = 53, h = 46},
		{id = "btn-replay4-on", src = 5, x = 789, y = 1470, w = 53, h = 46, act = 318},
		{id = "btn-replay4-off", src = 5, x = 789, y = 1516, w = 53, h = 46},
		{id = "btn-replay4-select", src = 5, x = 789, y = 1562, w = 53, h = 46},
	}
	
	parts.destination = {
		{id = "btn-autoplay", dst = {
			{x = 1074, y = 956, w = 104, h = 91},
		}},
		{id = "tex-autoplay", dst = {
			{x = 1074, y = 937, w = 110, h = 11},
		}},
		-- 練習
		{id = "btn-practice", dst = {
			{x = 1194, y = 956, w = 104, h = 91},
		}},
		{id = "tex-practice", dst = {
			{x = 1202, y = 937, w = 110, h = 11},
		}},
		-- テキスト
		{id = "btn-no-text", dst = {
			{x = 1315, y = 956, w = 104, h = 91},
		}},
		{id = "btn-text", op = {175}, dst = {
			{x = 1315, y = 956, w = 104, h = 91},
		}},
		{id = "tex-text", dst = {
			{x = 1343, y = 937, w = 110, h = 11},
		}},
		-- リプレイ
		{id = "btn-replay1-on", op = {197}, dst = {
			{x = 1433, y = 1004, w = 53, h = 46},
		}},
		{id = "btn-replay1-off", dst = {
			{x = 1433, y = 1004, w = 53, h = 46},
		}},
		{id = "btn-replay1-select", op = {1205}, dst = {
			{x = 1433, y = 1004, w = 53, h = 46},
		}},
		{id = "btn-replay2-on", op = {1197}, dst = {
			{x = 1490, y = 1004, w = 53, h = 46},
		}},
		{id = "btn-replay2-off", dst = {
			{x = 1490, y = 1004, w = 53, h = 46},
		}},
		{id = "btn-replay2-select", op = {1206}, dst = {
			{x = 1490, y = 1004, w = 53, h = 46},
		}},
		{id = "btn-replay3-on", op = {1200}, dst = {
			{x = 1433, y = 953, w = 53, h = 46},
		}},
		{id = "btn-replay3-off", dst = {
			{x = 1433, y = 953, w = 53, h = 46},
		}},
		{id = "btn-replay3-select", op = {1207}, dst = {
			{x = 1433, y = 953, w = 53, h = 46},
		}},
		{id = "btn-replay4-on", op = {1203}, dst = {
			{x = 1490, y = 953, w = 53, h = 46},
		}},
		{id = "btn-replay4-off", dst = {
			{x = 1490, y = 953, w = 53, h = 46},
		}},
		{id = "btn-replay4-select", op = {1208}, dst = {
			{x = 1490, y = 953, w = 53, h = 46},
		}},
		{id = "tex-replay", dst = {
			{x = 1452, y = 937, w = 110, h = 11},
		}},
		-- LNモード切り替え
		{id = "btn-lnmode", dst = {
			{x = 1555, y = 956, w = 104, h = 91},
		}},
		{id = "tex-lnmode", dst = {
			{x = 1568, y = 937, w = 110, h = 11},
		}},
		{id = "btn-keymode", dst = {
			{x = 1675, y = 956, w = 104, h = 91},
		}},
		{id = "tex-keymode", dst = {
			{x = 1682, y = 937, w = 110, h = 11},
		}},
		{id = "btn-sortmode", dst = {
			{x = 1795, y = 956, w = 104, h = 91},
		}},
		{id = "tex-sortmode", dst = {
			{x = 1796, y = 937, w = 110, h = 11},
		}},
	}
	
	return parts
end

return {
	load = load
}