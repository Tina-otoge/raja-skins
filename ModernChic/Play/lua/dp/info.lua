--[[
	プレイ情報部分
--]]
local function isBgaPattern1_1()
	return skin_config.option["BGA表示パターン"] == 980
end
local function isBgaPattern16_9()
	return skin_config.option["BGA表示パターン"] == 981
end
local function isNoBGA()
	return skin_config.option["BGA表示パターン"] == 982
end
local function isnotesDistributionOn()
	return skin_config.option["ノート分布隠し"] == 946
end
local function isnotesDistributionOff()
	return skin_config.option["ノート分布隠し"] == 947
end
local function isTiminggraphOn()
	return skin_config.option["タイミンググラフ隠し"] == 950
end
local function isTiminggraphOff()
	return skin_config.option["タイミンググラフ隠し"] == 951
end

local function setRGB()
	-- 難易度によって色を変えてみる
	local RGB = {255, 255, 255}
	if main_state.option(151) then
		RGB = {6, 255, 0}
	elseif main_state.option(152) then
		RGB = {18, 210, 215}
	elseif main_state.option(153) then
		RGB = {255, 192, 0}
	elseif main_state.option(154) then
		RGB = {255, 0, 0}
	elseif main_state.option(155) then
		RGB = {168, 64, 170}
	elseif main_state.option(150) then
		RGB = {195, 195, 195}
	end
	return RGB
end

local function load()
	local parts = {}
	
	parts.image = {
		{id = "centerFrame", src = 1, x = 0, y = 0, w = 8, h = 900},
		{id = "bottomFrame", src = 1, x = 30, y = 758, w = 1164, h = 180},
		{id = "titleFrame", src = 1, x = 30, y = 20, w = 331, h = 92},
		{id = "artistFrame", src = 1, x = 30, y = 120, w = 331, h = 92},
		{id = "notesgraphFrame", src = 1, x = 380, y = 250, w = 331, h = 140},
		{id = "timinggraphFrame", src = 1, x = 380, y = 400, w = 331, h = 54},
		{id = "infoFrame", src = 1, x = 380, y = 20, w = 328, h = 225},

		{id = "bgaFrame1_1", src = 1, x = 30, y = 220, w = 331, h = 331},
		{id = "bgaFrame16_9", src = 1, x = 30, y = 560, w = 331, h = 191},

		{id = "soundOnly1_1", src = 1, x = 1100, y = 1140, w = 321, h = 321},
		{id = "soundOnly16_9", src = 1, x = 1100, y = 1208, w = 321, h = 181},
		
		-- SoundOnly
--		{id = "soundonly", src = 1, x = 570, y = 270, w = 600, h = 350},
		
		-- エフェクター
		{id = "effecter_nonactive", src = 1, x = 380, y = 560, w = 227, h = 28},
		{id = "effecter_active", src = 1, x = 610, y = 560, w = 227, h = 28},
		--LNタイプ
		{id = "btn-lnmode_nonactive", src = 1, x = 380, y = 588, w = 227, h = 84, divy = 3, len = 3, ref = 308},
		{id = "btn-lnmode_active", src = 1, x = 610, y = 588, w = 227, h = 84, divy = 3, len = 3, ref = 308},

		-- ノート分布カバー
		{id = "notesCover", src = 1, x = 0, y = 1270, w = 331, h = 140},
		-- タイミンググラフカバー
		{id = "timingCover", src = 1, x = 0, y = 1420, w = 331, h = 54},
		
		-- 修飾
		{id = "lamp_rhythm", src = 24, x = 0, y = 0, w = 152, h = 108},
		{id = "lamp_gaugeinclease", src = 24, x = 0, y = 0, w = 152, h = 216, divy = 2, cycle = 50, timer = 42},
		{id = "lamp_maxgauge", src = 24, x = 0, y = 0, w = 152, h = 216, divy = 2, cycle = 50, timer = 44},
--		{id = "lamp_maxgauge", src = 24, x = 0, y = 0, w = 152, h = 108, timer = 44},

		-- 難易度画像
		{id = "lev_biginner", src = 1, x = 30, y = 940, w = 165, h = 20},
		{id = "lev_normal", src = 1, x = 30, y = 960, w = 165, h = 20},
		{id = "lev_hyper", src = 1, x = 30, y = 980, w = 165, h = 20},
		{id = "lev_another", src = 1, x = 30, y = 1000, w = 165, h = 20},
		{id = "lev_insame", src = 1, x = 30, y = 1020, w = 165, h = 20},
		{id = "lev_unknown", src = 1, x = 30, y = 1040, w = 165, h = 20},

		-- 使用オプション
		{id = "gaugeAssist", src = 1, x = 195, y = 940, w = 155, h = 20},
		{id = "gaugeEasy", src = 1, x = 195, y = 960, w = 155, h = 20},
		{id = "gaugeNormal", src = 1, x = 195, y = 980, w = 155, h = 20},
		{id = "gaugeHard", src = 1, x = 195, y = 1000, w = 155, h = 20},
		{id = "gaugeExHard", src = 1, x = 195, y = 1020, w = 155, h = 20},
		{id = "gaugeHazard", src = 1, x = 195, y = 1040, w = 155, h = 20},
		{id = "gaugeStandardGrade", src = 1, x = 380, y = 940, w = 155, h = 20},
		{id = "gaugeExGrade", src = 1, x = 380, y = 960, w = 155, h = 20},
		{id = "gaugeExHardGrade", src = 1, x = 380, y = 980, w = 155, h = 20},

		{id = "useOptionLeft", src = 1, x = 590, y = 940, w = 130, h = 200, divy = 10, len = 10, ref = 42},
		{id = "useOptionRight", src = 1, x = 590, y = 940, w = 130, h = 200, divy = 10, len = 10, ref = 43},
	}
	
	parts.value = {
		-- 現在のスコア
		{id = "nowscore", src = 1, x = 1008, y = 940, w = 330, h = 40, divx = 11, divy = 1, digit = 6, ref = 100, zeropadding = 1},
		-- 現在の最大コンボ数
		{id = "maxcombo", src = 1, x = 1008, y = 940, w = 330, h = 40, divx = 11, divy = 1, digit = 5, ref = 105},
		-- 現在のEXスコア
		{id = "nowexscore", src = 1, x = 1008, y = 940, w = 330, h = 40, divx = 11, divy = 1, digit = 4, ref = 101, zeropadding = 1},
		
		-- 最大BPM
		{id = "maxbpm", src = 1, x = 1008, y = 980, w = 210, h = 40, divx = 10, divy = 1, digit = 3, ref = 90, align = 2},
		-- 現在のBPM
		{id = "nowbpm", src = 1, x = 1008, y = 940, w = 300, h = 40, divx = 10, divy = 1, digit = 3, ref = 160, align = 2},
		-- 最小BPM
		{id = "minbpm", src = 1, x = 1008, y = 980, w = 210, h = 40, divx = 10, divy = 1, digit = 3, ref = 91, align = 2},
		
		-- 残り時間
		{id = "min_time", src = 1, x = 720, y = 940, w = 264, h = 20, divx = 11, divy = 1, digit = 2, ref = 163},
		{id = "sec_time", src = 1, x = 720, y = 940, w = 264, h = 20, divx = 11, divy = 1, digit = 2, ref = 164},

		-- 譜面レベル
		{id = "playlevel", src = 1, x = 720, y = 940, w = 264, h = 20, divx = 11, divy = 1, digit = 2, ref = 96},

		-- 総ノート
		{id = "totalNotes", src = 1, x = 720, y = 940, w = 240, h = 20, divx = 10, divy = 1, digit = 4, ref = 74, align = 1},
		-- PG数
		{id = "count_pg", src = 1, x = 720, y = 960, w = 264, h = 20, divx = 11, divy = 1, digit = 4, ref = 110, align = 0},
		-- great数
		{id = "count_gr", src = 1, x = 720, y = 960, w = 264, h = 20, divx = 11, divy = 1, digit = 4, ref = 111, align = 0},
		{id = "count_gr-early", src = 1, x = 720, y = 1100, w = 264, h = 20, divx = 11, divy = 1, digit = 4, ref = 412, align = 0},
		{id = "count_gr-late", src = 1, x = 720, y = 1120, w = 264, h = 20, divx = 11, divy = 1, digit = 4, ref = 413, align = 0},
		-- good数
		{id = "count_gd", src = 1, x = 720, y = 960, w = 264, h = 20, divx = 11, divy = 1, digit = 4, ref = 112, align = 0},
		{id = "count_gd-early", src = 1, x = 720, y = 1100, w = 264, h = 20, divx = 11, divy = 1, digit = 4, ref = 414, align = 0},
		{id = "count_gd-late", src = 1, x = 720, y = 1120, w = 264, h = 20, divx = 11, divy = 1, digit = 4, ref = 415, align = 0},
		-- bad数
		{id = "count_bd", src = 1, x = 720, y = 960, w = 264, h = 20, divx = 11, divy = 1, digit = 4, ref = 113, align = 0},
		{id = "count_bd-early", src = 1, x = 720, y = 1100, w = 264, h = 20, divx = 11, divy = 1, digit = 4, ref = 416, align = 0},
		{id = "count_bd-late", src = 1, x = 720, y = 1120, w = 264, h = 20, divx = 11, divy = 1, digit = 4, ref = 417, align = 0},
		-- poor数
		{id = "count_pr", src = 1, x = 720, y = 960, w = 264, h = 20, divx = 11, divy = 1, digit = 4, ref = 114, align = 0},
		{id = "count_pr-early", src = 1, x = 720, y = 1100, w = 264, h = 20, divx = 11, divy = 1, digit = 4, ref = 418, align = 0},
		{id = "count_pr-late", src = 1, x = 720, y = 1120, w = 264, h = 20, divx = 11, divy = 1, digit = 4, ref = 419, align = 0},
	}
	
	parts.destination = {}

	-- フレーム
	table.insert(parts.destination, {
		id = "centerFrame", dst = {
			{x = 897, y = 180, w = 126, h = 900},
		}
	})
	table.insert(parts.destination, {
		id = "bottomFrame", dst = {
			{x = 378, y = 0, w = 1164, h = 180},
		}
	})
	do
		local RGB = setRGB()
		do
			-- タイトル
			local posx = 10
			local posy = 969
			table.insert(parts.destination, {
				id = "titleFrame", dst = {
					{x = posx, y = posy, w = 331, h = 92},
				}
			})
			table.insert(parts.destination, {
				id = "title", loop = 0, dst = {
					{time = 0, x = (posx + 10) + 311 / 2, y = posy + 25, w = 311, h = 25, r = RGB[1], g = RGB[2], b = RGB[3], a = 0},
					{time = 2000, a = 255},
					{time = 7000},
					{time = 9000, a = 0},
					{time = 18000},
				}
			})
			table.insert(parts.destination, {
				id = "genre", loop = 0, dst = {
					{time = 9000, x = (posx + 10) + 311 / 2, y = posy + 25, w = 311, h = 25, r = RGB[1], g = RGB[2], b = RGB[3], a = 0},
					{time = 11000, a = 255},
					{time = 16000},
					{time = 18000, a = 0},
				}
			})
		end
		do
			local posx = 1579
			local posy = 969
			table.insert(parts.destination, {
				id = "artistFrame", dst = {
					{x = posx, y = posy, w = 331, h = 92},
				}
			})
			table.insert(parts.destination, {
				id = "artist", dst = {
					{x = (posx + 10) + 311 / 2, y = posy + 25, w =  311, h = 25, r = RGB[1], g = RGB[2], b = RGB[3]},
				}
			})
		end
	end
	do
		local posx = 1579
		local posy = 14
		table.insert(parts.destination, {
			id = "infoFrame", dst = {
				{x = posx, y = posy, w = 328, h = 225},
			}
		})
		-- 時間（残り時間60秒で色が変化）
		table.insert(parts.destination, {
			id = "min_time",
			draw = function()
				return (main_state.number(163) * 60) + main_state.number(164) >= 60
			end,
			dst = {
				{x = posx + 82, y = posy + 200, w = 20, h = 20},
			}
		})
		table.insert(parts.destination, {
			id = "sec_time",
			draw = function()
				return (main_state.number(163) * 60) + main_state.number(164) >= 60
			end,
			dst = {
				{x = posx + 140, y = posy + 200, w = 20, h = 20},
			}
		})
		table.insert(parts.destination, {
			id = "min_time",
			draw = function()
				return (main_state.number(163) * 60) + main_state.number(164) < 60
			end,
			dst = {
				{x = posx + 82, y = posy + 200, w = 20, h = 20, r = 253, g = 126, b = 0},
			}
		})
		table.insert(parts.destination, {
			id = "sec_time",
			draw = function()
				return (main_state.number(163) * 60) + main_state.number(164) < 60
			end,
			dst = {
				{x = posx + 140, y = posy + 200, w = 20, h = 20, r = 253, g = 126, b = 0},
			}
		})
		-- 総ノート
		table.insert(parts.destination, {
			id = "totalNotes", dst = {
				{x = posx + 77, y = posy + 168, w = 20, h = 20},
			}
		})
		-- 判定カウンタ
		for i = 1, 13, 1 do
			local wd = {"pg","gr", "gr-early", "gr-late", "gd", "gd-early", "gd-late", "bd", "bd-early", "bd-late", "pr", "pr-early", "pr-late"}
			local adjustx = {77, 77, 160, 244, 77, 160, 244, 77, 160, 244, 77, 160, 244}
			local adjusty = {137, 106, 106, 106, 73, 73, 73, 41, 41, 41, 10, 10, 10}
			table.insert(parts.destination, {
				id = "count_"..wd[i], dst = {
					{x = posx + adjustx[i], y = posy + adjusty[i], w = 20, h = 20},
				}
			})
		end
	end
	-- BGAフレーム
	-- op1080: OPTION_STATE_PRACTICE
	if isBgaPattern16_9() then
		local posx = {10, 10, 10, 1579, 1579, 1579}
		local posy = {760, 516, 272, 760, 516, 272}
		for i = 1, 6, 1 do
			table.insert(parts.destination, {
				id = "bgaFrame16_9", dst = {
					{x = posx[i], y = posy[i], w = 331, h = 191},
				}
			})
			table.insert(parts.destination, {
				id = "bga", op = {-1080, 81}, dst = {
					{x = posx[i] + 5, y = posy[i] + 5, w = 321, h = 181},
				}
			})
			-- bgaなし
			table.insert(parts.destination, {
				id = "soundOnly16_9", op = {170}, dst = {
					{time = 0,x = posx[i] + 5, y = posy[i] + 5, w = 321, h = 181},
					{time = 3000, a = 120},
					{time = 6000, a = 255}
				}
			})
			-- BGA明るさ調整
			table.insert(parts.destination,	{
				id = -110, offsets = {40}, dst = {
					{x = posx[i] + 5, y = posy[i] + 5, w = 321, h = 181, a = 0},
				}
			})
		end
	elseif isBgaPattern1_1() then
		local posx = {10, 10, 1579, 1579}
		local posy = {620, 272, 620, 272}
		for i = 1, 4, 1 do
			table.insert(parts.destination, {
				id = "bgaFrame1_1", dst = {
					{x = posx[i], y = posy[i], w = 331, h = 331},
				}
			})
			table.insert(parts.destination, {
				id = "bga", op = {-1080, 81}, dst = {
					{x = posx[i] + 5, y = posy[i] + 5, w = 321, h = 321},
				}
			})
			-- bgaなし
			table.insert(parts.destination, {
				id = "soundOnly1_1", op = {170}, dst = {
					{time = 0, x = posx[i] + 5, y = posy[i] + 5, w = 321, h = 321},
					{time = 3000, a = 120},
					{time = 6000, a = 255}
				}
			})
			-- BGA明るさ調整
			table.insert(parts.destination,	{
				id = -110, offsets = {40}, dst = {
					{x = posx[i] + 5, y = posy[i] + 5, w = 321, h = 321, a = 0},
				}
			})
		end
	elseif isNoBGA() then
		local posx = {10, 10, 1579, 1579}
		local posy = {620, 272, 620, 272}
		for i = 1, 4, 1 do
			table.insert(parts.destination, {
				id = "bgaFrame1_1", dst = {
					{x = posx[i], y = posy[i], w = 331, h = 331},
				}
			})
			table.insert(parts.destination, {
				id = "soundOnly1_1", dst = {
					{time = 0, x = posx[i] + 5, y = posy[i] + 5, w = 321, h = 321},
					{time = 3000, a = 120},
					{time = 6000, a = 255}
				}
			})
		end
	end
	-- エフェクター
	-- op172: LNが存在しない
	-- op173: LNが存在する
	if main_state.option(172) then
		table.insert(parts.destination,	{
			id = "effecter_nonactive", dst = {
				{x = 848, y = 6, w = 227, h = 28}
			}
		})
		table.insert(parts.destination,	{
			id = "effecter_active", timer = 140, dst = {
				{time = 0, x = 848, y = 6, w = 227, h = 28},
				{time = 1000, a = 50}
			}
		})
	elseif main_state.option(173) then
		table.insert(parts.destination,	{
			id = "btn-lnmode_nonactive", dst = {
				{x = 848, y = 6, w = 227, h = 28}
			}
		})
		table.insert(parts.destination,	{
			id = "btn-lnmode_active", timer = 140, dst = {
				{time = 0, x = 848, y = 6, w = 227, h = 28},
				{time = 1000, a = 50}
			}
		})
	end
	do
		local posx = 10
		local posy = 99
		-- ノート分布グラフ
		if isnotesDistributionOn() then
			table.insert(parts.destination, {
				id = "notesgraphFrame", dst = {
					{x = posx, y = posy, w = 331, h = 140},
				}
			})
			table.insert(parts.destination, {
				id = "judgegraph", dst = {
					{x = posx + 10, y = posy + 10, w = 311, h = 108},
				}
			})
			table.insert(parts.destination, {
				id = "bpmgraph", dst = {
					{x = posx + 10, y = posy + 10, w = 311, h = 108},
				}
			})
		elseif isnotesDistributionOff() then
			table.insert(parts.destination, {
				id = "notesCover", dst = {
					{x = posx, y = posy, w = 331, h = 140},
				}
			})
		end
	end

	do
		local posx = 10
		local posy = 23
		-- タイミンググラフ
		if isTiminggraphOn() then
		table.insert(parts.destination, {
			id = "timinggraphFrame", dst = {
				{x = posx, y = posy, w = 331, h = 54},
			}
		})
		table.insert(parts.destination, {
			id = "timing", dst = {
				{x = posx + 10, y = posy + 5, w = 311, h = 30},
			}
		})
		elseif isTiminggraphOff() then
			table.insert(parts.destination, {
				id = "timingCover", dst = {
					{x = posx, y = posy, w = 331, h = 54},
				}
			})
		end
	end
	do
		-- 修飾
		local num = 2
		local posx = {360, 1386}
		local posy = 0
		for i = 1, num, 1 do
			table.insert(parts.destination,	{
				id = "lamp", dst = {
					{x = posx[i], y = posy, w = 152, h = 108}
				}
			})
			-- 修飾（リズムタイマー）
			-- op240: ゲージが100%
			-- op941: ゲージMAXインジケータ表示あり
			table.insert(parts.destination,	{
				id = "lamp_rhythm", timer = 140, op = {941, -240}, dst = {
					{time = 0, x = posx[i], y = posy, w = 152, h = 108},
					{time = 1000, a = 150}
				}
			})
			-- 修飾(ゲージMAX)
			table.insert(parts.destination,	{
				id = "lamp_maxgauge", op = {941}, timer = 44, dst = {
					{x = posx[i], y = posy, w = 152, h = 108}
				}
			})
		end
	end

	-- 難易度
	do
		local wd = {"biginner", "normal", "hyper", "another", "insame", "unknown"}
		local op = {151, 152, 153, 154, 155, 150}
		for i = 1, 6, 1 do
			table.insert(parts.destination, {
				id = "lev_"..wd[i], op = {op[i]}, dst = {
					{x = 400, y = 117, w = 165, h = 20}
				}
			})
		end
		table.insert(parts.destination, {
			id = "playlevel", dst = {
				{x = 635, y = 119, w = 24, h = 20},
			}
		})
	end

	-- 使用ゲージ＆オプション
	do
		local wd = {"Assist", "Easy", "Normal", "Hard", "ExHard", "Hazard", "StandardGrade", "ExGrade", "ExHardGrade"}
		for i = 1, 9, 1 do
			table.insert(parts.destination, {
				id = "gauge"..wd[i],
				draw = function()
					return main_state.gauge_type() == i - 1
				end,
				dst = {
					{x = 1224, y = 145, w = 155, h = 20},
				}
			})
		end
	end
	table.insert(parts.destination, {
		id = "useOptionLeft", dst = {
			{x = 1230, y = 117, w = 130, h = 20},
		}
	})
	table.insert(parts.destination, {
		id = "useOptionRight", dst = {
			{x = 1380, y = 117, w = 130, h = 20},
		}
	})

	-- 現在のスコア
	table.insert(parts.destination, {
		id = "nowscore", dst = {
			{x = 540, y = 39, w = 30, h = 40},
		}
	})
	-- 最大コンボ
	table.insert(parts.destination, {
		id = "maxcombo", dst = {
			{x = 1192, y = 39, w = 30, h = 40},
		}
	})
	-- BPM
	table.insert(parts.destination, {
		id = "minbpm", op = {177}, dst = {
			{x = 800, y = 58, w = 21, h = 40},
		}
	})
	table.insert(parts.destination, {
		id = "nowbpm", dst = {
			{x = 915, y = 63, w = 30, h = 40},
		}
	})
	table.insert(parts.destination, {
		id = "maxbpm", op = {177}, dst = {
			{x = 1058, y = 58, w = 21, h = 40},
		}
	})

	return parts
end

return {
	load = load
}