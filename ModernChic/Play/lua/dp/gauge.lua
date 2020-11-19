--[[
	グルーヴゲージ部分
--]]
local function isGaugeCoverOff()
	return skin_config.option["ゲージ隠し"] == 943
end
local function isGaugeCoverOn()
	return skin_config.option["ゲージ隠し"] == 944
end
local function isGaugeStretchDirectionRight()
	return skin_config.option["グルーヴゲージの向き"] == 978
end
local function isGaugeStretchDirectionLeft()
	return skin_config.option["グルーヴゲージの向き"] == 979
end

local function load()
	local parts = {}
	
	local perfectColor = {147, 204, 44}
	
	parts.image = {
		{id = "perFrame", src = 1, x = 380, y = 460, w = 126, h = 90},
		
		-- ゲージ隠し
		{id = "gaugeCover", src = 1, x = 0, y = 1200, w = 500, h = 35},
		{id = "perFrame2", src = 1, x = 550, y = 460, w = 126, h = 90},
		
		-- 小数点
		{id = "afterdot", src = 1, x = 530, y = 528, w = 8, h = 8},
		
		-- ノーマルゲージ（赤over80明）
		{id = "gauge-r1", src = 1, x = 1240, y = 760, w = 10, h = 35},
		-- ノーマルゲージ（赤over80暗）
		{id = "gauge-r2", src = 1, x = 1260, y = 760, w = 10, h = 35},
		-- ノーマルゲージ（赤over80明）
		{id = "gauge-r3", src = 1, x = 1240, y = 760, w = 10, h = 35},
		
		-- ノーマルゲージ（青under80明）
		{id = "gauge-b1", src = 1, x = 1250, y = 760, w = 10, h = 35},
		-- ノーマルゲージ（青under80暗）
		{id = "gauge-b2", src = 1, x = 1270, y = 760, w = 10, h = 35},
		-- ノーマルゲージ（青over60明）
		{id = "gauge-b3", src = 1, x = 1250, y = 760, w = 10, h = 35},
		
		-- ノーマルゲージ（緑under80明）
		{id = "gauge-g1", src = 1, x = 1280, y = 760, w = 10, h = 35},
		-- ノーマルゲージ（緑under80暗）
		{id = "gauge-g2", src = 1, x = 1300, y = 760, w = 10, h = 35},
		-- ノーマルゲージ（緑under80明）
		{id = "gauge-g3", src = 1, x = 1280, y = 760, w = 10, h = 35},
		
		-- アシストゲージ（ピンクover60明）
		{id = "gauge-p1", src = 1, x = 1290, y = 760, w = 10, h = 35},
		-- アシストゲージ（ピンク暗）
		{id = "gauge-p2", src = 1, x = 1310, y = 760, w = 10, h = 35},
		-- アシストゲージ（ピンク明）
		{id = "gauge-p3", src = 1, x = 1290, y = 760, w = 10, h = 35},
		
		-- EXゲージ（黄明）
		{id = "gauge-y1", src = 1, x = 1240, y = 795, w = 10, h = 35},
		-- EXゲージ（黄暗）
		{id = "gauge-y2", src = 1, x = 1260, y = 795, w = 10, h = 35},
		-- EXゲージ（黄明）
		{id = "gauge-y3", src = 1, x = 1240, y = 795, w = 10, h = 35},
		
		-- HAZARDゲージ（紫明）
		{id = "gauge-h1", src = 1, x = 1320, y = 760, w = 10, h = 35},
		-- HAZARDゲージ（紫暗）
		{id = "gauge-h2", src = 1, x = 1330, y = 760, w = 10, h = 35},
		-- HAZARDゲージ（紫明）
		{id = "gauge-h3", src = 1, x = 1320, y = 760, w = 10, h = 35},
	}
	
	parts.value = {
		-- ゲージ％
		{id = "gaugenumber", src = 1, x = 1008, y = 940, w = 300, h = 40, divx = 10, divy = 1, digit = 3, ref = 107},
		-- ゲージ％（小数）
		{id = "gaugenumber_afterdot", src = 1, x = 1008, y = 980, w = 210, h = 40, divx = 10, divy = 1, digit = 1, ref = 407},
	}
	
	parts.destination = {}

	do
		-- ゲージ%
		-- op230: 1P 0-10%
		-- op231: 1P 10-19%
		-- op232: 1P 20-29%
		-- op43: GAUGE_HARD
		-- op1046: GAUGE_EX
		local posx = 897
		local posy = 180
		table.insert(parts.destination, {
			id = "perFrame", dst = {
				{x = posx, y = posy, w = 126, h = 90},
			}
		})
		table.insert(parts.destination, {
			id = "afterdot", dst = {
				{x = posx + 26, y =  posy + 14, w = 8, h = 8},
			}
		})
		table.insert(parts.destination, {
			id = "gaugenumber", op = {-43}, dst = {
				{x = posx + 15, y = posy + 40, w = 30, h = 40},
			}
		})
		table.insert(parts.destination, {
			id = "gaugenumber_afterdot", op = {-43}, dst = {
				{x = posx + 40, y = posy + 5, w = 21, h = 40},
			}
		})
		-- HARD,EXHARD時
		table.insert(parts.destination,	{
			id = "gaugenumber", op = {43, -232, -231, -230}, dst = {
				{x = posx + 15, y = posy + 40, w = 30, h = 40},
			}
		})
		table.insert(parts.destination,	{
			id = "gaugenumber_afterdot", op = {43, -232, -231, -230}, dst = {
				{x = posx + 40, y = posy + 5, w = 21, h = 40},
			}
		})
		-- HARD,EXHARDのときの点滅動作
		do
			local loopTime = {500, 250, 125}
			local op = {232, 231, 230}
			for i = 1, 3, 1 do
			table.insert(parts.destination,	{
				id = "gaugenumber", op = {43, op[i]}, dst = {
					{time = 0, x = posx + 15, y = posy + 40, w = 30, h = 40},
					{time = loopTime[i], a = 0}
				}
			})
			table.insert(parts.destination,	{
				id = "gaugenumber_afterdot", op = {43, op[i]}, dst = {
					{time = 0, x = posx + 40, y = posy + 5, w = 21, h = 40},
					{time = loopTime[i], a = 0}
				}
			})
			end
		end
		-- パーフェクト状態時は色を変える
		table.insert(parts.destination,	{
			id = "afterdot", timer = 140, op = {-2245, -2244, -2243}, dst = {
				{x = posx + 26, y =  posy + 14, w = 8, h = 8, r = perfectColor[1], g = perfectColor[2], b = perfectColor[3]},
			}
		})
		table.insert(parts.destination,	{
			id = "gaugenumber", timer = 140, op = {-2245, -2244, -2243}, dst = {
				{x = posx + 15, y = posy + 40, w = 30, h = 40, r = perfectColor[1], g = perfectColor[2], b = perfectColor[3]},
			}
		})
		table.insert(parts.destination,	{
			id = "gaugenumber_afterdot", timer = 140, op = {-2245, -2244, -2243}, dst = {
				{x = posx + 40, y = posy + 5, w = 21, h = 40, r = perfectColor[1], g = perfectColor[2], b = perfectColor[3]},
			}
		})
		-- ゲージ隠し
		table.insert(parts.destination, {
			id = "perFrame2",
			draw = function()
				return isGaugeCoverOn() and main_state.timer(143) == main_state.timer_off_value
			end,
			dst = {
				{x = posx, y = posy, w = 126, h = 90},
			}
		})
	end
	do
		local posx
		local w
		if isGaugeStretchDirectionRight() then
			posx = 706
			w = 500
		elseif isGaugeStretchDirectionLeft() then
			posx = 1206
			w = -500
		end
		-- ゲージ本体
		table.insert(parts.destination,	{
			id = "2001", dst = {
				{x = posx, y = 117, w = w, h = 35},
			}
		})
	end
	-- ゲージ隠し
	table.insert(parts.destination,	{
		id = "gaugeCover",
		draw = function()
			return isGaugeCoverOn() and main_state.timer(143) == main_state.timer_off_value
		end,
		dst = {
			{x = 706, y = 117, w = 500, h = 35},
		}
	})
	return parts
end

return {
	load = load
}