--[[
	曲読み込み時,practiceモード待機時
	
	timer:40 READY
	timer:143 最終ノートタイマー1P
	
	op:80 ロード未完了
	op:81 ロード完了
	op:190 STAGEFILE無し
	op:191 STAGEFILE有り
	op:194 BACKBMPなし
	op:195 BACKBMPあり
	
	playsidePositionX : レーン基準点
	
	playstart = 1000(ms) timer40
	
--]]

function isAutoplayInfoOff()
	return skin_config.option["オートプレイ＆リプレイ時の案内"] == 953
end
function isAutoplayInfoOn()
	return skin_config.option["オートプレイ＆リプレイ時の案内"] == 954
end

local function load(laneLeftPosX, laneRightPosX, notesPositionY)
	local parts = {}
	
	local loadingWindowPosX = {laneLeftPosX + 70, laneRightPosX + 70}
	local loadingWindowPosY = 420
	local plaseWaitX = {laneLeftPosX + 8, laneRightPosX + 8}
	local centerPosX = 1920 / 2
	
	parts.image = {
		{id = "loadingwindow", src = 1, x = 720, y = 220, w = 380, h = 311},
		{id = "loading_barframe", src = 1, x = 1050, y = 120, w = 304, h = 30},
		{id = "loading_notesinfo", src = 1, x = 1100, y = 340, w = 184, h = 86},
		{id = "loading_wd1", src = 1, x = 1100, y = 220, w = 510, h = 60},
		{id = "loading_wd2", src = 1, x = 1100, y = 280, w = 510, h = 60},
		{id = "preautoinfo", src = 1, x = 720, y = 20, w = 318, h = 165},
		{id = "emblem", src = 1, x = 380, y = 680, w = 996, h = 74},
	}
	
	parts.value = {
		-- ロード状況％
		{id = "loading_par", src = 1, x = 720, y = 960, w = 264, h = 20, divx = 11, divy = 1, digit = 3, ref = 165, align = 1},
		-- 総ノート数（鍵盤のみ）
		{id = "totalnote-normal", src = 1, x = 720, y = 960, w = 264, h = 20, divx = 11, divy = 1, digit = 4, ref = 350},
		-- 総皿
		{id = "totalnote-scr", src = 1, x = 720, y = 960, w = 264, h = 20, divx = 11, divy = 1, digit = 4, ref = 352},
		-- 総LN
		{id = "totalnote-ln", src = 1, x = 720, y = 960, w = 264, h = 20, divx = 11, divy = 1, digit = 4, ref = 351},
		-- 総bss
		{id = "totalnote-bss", src = 1, x = 720, y = 960, w = 264, h = 20, divx = 11, divy = 1, digit = 4, ref = 353},
	}
	
	parts.graph = {
		-- ロード状況
		{id = "loading_bar", src = 1, x = 1050, y = 150, w = 300, h = 26, angle = 2, type = 102},
	}
	
	parts.judgegraph = {
		{id = "notesgraph", type = 0},
	}
	
	parts.destination = {}
	
	-- songinfoframe
	-- op:270 スタートボタン押下
	do
		local op = {-270, 270}
		local alpha1 = {0, 150}
		local alpha2 = {255, 0}
		local alpha3 = {100, 0}
		local RGB = {255, 255, 255}
		for i = 1, 2, 1 do
			-- please wait
			table.insert(parts.destination,	{
				id = "loading_wd1", op = {80}, offset = 3, dst = {
					{time = 0, x = plaseWaitX[i], y = 320, w = 510, h = 60, acc = 1, a = 140},
					{time = 1000, a = 80},
					{time = 2000, a = 140}
				}
			})
			-- good ruck
			table.insert(parts.destination,	{
				id = "loading_wd2", op = {81}, loop = 1000, timer = 40, offset = 3, dst = {
					{time = 0, x = plaseWaitX[i], y = 320, w = 510, h = 60, acc = 1},
					{time = 1000, y = 300, a = 0}
				}
			})
		end
		for i = 1, 2, 1 do
			for j = 1, 2, 1 do
				table.insert(parts.destination,	{
					id = "loadingwindow", op = {80, op[j]}, offset = 3, dst = {
						{x = loadingWindowPosX[i], y = loadingWindowPosY, w = 380, h = 311, a = alpha1[j]}
					}
				})
				table.insert(parts.destination,	{
					id = "notesgraph", op = {80, op[j]}, offset = 3, dst = {
						{x = loadingWindowPosX[i] + 38, y = loadingWindowPosY + 161, w = 304, h = 100, a = alpha1[j]}
					}
				})
				table.insert(parts.destination,	{
					id = "bpmgraph", op = {80, op[j]}, offset = 3, dst = {
						{x = loadingWindowPosX[i] + 38, y = loadingWindowPosY + 161, w = 304, h = 100, a = alpha1[j]}
					}
				})
				table.insert(parts.destination,	{
					id = "loading_notesinfo", op = {80, op[j]}, offset = 3, dst = {
						{x = loadingWindowPosX[i] + 48, y = loadingWindowPosY + 56, w = 184, h = 86, a = alpha1[j]}
					}
				})
				table.insert(parts.destination,	{
					id = "totalnote-normal", op = {80, op[j]}, offset = 3, dst = {
						{x = loadingWindowPosX[i] + 98, y = loadingWindowPosY + 114, w = 20, h = 20, a = alpha1[j]}
					}
				})
				table.insert(parts.destination,	{
					id = "totalnote-ln", op = {80, op[j]}, offset = 3, dst = {
						{x = loadingWindowPosX[i] + 242, y = loadingWindowPosY + 114, w = 20, h = 20, a = alpha1[j]}
					}
				})
				table.insert(parts.destination,	{
					id = "totalnote-scr", op = {80, op[j]}, offset = 3, dst = {
						{x = loadingWindowPosX[i] + 98, y = loadingWindowPosY + 65, w = 20, h = 20, a = alpha1[j]}
					}
				})
				table.insert(parts.destination,	{
					id = "totalnote-bss", op = {80, op[j]}, offset = 3, dst = {
						{x = loadingWindowPosX[i] + 242, y = loadingWindowPosY + 65, w = 20, h = 20, a = alpha1[j]}
					}
				})
				table.insert(parts.destination,	{
					id = "loading_barframe", op = {80, op[j]}, offset = 3, dst = {
						{x = loadingWindowPosX[i] + 38, y = loadingWindowPosY +12, w = 304, h = 30, a = alpha1[j]}
					}
				})
				table.insert(parts.destination,	{
					id = "loading_bar", op = {80, op[j]}, offset = 3, dst = {
						{x = loadingWindowPosX[i] + 40, y = loadingWindowPosY + 14, w = 300, h = 26, a = alpha1[j]}
					}
				})
				table.insert(parts.destination,	{
					id = "loading_par", op = {80, op[j]}, offset = 3, dst = {
						{x = loadingWindowPosX[i] + 130, y = loadingWindowPosY + 16, w = 24, h = 20, a = alpha1[j]}
					}
				})
				table.insert(parts.destination,	{
					id = "per", offset = 3, op = {80, op[j]}, offset = 3, dst = {
						{x = loadingWindowPosX[i] + 225, y = loadingWindowPosY + 16, w = 24, h = 18, a = alpha1[j]}
					}
				})

				-- BACKBMP(-101)がある場合は優先（タイトル、ジャンル、アーティストは消す）
				-- stretch:1 アスペクト比を保ちつつ描画先の範囲に収まるように伸縮する
				-- op194: BACKBMP無し
				-- op195: BACKBMPあり
				table.insert(parts.destination,	{
					id = "-101", op = {80, 195, op[j]}, filter = 1, stretch = 1, dst = {
						{x = 378, y = 400, w = 1164, h = 500, a = alpha3[j]}
					}
				})
					
				-- エンブレム
				table.insert(parts.destination,	{
					id = "emblem", op = {80, op[j]}, dst = {
						{x = 462, y = 914, w = 996, h = 74, a = alpha2[j]}
					}
				})
				-- ジャンル
				table.insert(parts.destination,	{
					id = "pregenre", filter = 1, op = {80, op[j]}, dst = {
						{x = centerPosX, y = 790, w = 1200, h = 40, a = alpha2[j], r = RGB[1], g = RGB[2], b = RGB[3]}
					}
				})
				-- タイトル
				table.insert(parts.destination,	{
					id = "pretitle", filter = 1, op = {80, op[j]}, dst = {
						{x = centerPosX, y = 600, w = 1200, h = 90, a = alpha2[j], r = RGB[1], g = RGB[2], b = RGB[3]}
					}
				})
				-- アーティスト
				table.insert(parts.destination,	{
					id = "preartist", filter = 1, op = {80, op[j]}, dst = {
						{x = centerPosX, y = 430, w = 1200, h = 40, a = alpha2[j], r = RGB[1], g = RGB[2], b = RGB[3]}
					}
				})
			end
		end
	end

	-- オート中、リプレイ中のみ倍速可能のお知らせ
	if isAutoplayInfoOn() then
		local posx = {17, 1586}
		for i = 1, 2, 1 do
		table.insert(parts.destination,	{
			id = "preautoinfo", op = {33, 81}, dst = {
				{time = 0, x = posx[i], y = 773, w = 318, h = 165},
				{time = 1000, a = 150},
				{time = 2000, a = 255}
			}
		})
		table.insert(parts.destination,	{
			id = "preautoinfo", op = {84, 81}, dst = {
				{time = 0, x = posx[i], y = 773, w = 318, h = 165},
				{time = 1000, a = 150},
				{time = 2000, a = 255}
			}
		})
		end
	end

	-- practiceモード時は中央に設定画面を表示
	-- op1080: OPTION_STATE_PRACTICE
	-- op80: OPTION_NOW_LOADING
	table.insert(parts.destination, {
		id = "bga", op = {1080}, dst = {
			{x = laneLeftPosX, y = notesPositionY + 3, w = 513, h = 850},
		}
	})

	return parts
end

return {
	load = load
}