local parts = {}

local OP_RANK_OFF	= get_property_op()
local OP_RANK_ON	= get_property_op()

parts.property = {
	{name = "プレイヤーランクを使用する", item = {
		{name = "OFF",	op = OP_RANK_OFF},
		{name = "ON",	op = OP_RANK_ON}
	},def = "ON"},	
}

local function load()

	if skin_config.option["プレイヤーランクを使用する"] == OP_RANK_ON then
	
		local font1_id = "font-default-commonparts-VL-Gothic-Regular"
	
		-- プレイヤーランクの表示
		-- 現在のランク
		local current_rank = 0
		-- 累計経験値
		local total_exp = 0
		-- 次のランクまでに必要な経験値
		local next_exp = 0
		-- 次のランクまでに必要な経験値(割合)
		local next_exp_per = 0
		-- 現在のランクの経験値
		local current_exp = 0
		-- ランク到達に必要な累計経験値
		local next_total_exp = 0
		
		do
			-- ランク上限
			local rank_cap = 300
			-- 累計パーフェクトグレート数
			local total_pf = main_state.number(33)
			-- 累計グレート数
			local total_gr = main_state.number(34)
			-- 累計経験値(累計EXスコア)
			total_exp = (total_pf * 2) + (total_gr)
			
			-- 経験値テーブル計算用
			local rank_exp_0_100	= 50000
			local rank_exp_100_200	= 100000
			local rank_exp_200_250	= 150000
			local rank_exp_250_300	= 300000
			--[[ 確認用
			local f1 = io.open("skin/m_select/exp_table.txt", "w")
			local f2 = io.open("skin/m_select/total_exp_table.txt", "w")
			--]]
			for i = 1, rank_cap do
				if i <= 100 then		next_exp = ((rank_exp_0_100 / 100) * i)
				elseif i < 200 then		next_exp = rank_exp_0_100 + ((rank_exp_100_200 / 100) * (i - 100))
				elseif i < 250 then		next_exp = rank_exp_0_100 + rank_exp_100_200 + ((rank_exp_200_250 / 50) * (i - 200))
				elseif i < 300 then		next_exp = rank_exp_0_100 + rank_exp_100_200 + rank_exp_200_250 + ((rank_exp_250_300 / 50) * (i - 250))
				elseif i == 300 then	next_exp = 0
				end
				next_total_exp = next_total_exp + next_exp
				--[[
				f1:write(next_exp .. "\n")
				f2:write(next_total_exp .. "\n")
				--]]
				current_rank = i
				if next_total_exp > total_exp then 
					current_exp = next_exp - (next_total_exp - total_exp)
					next_exp_per = (current_exp / next_exp)
					break
				end
			end
			--[[
			f1:close()
			f2:close()
			--]]			
		end
		parts.source = {
			{id = "src-default_playerrank2_parts", path = "customize/advanced/default_playerrank2/parts.png"}
		}
		
		parts.image = {
			{id = "default_playerrank2_panel", src = "src-default_playerrank2_parts", x = 0, y = 0, w = 280, h = 50},
			{id = "default_playerrank2_graph", src = "src-default_playerrank2_parts", x = 0, y = 50, w = 180, h = 11},
		}
		
		parts.value = {
			{id = "default_playerrank2_player_rank_count",			src = "src-default_playerrank2_parts", x = 0, y = 61, w = 140, h = 19, divx = 10, align = 2, digit = 3, value = function() return current_rank end},
			{id = "default_playerrank2_player_next_exp_count",		src = "src-default_playerrank2_parts", x = 0, y = 80, w = 90, h = 9, divx = 10, digit = 10, value = function() return next_exp end},
			{id = "default_playerrank2_player_current_exp_count",	src = "src-default_playerrank2_parts", x = 0, y = 80, w = 90, h = 9, divx = 10, align = 1, digit = 10, value = function() return current_exp end},
			{id = "default_playerrank2_player_total_exp_count",		src = "src-default_playerrank2_parts", x = 0, y = 80, w = 90, h = 9, divx = 10, digit = 10, value = function() return total_exp end},	
		}
		parts.text = {{id = "default_playerrank2_player_name", font = font1_id, size = 14, overflow = 1, ref = 2}}
		
		local player_rank_x = 40
		local player_rank_y = 990
		local graph_width = 180 * next_exp_per

		parts.destination = {
			{id = "default_playerrank2_panel",						dst = {{x = player_rank_x,			y = player_rank_y,		w = 280, h = 50}}},
			{id = "default_playerrank2_player_name",				dst = {{x = player_rank_x + 64,		y = player_rank_y + 29,	w = 119, h = 14}}},
			{id = "default_playerrank2_graph",						dst = {{x = player_rank_x + 94,		y = player_rank_y + 6,	w = graph_width, h = 11}}},
			{id = "default_playerrank2_player_rank_count",			dst = {{x = player_rank_x + 8,		y = player_rank_y + 7,	w = 14, h = 19}}},
			{id = "default_playerrank2_player_next_exp_count",		dst = {{x = player_rank_x + 183,	y = player_rank_y + 7,	w = 9, h = 9, a = 192}}},
			{id = "default_playerrank2_player_current_exp_count",	dst = {{x = player_rank_x + 95,		y = player_rank_y + 7,	w = 9, h = 9, a = 192}}},
			{id = "default_playerrank2_player_total_exp_count",		dst = {{x = player_rank_x + 183,	y = player_rank_y + 29,	w = 9, h = 9, a = 80}}},
		}
	end
	
	return parts	
end

return {
	parts = parts,
	load = load
}