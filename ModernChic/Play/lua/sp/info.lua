--[[
	プレイ情報部分
--]]
local function isBgaPattern1_1()
	return skin_config.option["BGA表示パターン"] == 950
end
local function isBgaPattern16_9()
	return skin_config.option["BGA表示パターン"] == 951
end
local function isBgaPattern1_1_x2()
	return skin_config.option["BGA表示パターン"] == 952
end
local function isBgaPattern16_9_x4()
	return skin_config.option["BGA表示パターン"] == 953
end
local function isNoBGA()
	return skin_config.option["BGA表示パターン"] == 954
end
local function isnotesDistributionOn()
	return skin_config.option["ノート分布隠し"] == 934
end
local function isnotesDistributionOff()
	return skin_config.option["ノート分布隠し"] == 935
end
local function isTiminggraphOn()
	return skin_config.option["タイミンググラフ隠し"] == 936
end
local function isTiminggraphOff()
	return skin_config.option["タイミンググラフ隠し"] == 937
end
local function isInfoDisplayTypeA()
	return skin_config.option["スコアグラフ、ノート分布、タイミングエリアの配置"] == 985
end
local function isInfoDisplayTypeB()
	return skin_config.option["スコアグラフ、ノート分布、タイミングエリアの配置"] == 986
end

local function load(infoPositionX)
	local parts = {}
	
	parts.image = {
		-- 1P用タイトルフレーム
		{id = "infoTitleFrame1p", src = 2, x = 0, y = 0, w = 1350, h = 46},
		-- 2P用タイトルフレーム
		{id = "infoTitleFrame2p", src = 2, x = 0, y = 58, w = 1350, h = 46},
		-- BGA,score,bpm,comboフレーム
		{id = "infoFrame", src = 2, x = 0, y = 110, w = 1350, h = 811},
		-- ノート分布グラフフレーム
		{id = "infoNotesDistributionFrame", src = 2, x = 808, y = 926, w = 519, h = 142},
		-- 判定グラフフレーム
		{id = "infoJudgegraphFrame", src = 2, x = 808, y = 1072, w = 519, h = 54},
		
		{id = "roulette_number_1", src = 1, x = 0, y = 950, w = 280, h = 36, divx = 10, cycle = 100},
		{id = "roulette_number_2", src = 1, x = 0, y = 950, w = 280, h = 36, divx = 10, cycle = 200},
		{id = "roulette_number_3", src = 1, x = 0, y = 950, w = 280, h = 36, divx = 10, cycle = 400},
		
		-- SoundOnly
		{id = "soundonly", src = 1, x = 570, y = 270, w = 600, h = 350},
		
		-- エフェクターフレーム
		{id = "effecter_frame", src = 1, x = 810, y = 1050, w = 308, h = 37},
		-- エフェクター
		{id = "effecter_nonactive", src = 1, x = 600, y = 0, w = 227, h = 28},
		{id = "effecter_active", src = 1, x = 830, y = 0, w = 227, h = 28},
		
		--LNタイプ
		{id = "btn-lnmode_nonactive", src = 1, x = 600, y = 28, w = 227, h = 84, divy = 3, len = 3, ref = 308},
		{id = "btn-lnmode_active", src = 1, x = 830, y = 28, w = 227, h = 84, divy = 3, len = 3, ref = 308},
		
		-- ノート分布カバー
		{id = "notesCover", src = 2, x = 780, y = 1130, w = 519, h = 140},
		-- タイミンググラフカバー
		{id = "timingCover", src = 2, x = 780, y = 1280, w = 519, h = 54},
		
		-- 修飾
		{id = "lamp_rhythm", src = 24, x = 0, y = 0, w = 152, h = 108},
		{id = "lamp_gaugeinclease", src = 24, x = 0, y = 0, w = 152, h = 216, divy = 2, cycle = 50, timer = 42},
		{id = "lamp_maxgauge", src = 24, x = 0, y = 0, w = 152, h = 216, divy = 2, cycle = 50, timer = 44},
--		{id = "lamp_maxgauge", src = 24, x = 0, y = 0, w = 152, h = 108, timer = 44},
	}
	
	parts.value = {
		-- 現在のスコア
		{id = "nowscore", src = 1, x = 0, y = 950, w = 308, h = 36, divx = 11, divy = 1, digit = 6, ref = 100, zeropadding = 1},
		-- 現在の最大コンボ数
		{id = "maxcombo", src = 1, x = 0, y = 950, w = 308, h = 36, divx = 11, divy = 1, digit = 5, ref = 105},
		-- 現在のEXスコア
		{id = "nowexscore", src = 1, x = 1400, y = 101, w = 270, h = 20, divx = 11, divy = 1, digit = 4, ref = 101, zeropadding = 1},
		
		-- 最大BPM
		{id = "maxbpm", src = 1, x = 0, y = 950, w = 280, h = 36, divx = 10, divy = 1, digit = 3, ref = 90, align = 2},
		-- 現在のBPM
		{id = "nowbpm", src = 1, x = 0, y = 950, w = 280, h = 36, divx = 10, divy = 1, digit = 3, ref = 160, align = 2},
		-- 最小BPM
		{id = "minbpm", src = 1, x = 0, y = 950, w = 280, h = 36, divx = 10, divy = 1, digit = 3, ref = 91, align = 2},
		
		-- 残り時間
		{id = "min_time", src = 1, x = 1400, y = 81, w = 297, h = 20, divx = 11, divy = 1, digit = 2, ref = 163},
		{id = "sec_time", src = 1, x = 1400, y = 81, w = 297, h = 20, divx = 11, divy = 1, digit = 2, ref = 164},
	}
	
	parts.destination = {}
	
	do
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
		
		-- タイトル、アーティスト、ジャンルポジション
		local topInfoPosX
		-- 残り分数ポジション
		local minPosX
		-- 残り秒数ポジション
		local secPosX
		
		if is_left_position() then
			topInfoPosX = 775
			minPosX = 100
			secPosX = 170
			-- 2P用タイトルフレーム
			table.insert(parts.destination,{
				id = "infoTitleFrame1p", dst = {
					{x = infoPositionX, y = 1026, w = 1350, h = 46},
				}
			})
		elseif is_right_position() then
			topInfoPosX = 575
			minPosX = 1200
			secPosX = 1270
			-- 2P用タイトルフレーム
			table.insert(parts.destination,{
				id = "infoTitleFrame2p", dst = {
					{x = infoPositionX, y = 1026, w = 1350, h = 46},
				}
			})
		end
		-- タイトル、アーティスト、ジャンルの順にループ
		-- 中央寄せ（align:1）なのでx値は中心位置
		table.insert(parts.destination,	{
			id = "title", loop = 0, dst = {
				{time = 0, x = infoPositionX + topInfoPosX, y = 1033, w = 1040, h = 25, a = 0, r = RGB[1], g = RGB[2], b = RGB[3]},
				{time = 2000, a = 255},
				{time = 7000},
				{time = 9000, a = 0},
				{time = 27000}
			}
		})
		table.insert(parts.destination,	{
			id = "artist", loop = 0, dst = {
				{time = 9000, x = infoPositionX + topInfoPosX, y = 1033, w = 1040, h = 25, a = 0, r = RGB[1], g = RGB[2], b = RGB[3]},
				{time = 11000, a = 255},
				{time = 16000},
				{time = 18000, a = 0},
				{time = 27000}
			}
		})
		table.insert(parts.destination,	{
			id = "genre", loop = 0, dst = {
				{time = 18000, x = infoPositionX + topInfoPosX, y = 1033, w = 1040, h = 25, a = 0, r = RGB[1], g = RGB[2], b = RGB[3]},
				{time = 20000, a = 255},
				{time = 25000},
				{time = 27000, a = 0},
			}
		})
		-- 残り時間
		table.insert(parts.destination,	{
			id = "min_time",
			draw = function()
				return (main_state.number(163) * 60) + main_state.number(164) >= 60
			end,
			dst = {
				{x = infoPositionX + minPosX, y = 1031, w = 27, h = 20},
			}
		})
		table.insert(parts.destination,	{
			id = "sec_time",
			draw = function()
				return (main_state.number(163) * 60) + main_state.number(164) >= 60
			end,
			dst = {
				{x = infoPositionX + secPosX, y = 1031, w = 27, h = 20},
			}
		})
		-- 残り時間が60秒を切ると色を変える
		table.insert(parts.destination,	{
			id = "min_time",
			draw = function()
				return (main_state.number(163) * 60) + main_state.number(164) < 60
			end,
			dst = {
				{x = infoPositionX + minPosX, y = 1031, w = 27, h = 20, r = 253, g = 126, b = 0},
			}
		})
		table.insert(parts.destination,	{
			id = "sec_time",
			draw = function()
				return (main_state.number(163) * 60) + main_state.number(164) < 60
			end,
			dst = {
				{x = infoPositionX + secPosX, y = 1031, w = 27, h = 20, r = 253, g = 126, b = 0},
			}
		})
	end
	
	-- BGA,score,bpm,combo用フレーム
	table.insert(parts.destination,{
		id = "infoFrame", dst = {
			{x = infoPositionX, y = 209, w = 1350, h = 811},
		}
	})
	
	-- 現在のスコア
	table.insert(parts.destination,	{
		id = "nowscore", dst = {
			{x = infoPositionX + 250, y = 222, w = 28, h = 36},
		}
	})
	
	-- スコアの数字ぐるぐる
	--[[
		timer: 50-57 ボムタイマー（GREAT以上で動作）
		time: 46の判定時タイマーはpoor, badでも動くので不適か？
	]]
	do
		local num = 8
		local timer = {50, 51, 52, 53, 54, 55, 56, 57}
		local duration = 400
		for i = 1, num, 1 do
			-- 1桁目
			table.insert(parts.destination, {
				id = "roulette_number_1", timer = timer[i], loop = -1, dst = {
					{time = 0, x = infoPositionX + 390, y = 222, w = 28, h = 36},
					{time = duration}
				}
			})
			-- 2桁目
			table.insert(parts.destination, {
				id = "roulette_number_2", timer = timer[i], loop = -1, dst = {
					{time = 0, x = infoPositionX + 362, y = 222, w = 28, h = 36},
					{time = duration}
				}
			})
			-- 3桁目
			table.insert(parts.destination, {
				id = "roulette_number_3", timer = timer[i], loop = -1, dst = {
					{time = 0, x = infoPositionX + 334, y = 222, w = 28, h = 36},
					{time = duration}
				}
			})
		end
	end
	
	-- 最大コンボ
	-- op331: 最大コンボ更新時
	table.insert(parts.destination,	{
		id = "maxcombo", dst = {
			{x = infoPositionX + 950, y = 222, w = 28, h = 36},
		}
	})
	-- bpm関連
	table.insert(parts.destination,	{
		id = "maxbpm", op = {177}, dst = {
			{x = infoPositionX + 773, y = 232, w = 21, h = 27},
		}
	})
	table.insert(parts.destination,	{
		id = "nowbpm", dst = {
			{x = infoPositionX + 636, y = 232, w = 28, h = 36},
		}
	})
	table.insert(parts.destination,	{
		id = "minbpm", op = {177}, dst = {
			{x = infoPositionX + 517, y = 232, w = 21, h = 27},
		}
	})
	
	do
		local posX
		local judgegraphPosX
		if isInfoDisplayTypeA() then
			posX = 808
			judgegraphPosX = 832
		elseif isInfoDisplayTypeB() then
			posX = 23
			judgegraphPosX = 47
		end
		-- 判定グラフ
		table.insert(parts.destination,{
			id = "infoNotesDistributionFrame", dst = {
				{x = infoPositionX + posX, y = 62, w = 519, h = 142},
			}
		})
		if isnotesDistributionOn() then
			table.insert(parts.destination,	{
				id = "-110", op = {934}, dst = {
					{time = 0, x = infoPositionX + judgegraphPosX, y = 71, w = 472, h = 107, a = 100}
				}
			})
			table.insert(parts.destination,	{
				id = "judgegraph", op = {934}, dst = {
					{time = 0, x = infoPositionX + judgegraphPosX, y = 71, w = 472, h = 107}
				}
			})
			table.insert(parts.destination,	{
				id = "bpmgraph", op = {934}, dst = {
					{time = 0, x = infoPositionX + judgegraphPosX, y = 71, w = 472, h = 107}
				}
			})
		elseif isnotesDistributionOff() then
			table.insert(parts.destination,	{
				id = "notesCover", op = {935}, dst = {
					{x = infoPositionX + posX, y = 62, w = 519, h = 140},
				}
			})
		end
			
		-- タイミンググラフ
		table.insert(parts.destination,{
			id = "infoJudgegraphFrame", dst = {
				{x =infoPositionX + posX , y = 4, w = 519, h = 54},
			}
		})
		if isTiminggraphOn() then
			table.insert(parts.destination,	{
				id = "timing", op = {936}, dst = {
					{time = 0, x = infoPositionX + judgegraphPosX, y = 8, w = 472, h = 30}
				}
			})
		elseif isTiminggraphOff() then
			table.insert(parts.destination,	{
				id = "timingCover", op = {937}, dst = {
					{x = infoPositionX + posX, y = 4, w = 519, h = 54},
				}
			})
		end
	end
	
	-- BGA
	do
		if isNoBGA() then
			-- soundonly画像
			table.insert(parts.destination,{
				id = "soundonly", op = {954, 171}, timer = 41, blend = 2, dst = {
					{x = infoPositionX + 376, y = 451, w = 600, h = 350}
				}
			})
		else
			local num
			local op
			local posX = {}
			local posY = {}
			local width
			local height
			if isBgaPattern1_1() then
				num = 1
				op = 950
				posX = {316}
				posY = {290}
				width = 720
				height = 720
			elseif isBgaPattern16_9() then
				num = 1
				op = 951
				posX = {36}
				posY = {290}
				width = 1280
				height = 720
			elseif isBgaPattern1_1_x2() then
				num = 2
				op = 952
				posX = {43, 679}
				posY = {335, 335}
				width = 630
				height = 630
			elseif isBgaPattern16_9_x4() then
				num = 4
				op = 953
				posX = {50, 679, 50, 679}
				posY = {297, 297, 652, 652}
				width = 624
				height = 351
			end
			-- 配置
			if isBgaPattern16_9() then
				table.insert(parts.destination, {
					id = "bga", op = {171}, stretch = 3, dst = {
						{x = infoPositionX + 36, y = 290, w = 1280, h = 720, a = 100}
					}
				})
			end
			if isBgaPattern16_9_x4() then
				for i = 1, num, 1 do
					table.insert(parts.destination, {
						id = "bga", op = {op, 171}, stretch = 3, dst = {
							{x = infoPositionX + posX[i], y = posY[i], w = width, h = height, a = 100}
						}
					})
				end
			end
			for i = 1, num, 1 do
				table.insert(parts.destination, {
					id = "bga", op = {op, 171}, dst = {
						{x = infoPositionX + posX[i], y = posY[i], w = width, h = height}
					}
				})
			end
		end
	end
	
	-- 汎用BGA
	-- op170: BGAなし
	-- op171: BGAあり
	if main_state.option(170) and isHanyoTypeMovie() then
		table.insert(parts.image,{
			id = "bga_hanyo", src = 23, x = 0, y = 0, w = 1280, h = 720
		})
		table.insert(parts.destination,	{
			id = "bga_hanyo", op = {170, 990}, timer = 41, dst = {
				{x = infoPositionX + 36, y = 290, w = 1280, h = 720}
			}
		})
	elseif main_state.option(170) and isHanyoTypeImage() then
		table.insert(parts.image,{
			id = "bga_hanyo", src = 27, x = 0, y = 0, w = 1280, h = 720
		})
		table.insert(parts.destination,	{
			id = "bga_hanyo", op = {170, 991}, timer = 41, dst = {
				{x = infoPositionX + 36, y = 290, w = 1280, h = 720}
			}
		})
	elseif main_state.option(170) and isHanyoDisable() then
		-- soundonly画像
		table.insert(parts.destination,{
			id = "soundonly", op = {170, 992}, timer = 41, blend = 2, dst = {
				{x = infoPositionX + 376, y = 451, w = 600, h = 350}
			}
		})
	end
		
	-- BGAの明るさ調節
	table.insert(parts.destination,	{
		id = -110, offsets = {40}, dst = {
			{x = infoPositionX + 36, y = 290, w = 1280, h = 720, a = 0},
		}
	})
		
	-- エフェクターフレーム
	-- op172: LNが存在しない
	-- op173: LNが存在する
	table.insert(parts.destination,	{
		id = "effecter_frame", dst = {
			{x = infoPositionX + 522, y = 279, w = 308, h = 37},
		}
	})
	if main_state.option(172) then
		table.insert(parts.destination,	{
			id = "effecter_nonactive", op = {172}, dst = {
				{x = infoPositionX + 563, y = 283, w = 227, h = 28}
			}
		})
		table.insert(parts.destination,	{
			id = "effecter_active", op = {172}, timer = 140, dst = {
				{time = 0, x = infoPositionX + 563, y = 283, w = 227, h = 28},
				{time = 1000, a = 50}
			}
		})
	elseif main_state.option(173) then
		-- LNがある場合はエフェクターを変える
		table.insert(parts.destination,	{
			id = "btn-lnmode_nonactive", op = {173}, dst = {
				{x = infoPositionX + 563, y = 283, w = 227, h = 28}
			}
		})
		table.insert(parts.destination,	{
			id = "btn-lnmode_active", op = {173}, timer = 140, dst = {
				{time = 0, x = infoPositionX + 563, y = 283, w = 227, h = 28},
				{time = 1000, a = 50}
			}
		})
	end
		
	-- 修飾
	do
		local num = 2
		local posX = {38, 1164}
		
		for i = 1, num, 1 do
			table.insert(parts.destination,	{
				id = "lamp", dst = {
					{x = infoPositionX + posX[i], y = 180, w = 152, h = 108}
				}
			})
			-- 修飾（リズムタイマー）
			-- op240: ゲージが100%
			-- op976: ゲージMAXインジケータ表示あり
			table.insert(parts.destination,	{
				id = "lamp_rhythm", timer = 140, op = {976, -240}, dst = {
					{time = 0,x = infoPositionX + posX[i], y = 180, w = 152, h = 108},
					{time = 1000, a = 150}
				}
			})
			-- 修飾(ゲージMAX)
			table.insert(parts.destination,	{
				id = "lamp_maxgauge", op = {976}, timer = 44, dst = {
					{x = infoPositionX + posX[i], y = 180, w = 152, h = 108}
				}
			})
		end
	end
	return parts
end

return {
	load = load
}