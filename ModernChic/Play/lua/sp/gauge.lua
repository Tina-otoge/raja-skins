--[[
	グルーヴゲージ部分
--]]
local function isGaugeCoverOff()
	return skin_config.option["ゲージ隠し"] == 930
end
local function isGaugeCoverOn()
	return skin_config.option["ゲージ隠し"] == 931
end

local function load(playside_position_x)
	local parts = {}
	
	-- 基準点
	local position_x = playside_position_x
	local position_y = 111
	
	local perfectColor = {147, 204, 44}
	
	parts.image = {
		-- ゲージフレーム
		{id = "gaugeFrame_1P", src = 1, x = 0, y = 861, w = 556, h = 69},
		{id = "gaugeFrame_2P", src = 1, x = 600, y = 861, w = 556, h = 69},
		
		-- ゲージ隠し
		{id = "gaugeCover_1P", src = 1, x = 0, y = 1180, w = 556, h = 69},
		{id = "gaugeCover_2P", src = 1, x = 600, y = 1180, w = 556, h = 69},
		
		-- 小数点
		{id = "afterdot", src = 1, x = 326, y = 950, w = 10, h = 36},
		
		-- ノーマルゲージ（赤over80明）
		{id = "gauge-r1", src = 1, x = 600, y = 950, w = 8, h = 35},
		-- ノーマルゲージ（赤over80暗）
		{id = "gauge-r2", src = 1, x = 616, y = 950, w = 8, h = 35},
		-- ノーマルゲージ（赤over80明）
		{id = "gauge-r3", src = 1, x = 600, y = 950, w = 8, h = 35},
		
		-- ノーマルゲージ（青under80明）
		{id = "gauge-b1", src = 1, x = 608, y = 950, w = 8, h = 35},
		-- ノーマルゲージ（青under80暗）
		{id = "gauge-b2", src = 1, x = 624, y = 950, w = 8, h = 35},
		-- ノーマルゲージ（青over60明）
		{id = "gauge-b3", src = 1, x = 608, y = 950, w = 8, h = 35},
		
		-- ノーマルゲージ（緑under80明）
		{id = "gauge-g1", src = 1, x = 632, y = 950, w = 8, h = 35},
		-- ノーマルゲージ（緑under80暗）
		{id = "gauge-g2", src = 1, x = 648, y = 950, w = 8, h = 35},
		-- ノーマルゲージ（緑under80明）
		{id = "gauge-g3", src = 1, x = 632, y = 950, w = 8, h = 35},
		
		-- アシストゲージ（ピンクover60明）
		{id = "gauge-p1", src = 1, x = 608, y = 985, w = 8, h = 35},
		-- アシストゲージ（ピンク暗）
		{id = "gauge-p2", src = 1, x = 624, y = 985, w = 8, h = 35},
		-- アシストゲージ（ピンク明）
		{id = "gauge-p3", src = 1, x = 608, y = 985, w = 8, h = 35},
		
		-- EXゲージ（黄明）
		{id = "gauge-y1", src = 1, x = 600, y = 985, w = 8, h = 35},
		-- EXゲージ（黄暗）
		{id = "gauge-y2", src = 1, x = 616, y = 985, w = 8, h = 35},
		-- EXゲージ（黄明）
		{id = "gauge-y3", src = 1, x = 600, y = 985, w = 8, h = 35},
		
		-- HAZARDゲージ（紫明）
		{id = "gauge-h1", src = 1, x = 664, y = 950, w = 8, h = 35},
		-- HAZARDゲージ（紫暗）
		{id = "gauge-h2", src = 1, x = 672, y = 950, w = 8, h = 35},
		-- HAZARDゲージ（紫明）
		{id = "gauge-h3", src = 1, x = 664, y = 950, w = 8, h = 35},
		
		--アシストモード
		{id = "mode-assist", src = 1, x = 1200, y = 0, w = 190, h = 15},
		-- イージーモード
		{id = "mode-easy", src = 1, x = 1200, y = 15, w = 190, h = 15},
		-- ノーマルモード
		{id = "mode-normal", src = 1, x = 1200, y = 30, w = 190, h = 15},
		-- ハードモード
		{id = "mode-hard", src = 1, x = 1200, y = 45, w = 190, h = 15},
		-- EXハードモード
		{id = "mode-exhard", src = 1, x = 1200, y = 60, w = 190, h = 15},
		-- ハザードモード
		{id = "mode-hazard", src = 1, x = 1200, y = 75, w = 190, h = 15},
		-- 通常段位モード
		{id = "mode-grade", src = 1, x = 1390, y = 0, w = 190, h = 15},
		-- EX段位モード
		{id = "mode-exgrade", src = 1, x = 1390, y = 15, w = 190, h = 15},
		-- EXHARD段位モード
		{id = "mode-exhardgrade", src = 1, x = 1390, y = 30, w = 190, h = 15},
	}
	
	parts.value = {
		-- ゲージ％
		{id = "gaugenumber", src = 1, x = 0, y = 950, w = 280, h = 36, divx = 10, divy = 1, digit = 3, ref = 107},
		-- ゲージ％（小数）
		{id = "gaugenumber_afterdot", src = 1, x = 0, y = 950, w = 280, h = 36, divx = 10, divy = 1, digit = 1, ref = 407},
	}
	
	parts.destination = {}
	
	local gaugeWidth
	local afterdot
	local gaugeNumber
	local gaugeNumberAfterdot
	local gaugeType
	local gaugePos
	local ps
	
	if is_left_scratch() then
		gaugeWidth = 401
		afterdot = 503
		gaugeNumber = 415
		gaugeNumberAfterdot = 513
		gaugeType = 230
		gaugePos = 10
		ps = "1P"
	elseif is_right_scratch() then
		-- ゲージ w値を-にすることで逆向きにできる
		gaugeWidth = -401
		afterdot = 93
		gaugeNumber = 5
		gaugeNumberAfterdot = 103
		gaugeType = 144
		gaugePos = 545
		ps = "2P"
	end

	-- フレーム
	table.insert(parts.destination,	{
		id = "gaugeFrame_"..ps, dst = {
			{x = position_x, y = position_y, w = 556, h = 69},
		}
	})

	-- ゲージ本体
	table.insert(parts.destination,	{
		id = "2001", dst = {
			{x = position_x + gaugePos, y = position_y + 9, w = gaugeWidth, h = 35},
		}
	})
	
	-- ゲージ%
	-- op230: 1P 0-10%
	-- op231: 1P 10-19%
	-- op232: 1P 20-29%
	-- op43: GAUGE_HARD
	-- op1046: GAUGE_EX
	-- 通常ゲージ
	table.insert(parts.destination,	{
		id = "afterdot", dst = {
			{x = position_x + afterdot, y = position_y + 26, w = 10, h = 36},
		}
	})
	table.insert(parts.destination,	{
		id = "gaugenumber", op = {-43}, dst = {
			{x = position_x + gaugeNumber, y = position_y + 26, w = 28, h = 36},
		}
	})
	table.insert(parts.destination,	{
		id = "gaugenumber_afterdot", op = {-43}, dst = {
			{x = position_x + gaugeNumberAfterdot, y = position_y + 26, w = 28, h = 36},
		}
	})
	
	-- HARD,EXHARD時
	table.insert(parts.destination,	{
		id = "gaugenumber", op = {43, -232, -231, -230}, dst = {
			{x = position_x + gaugeNumber, y = position_y + 26, w = 28, h = 36},
		}
	})
	table.insert(parts.destination,	{
		id = "gaugenumber_afterdot", op = {43, -232, -231, -230}, dst = {
			{x = position_x + gaugeNumberAfterdot, y = position_y + 26, w = 28, h = 36},
		}
	})
	
	-- HARD,EXHARDのときの点滅動作
	do
		local loopTime = {500, 250, 125}
		local op = {232, 231, 230}
		for i = 1, 3, 1 do
		table.insert(parts.destination,	{
			id = "gaugenumber", op = {43, op[i]}, dst = {
				{time = 0, x = position_x + gaugeNumber, y = position_y + 26, w = 28, h = 36},
				{time = loopTime[i], a = 0}
			}
		})
		table.insert(parts.destination,	{
			id = "gaugenumber_afterdot", op = {43, op[i]}, dst = {
				{time = 0, x = position_x + gaugeNumberAfterdot, y = position_y + 26, w = 28, h = 36},
				{time = loopTime[i], a = 0}
			}
		})
		end
	end
	
	-- パーフェクト状態時は色を変える
	table.insert(parts.destination,	{
		id = "afterdot", timer = 140, op = {-2245, -2244, -2243}, dst = {
			{x = position_x + afterdot, y = position_y + 26, w = 10, h = 36, r = perfectColor[1], g = perfectColor[2], b = perfectColor[3]},
		}
	})
	table.insert(parts.destination,	{
		id = "gaugenumber", timer = 140, op = {-2245, -2244, -2243}, dst = {
			{x = position_x + gaugeNumber, y = position_y + 26, w = 28, h = 36, r = perfectColor[1], g = perfectColor[2], b = perfectColor[3]},
		}
	})
	table.insert(parts.destination,	{
		id = "gaugenumber_afterdot", timer = 140, op = {-2245, -2244, -2243}, dst = {
			{x = position_x + gaugeNumberAfterdot, y = position_y + 26, w = 28, h = 36, r = perfectColor[1], g = perfectColor[2], b = perfectColor[3]},
		}
	})
	
	-- ゲージの状況
	do
		local type = {"assist", "easy", "normal", "hard", "exhard", "hazard", "grade", "exgrade", "exhardgrade"}
		for i = 1, 9, 1 do
			table.insert(parts.destination,	{
				id = "mode-"..type[i], draw = function()
					return main_state.gauge_type() == i - 1
				end,
				dst = {
					{x = position_x + gaugeType, y = position_y + 50, w = 190, h = 15},
				}
			})
		end
	end

	-- ゲージ隠し
	table.insert(parts.destination,	{
		id = "gaugeCover_"..ps,
		draw = function()
			return isGaugeCoverOn() and main_state.timer(143) == main_state.timer_off_value
		end,
		dst = {
			{x = position_x, y = position_y, w = 556, h = 69},
		}
	})
	
	return parts
end

return {
	load = load
}