--[[
	曲読み込み時の動作
	
	timer:40 READY
	timer:143 最終ノートタイマー1P
	
	op:80 ロード未完了
	op:81 ロード完了
	op:190 STAGEFILE無し
	op:191 STAGEFILE有り
	op:194 BACKBMPなし
	op:195 BACKBMPあり
	
	playsidePositionX : レーン基準点
	infoPositionX : 情報基準点
	
	playstart = 1000(ms) timer40
	
--]]
local function load(playsidePositionX, infoPositionX)
	local parts = {}
	
	local loadingWindowPosX = playsidePositionX + 70
	local loadingWindowPosY = 420
	local plaseWaitX = playsidePositionX + 8 
	
	parts.image = {
		{id = "loadingwindow", src = 1, x = 1200, y = 410, w = 380, h = 311},
		{id = "loading_barframe", src = 1, x = 700, y = 950, w = 304, h = 30},
		{id = "loading_notesinfo", src = 1, x = 1500, y = 730, w = 184, h = 86},
		{id = "loading_wd1", src = 1, x = 1200, y = 950, w = 497, h = 46},
		{id = "loading_wd2", src = 1, x = 1200, y = 996, w = 497, h = 46},
		{id = "preautoinfo", src = 1, x = 0, y = 1050, w = 801, h = 108},
		{id = "emblem", src = 1, x = 0, y = 1260, w = 996, h = 74},
	}
	
	parts.value = {
		-- ロード状況％
		{id = "loading_par", src = 1, x = 1400, y = 101, w = 297, h = 20, divx = 11, divy = 1, digit = 3, ref = 165, align = 1},
		-- 総ノート数（鍵盤のみ）
		{id = "totalnote-normal", src = 1, x = 1400, y = 101, w = 297, h = 20, divx = 11, divy = 1, digit = 4, ref = 350},
		-- 総皿
		{id = "totalnote-scr", src = 1, x = 1400, y = 101, w = 297, h = 20, divx = 11, divy = 1, digit = 4, ref = 352},
		-- 総LN
		{id = "totalnote-ln", src = 1, x = 1400, y = 101, w = 297, h = 20, divx = 11, divy = 1, digit = 4, ref = 351},
		-- 総bss
		{id = "totalnote-bss", src = 1, x = 1400, y = 101, w = 297, h = 20, divx = 11, divy = 1, digit = 4, ref = 353},
	}
	
	parts.graph = {
		-- ロード状況
		{id = "loading_bar", src = 1, x = 700, y = 1000, w = 300, h = 26, angle = 2, type = 102},
	}
	
	parts.judgegraph = {
		{id = "notesgraph", type = 0},
	}
	
	parts.destination = {}
	
	-- BACKBMP(-101)がある場合は優先（タイトル、ジャンル、アーティストは消す）
	-- stretch:1 アスペクト比を保ちつつ描画先の範囲に収まるように伸縮する
	-- op194: BACKBMP無し
	-- op195: BACKBMPあり
	table.insert(parts.destination,	{
		id = "-101", loop = 750, op = {80, 195}, filter = 1, stretch = 1, dst = {
			{time = 500, x = infoPositionX + 36, y = 330, w = 1280, h = 560, a = 0},
			{time = 750, a = 255}
		}
	})
		
	-- エンブレム
	table.insert(parts.destination,	{
		id = "emblem", loop = 750, blend = 2, op = {80}, dst = {
			{time = 500, x = infoPositionX + 180, y = 913, w = 996, h = 74, a = 0},
			{time = 750, a = 255}
		}
	})
	-- ジャンル（ロード中）
	table.insert(parts.destination,	{
		id = "pregenre", loop = 750, filter = 1, op = {80, 194}, dst = {
			{time = 500, x = infoPositionX + 680, y = 790, w = 1200, h = 40, a = 0},
			{time = 750, a = 255}
		}
	})
	-- タイトル（ロード中）
	table.insert(parts.destination,	{
		id = "pretitle", loop = 750, filter = 1, op = {80, 194}, dst = {
			{time = 500, x = infoPositionX + 680, y = 600, w = 1200, h = 90, a = 0},
			{time = 750, a = 255}
		}
	})
	-- タイトル（ロード完了）
	table.insert(parts.destination,	{
		id = "pretitle", timer = 40, filter = 1, loop = -1, op = {81, 194}, dst = {
			{time = 0, x = infoPositionX + 680, y = 600, w = 1200, h = 90, a = 255},
			{time = 500, a = 0}
		}
	})
	-- アーティスト（ロード中）
	table.insert(parts.destination,	{
		id = "preartist", loop = 750, filter = 1, op = {80, 194}, dst = {
			{time = 500, x = infoPositionX + 680, y = 430, w = 1200, h = 40, a = 0},
			{time = 750, a = 255}
		}
	})
	-- オート中、リプレイ中のみ倍速可能のお知らせ
	table.insert(parts.destination,	{
		id = "preautoinfo", op = {33, 956, 81}, dst = {
			{time = 0, x = infoPositionX + 276, y = 890, w = 801, h = 108},
			{time = 1000, a = 150},
			{time = 2000, a = 255}
		}
	})
	table.insert(parts.destination,	{
		id = "preautoinfo", op = {84, 956, 81}, dst = {
			{time = 0, x = infoPositionX + 276, y = 890, w = 801, h = 108},
			{time = 1000, a = 150},
			{time = 2000, a = 255}
		}
	})
	
	-- songinfoframe
	-- op:270 スタートボタン押下
	do
		local op = {-270, 270}
		local alpha = {255, 80}
		for i = 1, 2, 1 do
			table.insert(parts.destination,	{
				id = "loadingwindow", op = {80, op[i]}, offset = 3, dst = {
					{x = loadingWindowPosX, y = loadingWindowPosY, w = 380, h = 311, a = alpha[i]}
				}
			})
			table.insert(parts.destination,	{
				id = "notesgraph", op = {80, op[i]}, offset = 3, dst = {
					{x = loadingWindowPosX + 38, y = loadingWindowPosY + 161, w = 304, h = 100, a = alpha[i]}
				}
			})
			table.insert(parts.destination,	{
				id = "bpmgraph", op = {80, op[i]}, offset = 3, dst = {
					{x = loadingWindowPosX + 38, y = loadingWindowPosY + 161, w = 304, h = 100, a = alpha[i]}
				}
			})
			table.insert(parts.destination,	{
				id = "loading_notesinfo", op = {80, op[i]}, offset = 3, dst = {
					{x = loadingWindowPosX + 48, y = loadingWindowPosY + 56, w = 184, h = 86, a = alpha[i]}
				}
			})
			table.insert(parts.destination,	{
				id = "totalnote-normal", op = {80, op[i]}, offset = 3, dst = {
					{x = loadingWindowPosX + 98, y = loadingWindowPosY + 114, w = 20, h = 20, a = alpha[i]}
				}
			})
			table.insert(parts.destination,	{
				id = "totalnote-ln", op = {80, op[i]}, offset = 3, dst = {
					{x = loadingWindowPosX + 242, y = loadingWindowPosY + 114, w = 20, h = 20, a = alpha[i]}
				}
			})
			table.insert(parts.destination,	{
				id = "totalnote-scr", op = {80, op[i]}, offset = 3, dst = {
					{x = loadingWindowPosX + 98, y = loadingWindowPosY + 65, w = 20, h = 20, a = alpha[i]}
				}
			})
			table.insert(parts.destination,	{
				id = "totalnote-bss", op = {80, op[i]}, offset = 3, dst = {
					{x = loadingWindowPosX + 242, y = loadingWindowPosY + 65, w = 20, h = 20, a = alpha[i]}
				}
			})
			table.insert(parts.destination,	{
				id = "loading_barframe", op = {80, op[i]}, offset = 3, dst = {
					{x = loadingWindowPosX + 38, y = loadingWindowPosY +12, w = 304, h = 30, a = alpha[i]}
				}
			})
			table.insert(parts.destination,	{
				id = "loading_bar", op = {80, op[i]}, offset = 3, dst = {
					{x = loadingWindowPosX + 40, y = loadingWindowPosY + 14, w = 300, h = 26, a = alpha[i]}
				}
			})
			table.insert(parts.destination,	{
				id = "loading_par", op = {80, op[i]}, offset = 3, dst = {
					{x = loadingWindowPosX + 130, y = loadingWindowPosY + 16, w = 27, h = 20, a = alpha[i]}
				}
			})
			table.insert(parts.destination,	{
				id = "per", offset = 3, op = {80, op[i]}, offset = 3, dst = {
					{x = loadingWindowPosX + 225, y = loadingWindowPosY + 16, w = 27, h = 18, a = alpha[i]}
				}
			})
		end
	end
	
	-- ロード完了時はフェードアウト
	table.insert(parts.destination,	{
		id = "loadingwindow", timer = 40, offset = 3, loop = -1, dst = {
			{time = 0, x = loadingWindowPosX, y = loadingWindowPosY, w = 380, h = 311},
			{time = 200, y = loadingWindowPosY - 10, a = 0}
		}
	})
		
	-- please wait
	table.insert(parts.destination,	{
		id = "loading_wd1", op = {80}, offset = 3, dst = {
			{time = 0, x = plaseWaitX, y = 320, w = 497, h = 46, acc = 1},
			{time = 1000, a = 120},
			{time = 2000, a = 255}
		}
	})
	-- good ruck
	table.insert(parts.destination,	{
		id = "loading_wd2", op = {81}, loop = 1000, timer = 40, offset = 3, dst = {
			{time = 0, x = plaseWaitX, y = 320, w = 497, h = 46, acc = 1},
			{time = 1000, y = 300, a = 0}
		}
	})
	
	return parts
end

return {
	load = load
}