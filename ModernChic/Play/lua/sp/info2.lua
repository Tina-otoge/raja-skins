--[[
	レベルと判定カウンター
--]]
local function load(gaugePositionX)
	local parts = {}
	
	parts.image = {
		-- レベル表示部分
		{id = "info_level_frame", src = 1, x = 1575, y = 300, w = 175, h = 91},
		-- カウント部分
		{id = "info_count_frame", src = 1, x = 1200, y = 300, w = 371, h = 103},
		
		-- 難易度画像
		{id = "lev_biginner", src = 1, x = 1200, y = 101, w = 160, h = 20},
		{id = "lev_normal", src = 1, x = 1200, y = 121, w = 160, h = 20},
		{id = "lev_hyper", src = 1, x = 1200, y = 141, w = 160, h = 20},
		{id = "lev_another", src = 1, x = 1200, y = 161, w = 160, h = 20},
		{id = "lev_insame", src = 1, x = 1200, y = 181, w = 160, h = 20},
		{id = "lev_unknown", src = 1, x = 1200, y = 201, w = 160, h = 20},
	}
	
	parts.value = {
		-- 譜面レベル
		{id = "playlevel", src = 1, x = 1400, y = 101, w = 270, h = 20, divx = 10, divy = 1, digit = 2, ref = 96},
		
		-- PG数
		{id = "count_pg", src = 1, x = 1400, y = 101, w = 297, h = 20, divx = 11, divy = 1, digit = 4, ref = 110},
		{id = "count_pg-early", src = 1, x = 1400, y = 121, w = 297, h = 20, divx = 11, divy = 1, digit = 4, ref = 410},
		{id = "count_pg-late", src = 1, x = 1400, y = 141, w = 297, h = 20, divx = 11, divy = 1, digit = 4, ref = 411},
		-- great数
		{id = "count_gr", src = 1, x = 1400, y = 101, w = 297, h = 20, divx = 11, divy = 1, digit = 4, ref = 111},
		{id = "count_gr-early", src = 1, x = 1400, y = 121, w = 297, h = 20, divx = 11, divy = 1, digit = 4, ref = 412},
		{id = "count_gr-late", src = 1, x = 1400, y = 141, w = 297, h = 20, divx = 11, divy = 1, digit = 4, ref = 413},
		-- good数
		{id = "count_gd", src = 1, x = 1400, y = 101, w = 297, h = 20, divx = 11, divy = 1, digit = 4, ref = 112},
		{id = "count_gd-early", src = 1, x = 1400, y = 121, w = 297, h = 20, divx = 11, divy = 1, digit = 4, ref = 414},
		{id = "count_gd-late", src = 1, x = 1400, y = 141, w = 297, h = 20, divx = 11, divy = 1, digit = 4, ref = 415},
		-- bad数
		{id = "count_bd", src = 1, x = 1400, y = 101, w = 297, h = 20, divx = 11, divy = 1, digit = 4, ref = 113},
		{id = "count_bd-early", src = 1, x = 1400, y = 121, w = 297, h = 20, divx = 11, divy = 1, digit = 4, ref = 416},
		{id = "count_bd-late", src = 1, x = 1400, y = 141, w = 297, h = 20, divx = 11, divy = 1, digit = 4, ref = 417},
		-- poor数
		{id = "count_pr", src = 1, x = 1400, y = 101, w = 297, h = 20, divx = 11, divy = 1, digit = 4, ref = 114},
		{id = "count_pr-early", src = 1, x = 1400, y = 121, w = 297, h = 20, divx = 11, divy = 1, digit = 4, ref = 418},
		{id = "count_pr-late", src = 1, x = 1400, y = 141, w = 297, h = 20, divx = 11, divy = 1, digit = 4, ref = 419},
	}
	
	parts.destination = {
		-- フレーム部
		{id = "info_level_frame", dst = {
			{x = gaugePositionX, y = 8, w = 175, h = 91},
		}},
		
		{id = "info_count_frame", dst = {
			{x = gaugePositionX + 185, y = 4, w = 371, h = 103},
		}},
		
		-- ピカグレ数
		{id = "count_pg", dst = {
			{x = gaugePositionX + 260, y = 87, w = 22, h = 20},
		}},
		{id = "count_pg-early", dst = {
			{x = gaugePositionX + 360, y = 87, w = 22, h = 20},
		}},
		{id = "count_pg-late", dst = {
			{x = gaugePositionX + 460, y = 87, w = 22, h = 20},
		}},
		
		-- グレ数
		{id = "count_gr", dst = {
			{x = gaugePositionX + 260, y = 66, w = 22, h = 20},
		}},
		{id = "count_gr-early", dst = {
			{x = gaugePositionX + 360, y = 66, w = 22, h = 20},
		}},
		{id = "count_gr-late", dst = {
			{x = gaugePositionX + 460, y = 66, w = 22, h = 20},
		}},
		
		-- グッド数
		{id = "count_gd", dst = {
			{x = gaugePositionX + 260, y = 45, w = 22, h = 20},
		}},
		{id = "count_gd-early", dst = {
			{x = gaugePositionX + 360, y = 45, w = 22, h = 20},
		}},
		{id = "count_gd-late", dst = {
			{x = gaugePositionX + 460, y = 45, w = 22, h = 20},
		}},
		
		-- バッド数
		{id = "count_bd", dst = {
			{x = gaugePositionX + 260, y = 25, w = 22, h = 20},
		}},
		{id = "count_bd-early", dst = {
			{x = gaugePositionX + 360, y = 25, w = 22, h = 20},
		}},
		{id = "count_bd-late", dst = {
			{x = gaugePositionX + 460, y = 25, w = 22, h = 20},
		}},
		
		-- poor数
		{id = "count_pr", dst = {
			{x = gaugePositionX + 260, y = 5, w = 22, h = 20},
		}},
		{id = "count_pr-early", dst = {
			{x = gaugePositionX + 360, y = 5, w = 22, h = 20},
		}},
		{id = "count_pr-late", dst = {
			{x = gaugePositionX + 460, y = 5, w = 22, h = 20},
		}},
		
		-- レベルの表示
		{id = "lev_biginner", op = {151}, dst = {
			{x = gaugePositionX + 10, y = 64, w = 160, h = 20}
		}},
		{id = "lev_normal", op = {152}, dst = {
			{x = gaugePositionX + 10, y = 64, w = 160, h = 20}
		}},
		{id = "lev_hyper", op = {153}, dst = {
			{x = gaugePositionX + 10, y = 64, w = 160, h = 20}
		}},
		{id = "lev_another", op = {154}, dst = {
			{x = gaugePositionX + 10, y = 64, w = 160, h = 20}
		}},
		{id = "lev_insame", op = {155}, dst = {
			{x = gaugePositionX + 10, y = 64, w = 160, h = 20}
		}},
		{id = "lev_unknown", op = {150}, dst = {
			{x = gaugePositionX + 10, y = 64, w = 160, h = 20}
		}},
		
		-- レベル数
		{id = "playlevel", dst = {
			{x = gaugePositionX + 95, y = 27, w = 27, h = 20}
		}},
	}
	
	return parts
end

return {
	load = load
}