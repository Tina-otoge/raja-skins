local parts = {}

local OP_CHART_OFF	= get_property_op()
local OP_CHART_ON	= get_property_op()

parts.property = {
	{name = "チャートを使用する", item = {
		{name = "OFF",	op = OP_CHART_OFF},
		{name = "ON",	op = OP_CHART_ON}
	},def = "ON"},	
}

local function load()

	local parts_position = {
		x = 663,
		y = 241,
	}

	if skin_config.option["チャートを使用する"] == OP_CHART_ON then
	
		local notes_count = nil
		local note_count = nil
		local ln_count = nil
		local scr_count = nil
		local bss_count = nil
		local judge_rank_key = nil
		local judge_rank_scr = nil
		local gauge_total = nil
		local difficult = nil
		local density_ave = nil
		local density_end = nil
		local density_peak = nil
		local dg_key = nil
		local dg_scr = nil
		local dg_total = nil
		
		parts.source = {
			{id = "default-chart-bg", path = "customize/advanced/default_chart/bg.png"},
			{id = "default-chart-bg-off", path = "customize/advanced/default_chart/bg_off.png"},
			{id = "default-chart-graph", path = "customize/advanced/default_chart/graph.png"},
			{id = "default-chart-num", path = "customize/advanced/default_chart/num.png"},
		}

		parts.image = {
			{id = "default_chart_bg", src = "default-chart-bg", x = 0, y = 0, w = -1, h = -1},
			{id = "default_chart_bg_off", src = "default-chart-bg-off", x = 0, y = 0, w = -1, h = -1},
		}
		parts.value = {
			{id = "default_chart_total_count",	src = "src-default-commonparts-system", x = 0, y = 747, w = 108, h = 18, divx = 12, divy = 2, align = 1, digit = 5,  value = function()				
				local total = main_state.number(368)
				if total < 0 then total = 0 end
				
				local notes = main_state.number(74)
				if notes < 0 then notes = 0 end
				
				local total = (7.605 * notes / (0.01 * notes + 6.5)) - total
								
				return total
				
				end
			},
			{id = "default_chart_ave_count",	src = "src-default-commonparts-system", x = 0, y = 747, w = 90, h = 9, divx = 10, divy = 1, align = 1, digit = 5,  ref = 364},
			{id = "default_chart_peak_count",	src = "src-default-commonparts-system", x = 0, y = 747, w = 90, h = 9, divx = 10, divy = 1, align = 1, digit = 5,  ref = 360},
			{id = "default_chart_end_count",	src = "src-default-commonparts-system", x = 0, y = 747, w = 90, h = 9, divx = 10, divy = 1, align = 1, digit = 5,  ref = 362},

			
			{id = "default_chart_note_count",	src = "default-chart-num", x = 0, y = 0, w = 140, h = 16, divx = 10, align = 2, digit = 5, ref = 350},
			{id = "default_chart_ln_count",		src = "default-chart-num", x = 0, y = 0, w = 140, h = 16, divx = 10, align = 2, digit = 5, ref = 351},
			{id = "default_chart_scr_count",	src = "default-chart-num", x = 0, y = 0, w = 140, h = 16, divx = 10, align = 2, digit = 5, ref = 352},
			{id = "default_chart_bss_count",	src = "default-chart-num", x = 0, y = 0, w = 140, h = 16, divx = 10, align = 2, digit = 5, ref = 353},
			{id = "default_chart_mine_count",	src = "default-chart-num", x = 0, y = 0, w = 140, h = 16, divx = 10, align = 2, digit = 5, ref = 354},
		}

		local c = 1.5
		
		parts.graph = {			
			-- 鍵盤ヤバさ
			{id = "default_chart_key", src = "default-chart-graph", x = 0, y = 0, w = 1, h = 14, min = 0, max = 320, angle = 0, value = function()	
				if		main_state.option(180) then judge_rank_key = 1.7	--veryhard
				elseif	main_state.option(181) then judge_rank_key = 1.5	--hard
				elseif	main_state.option(182) then judge_rank_key = 1.3	--normal
				elseif	main_state.option(183) then judge_rank_key = 1.0	--easy
				elseif	main_state.option(184) then judge_rank_key = 0.7	--veryeasy
				end
				if judge_rank_key < 0 then judge_rank_key = 0 end
				
				note_count = main_state.number(350) / 25
				if note_count < 0 then note_count = 0 end
				
				ln_count = main_state.number(351) / 8.3
				if ln_count < 0 then ln_count = 0 end
				
				dg_key = (note_count + ln_count) * judge_rank_key * c
				
				return dg_key
				
				end
			},
			
			-- スクラッチヤバさ	
			{id = "default_chart_scr", src = "default-chart-graph", x = 0, y = 0, w = 1, h = 14, min = 0, max = 320, angle = 0, value = function()
				if		main_state.option(180) then judge_rank_scr = 1.6	--veryhard
				elseif	main_state.option(181) then judge_rank_scr = 1.4	--hard
				elseif	main_state.option(182) then judge_rank_scr = 1.2	--normal
				elseif	main_state.option(183) then judge_rank_scr = 1.0	--easy
				elseif	main_state.option(184) then judge_rank_scr = 0.8	--veryeasy
				end
				if judge_rank_scr < 0 then judge_rank_scr = 0 end
				
				scr_count = main_state.number(352) / 3.125
				if scr_count < 0 then scr_count = 0 end
				
				bss_count = main_state.number(353) / 0.625
				if bss_count < 0 then bss_count = 0 end
				
				dg_scr = (scr_count + bss_count) * judge_rank_scr * c
				
				return dg_scr
				
				end
			},
			
			-- TOTAL値ヤバさ
			{id = "default_chart_gauge", src = "default-chart-graph", x = 0, y = 0, w = 1, h = 14, min = 0, max = 320, angle = 0, value = function()				
				gauge_total = main_state.number(368)
				if gauge_total < 0 then gauge_total = 0 end
				
				notes_count = main_state.number(74)
				if notes_count < 0 then notes_count = 0 end
				
				dg_total = ((7.605 * notes_count / (0.01 * notes_count + 6.5)) - gauge_total) * 0.5 * c
				if dg_total < 0 then dg_total = 0 end
								
				return dg_total
				
				end
			},
			
			-- 密度ヤバさ
			{id = "default_chart_ave", src = "default-chart-graph", x = 0, y = 0, w = 1, h = 14, min = 0, max = 320, angle = 0, value = function()
				density_ave = main_state.number(364) * 3.2 * c
				if density_ave < 0 then density_ave = 0 end
				return density_ave
				end
			},
			
			{id = "default_chart_peak", src = "default-chart-graph", x = 0, y = 0, w = 1, h = 14, min = 0, max = 320, angle = 0, value = function()
				density_peak = main_state.number(360) * 3.2 * c
				if density_peak < 0 then density_peak = 0 end
				return density_peak
				end
			},	
			
			{id = "default_chart_end", src = "default-chart-graph", x = 0, y = 0, w = 1, h = 14, min = 0, max = 320, angle = 0, value = function()
				density_end = main_state.number(362) * 3.2 * c
				if density_end < 0 then density_end = 0 end
				return density_end
				end
			},
		}
		
		parts.destination = {
			{id = "default_chart_bg_off",	op = {-2}, dst = {{x = parts_position.x,			y = parts_position.y,		w = 417,	h = 224}}},
			
			{id = "default_chart_bg",		op = {2}, dst = {{x = parts_position.x,			y = parts_position.y,		w = 417,	h = 224}}},
			{id = "default_chart_key",		op = {2}, dst = {{x = parts_position.x + 97,	y = parts_position.y + 177,	w = 1,		h = 14}}},
			{id = "default_chart_scr",		op = {2}, dst = {{x = parts_position.x + 97,	y = parts_position.y + 153,	w = 1,		h = 14}}},
			{id = "default_chart_gauge",	op = {2}, dst = {{x = parts_position.x + 97,	y = parts_position.y + 129,	w = 1,		h = 14}}},
			{id = "default_chart_ave",		op = {2}, dst = {{x = parts_position.x + 97,	y = parts_position.y + 105,	w = 1,		h = 14}}},
			{id = "default_chart_peak",		op = {2}, dst = {{x = parts_position.x + 97,	y = parts_position.y + 81,	w = 1,		h = 14}}},
			{id = "default_chart_end",		op = {2}, dst = {{x = parts_position.x + 97,	y = parts_position.y + 57,	w = 1,		h = 14}}},
			{id = "default_chart_total_count",		op = {2}, dst = {{x = parts_position.x + 99,	y = parts_position.y + 131,	w = 9,		h = 9}}},
			{id = "default_chart_ave_count",		op = {2}, dst = {{x = parts_position.x + 99,	y = parts_position.y + 107,	w = 9,		h = 9}}},
			{id = "default_chart_peak_count",		op = {2}, dst = {{x = parts_position.x + 99,	y = parts_position.y + 83,	w = 9,		h = 9}}},
			{id = "default_chart_end_count",		op = {2}, dst = {{x = parts_position.x + 99,	y = parts_position.y + 59,	w = 9,		h = 9}}},
			
			{id = "default_chart_note_count",	op = {2}, dst = {{x = parts_position.x + 17,	y = parts_position.y + 8,	w = 14,	h = 16}}},
			{id = "default_chart_ln_count",		op = {2}, dst = {{x = parts_position.x + 101,	y = parts_position.y + 8,	w = 14,	h = 16}}},
			{id = "default_chart_scr_count",	op = {2}, dst = {{x = parts_position.x + 181,	y = parts_position.y + 8,	w = 14,	h = 16}}},
			{id = "default_chart_bss_count",	op = {2}, dst = {{x = parts_position.x + 261,	y = parts_position.y + 8,	w = 14,	h = 16}}},
			{id = "default_chart_mine_count",	op = {2}, dst = {{x = parts_position.x + 341,	y = parts_position.y + 8,	w = 14,	h = 16}}},
		}
	
	else
		parts.source = {
			{id = "default-chart-bg-off", path = "customize/advanced/default_chart/bg_off.png"},
		}
		parts.image = {
			{id = "default_chart_bg_off", src = "default-chart-bg-off", x = 0, y = 0, w = -1, h = -1},
		}
		parts.destination = {
			{id = "default_chart_bg_off", dst = {{x = parts_position.x, y = parts_position.y, w = 417, h = 200}}},
		}
	end
	
	return parts	
end

return {
	parts = parts,
	load = load
}