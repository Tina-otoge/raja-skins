--[[
	曲リストを作成
--]]
local function is_songlist_straight()
	return  skin_config.option["曲リストの並び"] == 920
end
local function is_songlist_arch()
	return  skin_config.option["曲リストの並び"] == 921
end
local function is_songlist_diagonally()
	return  skin_config.option["曲リストの並び"] == 922
end

local function load()
	local parts = {}
	
	do
		local cycle = 50
		parts.image = {
			-- 選曲バー
			{id = "bar-song", src = 7, x = 0, y = 0, w = 960, h = 70},
			{id = "bar-command", src = 7, x = 0, y = 70, w = 960, h = 70},
			{id = "bar-grade", src = 7, x = 0, y = 140, w = 960, h = 70},
			{id = "bar-nosong", src = 7, x = 0, y = 420, w = 960, h = 70},
			{id = "bar-table", src = 7, x = 0, y = 210, w = 960, h = 70},
			{id = "bar-folder", src = 7, x = 0, y = 280, w = 960, h = 70},
			{id = "bar-search", src = 7, x = 0, y = 350, w = 960, h = 70},
			{id = "lamp-noplay", src = 7, x = 123, y = 660, w = 41, h = 84},
			{id = "lamp-failed", src = 7, x = 41, y = 660, w = 82, h = 84, divx = 2, cycle = cycle},
			{id = "lamp-assist", src = 7, x = 0, y = 1232, w = 41, h = 84},
			{id = "lamp-laassist", src = 7, x = 0, y = 1247, w = 41, h = 84},
			{id = "lamp-easy", src = 7, x = 0, y = 744, w = 41, h = 84},
			{id = "lamp-normal", src = 7, x = 0, y = 828, w = 41, h = 84},
			{id = "lamp-hard", src = 7, x = 0, y = 912, w = 41, h = 84},
			{id = "lamp-exhard", src = 7, x = 0, y = 996, w = 82, h = 84, divx = 2, cycle = cycle},
			{id = "lamp-fullcombo", src = 7, x = 0, y = 1080, w = 123, h = 84, divx = 3, cycle = cycle},
			{id = "lamp-perfect", src = 7, x = 0, y = 1164, w = 123, h = 84, divx = 3, cycle = cycle},
			{id = "lamp-max", src = 7, x = 0, y = 1164, w = 123, h = 84, divx = 3, cycle = cycle},
			{id = "label-ln", src = 7, x = 0, y = 499, w = 85, h = 54},
			{id = "label-cn", src = 7, x = 85, y = 499, w = 85, h = 54},
			{id = "label-hcn", src = 7, x = 170, y = 499, w = 85, h = 54},
			{id = "label-bomb", src = 7, x = 255, y = 499, w = 54, h = 54},
			{id = "label-random", src = 7, x = 309, y = 499, w = 54, h = 54},
			{id = "trophy-bronze", src = 7, x = 363, y = 499, w = 54, h = 54},
			{id = "trophy-silver", src = 7, x = 417, y = 499, w = 54, h = 54},
			{id = "trophy-gold", src = 7, x = 471, y = 499, w = 54, h = 54},
		}
	end
	
	parts.imageset = {
		{id = "bar", images = {"bar-song", "bar-folder", "bar-table", "bar-grade", "bar-nosong", "bar-command", "bar-search"}},
	}
	
	parts.value = {
		-- 選曲レベル
		{id = "level-beginner", src = 7, x = 400, y = 702, w = 420, h = 42, divx = 10, digit = 2, align = 2, ref = 96},
		{id = "level-normal", src = 7, x = 400, y = 744, w = 420, h = 42, divx = 10, digit = 2, align = 2, ref = 96},
		{id = "level-hyper", src = 7, x = 400, y = 786, w = 420, h = 42, divx = 10, digit = 2, align = 2, ref = 96},
		{id = "level-another", src = 7, x = 400, y = 828, w = 420, h = 42, divx = 10, digit = 2, align = 2, ref = 96},
		{id = "level-insane", src = 7, x = 400, y = 870, w = 420, h = 42, divx = 10, digit = 2, align = 2, ref = 96},
		{id = "level-unknown", src = 7, x = 400, y = 912, w = 420, h = 42, divx = 10, digit = 2, align = 2,ref = 96},
	}
	
	-- リスト表示位置
	parts.listoff = {}
	parts.liston = {}
	do
		local songlist_num = 17
		local songlist_x = {}
		local songlist_loop = {1650, 1600, 1550, 1500, 1450, 1400, 1350, 1300, 1250, 1300, 1350, 1400, 1450, 1500, 1550, 1600, 1650}
		local songlist_start = {1400, 1350, 1300, 1250, 1200, 1150, 1100, 1050, 1000, 1050, 1100, 1150, 1200, 1250, 1300, 1350, 1400}
		-- 各パターンのx座標を指定
		if is_songlist_straight() then
			songlist_x = {1160, 1160, 1160, 1160, 1160, 1160, 1160, 1160, 1125, 1160, 1160, 1160, 1160, 1160, 1160, 1160, 1160}
		elseif  is_songlist_arch() then
			songlist_x = {1288, 1249, 1215, 1186, 1168, 1151, 1139, 1128, 1125, 1128, 1139, 1151, 1168, 1186, 1215, 1249, 1288}
		elseif is_songlist_diagonally() then
			songlist_x = {1325, 1300, 1275, 1250, 1225, 1200, 1175, 1150, 1125, 1100, 1075, 1050, 1025, 1000, 975, 950, 925}
		end
		-- y座標の指定
		local songlist_y = {1065, 995, 925, 855, 785, 715, 645, 575, 505, 435, 365, 295, 225, 155, 85, 15, -55}
		-- バーの表示位置決定
		for i = 1, songlist_num, 1 do
			table.insert(parts.liston, {id = "bar", dst = {{x = 1125, y = songlist_y[i], w = 960, h = 70}}})
			table.insert(parts.listoff, {id = "bar", loop = songlist_loop[i], dst = {
				{time = songlist_start[i], x = 1920, y = songlist_y[i], w = 960, h = 70, acc = 2},
				{time = songlist_loop[i], x = songlist_x[i]}
			}
		})
		end
	end
	
	-- 難易度ごとのレベル表記
	parts.level = {
		-- 不明
		{id = "level-unknown", dst = {
			{x = 30, y = 13, w = 35, h = 42}
		}},
		-- beginner譜面
		{id = "level-beginner", dst = {
			{x = 30, y = 13, w = 35, h = 42}
		}},
		-- normal譜面
		{id = "level-normal", dst = {
			{x = 30, y = 13, w = 35, h = 42}
		}},
		-- hyper譜面
		{id = "level-hyper", dst = {
			{x = 30, y = 13, w = 35, h = 42}
		}},
		-- another譜面
		{id = "level-another", dst = {
			{x = 30, y = 13, w = 35, h = 42}
		}},
		-- insane譜面
		{id = "level-insane", dst = {
			{x = 30, y = 13, w = 35, h = 42}
		}},
	}
	-- 特殊なBMSの表示
	parts.label = {
		-- LNあり
		{id = "label-ln", dst = {
			{x = -90, y = 5, w = 85, h = 54}
		}},
		-- RANDOMノートあり
		{id = "label-random", dst = {
			{x = 680, y = 8, w = 54, h = 54}
		}},
		-- 地雷あり
		{id = "label-bomb", dst = {
			{x = 620, y = 8, w = 54, h = 54}
		}},
		-- CN強制
		{id = "label-cn", dst = {
			{x = -90, y = 5, w = 85, h = 54}
		}},
		-- HCN強制
		{id = "label-hcn", dst = {
			{x = -90, y = 5, w = 85, h = 54}
		}},
	}
	-- テキスト
	parts.text = {
			-- 通常
			{id = "bartext", dst = {
				{x = 130, y = 15, w = 500, h = 35}
			}},
			-- 新規
			{id = "bartext", dst = {
				{x = 130, y = 15, w = 500, h = 35, b = 0}
			}},
			-- SongBar（通常）
			{id = "bartext", dst = {
				{x = 130, y = 13, w = 500, h = 35}
			}},
			-- SongBar（新規）
			{id = "bartext", dst = {
				{x = 130, y = 13, w = 500, h = 35, b = 0}
			}},
			-- FolderBar（通常）
			{id = "bartext", dst = {
				{x = 50, y = 15, w = 500, h = 35}
			}},
			-- FolderBar（新規）
			{id = "bartext", dst = {
				{x = 50, y = 15, w = 500, h = 35, b = 0}
			}},
			-- TableBar or HashBar
			{id = "bartext", dst = {
				{x = 50, y = 15, w = 500, h = 35}
			}},
			-- GradeBar（曲所持）
			{id = "bartext", dst = {
				{x = 130, y = 15, w = 500, h = 35}
			}},
			-- SongBar or GradeBar（曲未所持）
			{id = "bartext", dst = {
				{x = 130, y = 15, w = 500, h = 35, r = 200, g = 200, b = 200}
			}},
			-- CommandBar or ContainerBar
			{id = "bartext", dst = {
				{x = 50, y = 15, w = 500, h = 35}
			}},
			-- SearchWordBar
			{id = "bartext", dst = {
				{x = 50, y = 15, w = 500, h = 35}
			}},
	}
	-- ランプ状況
	parts.lamp = {
		{id = "lamp-noplay", dst = {
			{x = -8, y = -7, w = 41, h = 84}
		}},
		{id = "lamp-failed", dst = {
			{time = 0, x = -8, y = -7, w = 41, h = 84},
			{time = 1000, a = 200},
			{time = 2000, a = 255},
		}},
		{id = "lamp-assist", dst = {
			{time = 0, x = -8, y = -7, w = 41, h = 84},
			{time = 1000, a = 200},
			{time = 2000, a = 255},
		}},
		{id = "lamp-laassist", dst = {
			{time = 0, x = -8, y = -7, w = 41, h = 84},
			{time = 1000, a = 200},
			{time = 2000, a = 255},
		}},
		{id = "lamp-easy", dst = {
			{time = 0, x = -8, y = -7, w = 41, h = 84},
			{time = 1000, a = 200},
			{time = 2000, a = 255},
		}},
		{id = "lamp-normal", dst = {
			{time = 0, x = -8, y = -7, w = 41, h = 84},
			{time = 1000, a = 200},
			{time = 2000, a = 255},
		}},
		{id = "lamp-hard", dst = {
			{time = 0, x = -8, y = -7, w = 41, h = 84},
			{time = 1000, a = 200},
			{time = 2000, a = 255},
		}},
		{id = "lamp-exhard", dst = {
			{time = 0, x = -8, y = -7, w = 41, h = 84},
			{time = 1000, a = 200},
			{time = 2000, a = 255},
		}},
		{id = "lamp-fullcombo", dst = {
			{time = 0, x = -8, y = -7, w = 41, h = 84},
			{time = 1000, a = 200},
			{time = 2000, a = 255},
		}},
		{id = "lamp-perfect", dst = {
			{time = 0, x = -8, y = -7, w = 41, h = 84},
			{time = 1000, a = 200},
			{time = 2000, a = 255},
		}},
		{id = "lamp-max", dst = {
			{time = 0, x = -8, y = -7, w = 41, h = 84},
			{time = 1000, a = 200},
			{time = 2000, a = 255},
		}},
	}
	-- マイランプ（ライバル選択時）
	parts.playerlamp = {
		{id = "lamp-noplay", dst = {
			{x = -8, y = 30, w = 41, h = 42}
		}},
		{id = "lamp-failed", dst = {
			{time = 0, x = -8, y = 30, w = 41, h = 42},
			{time = 1000, a = 200},
			{time = 2000, a = 255},
		}},
		{id = "lamp-assist", dst = {
			{time = 0, x = -8, y = 30, w = 41, h = 42},
			{time = 1000, a = 200},
			{time = 2000, a = 255},
		}},
		{id = "lamp-laassist", dst = {
			{time = 0, x = -8, y = 30, w = 41, h = 42},
			{time = 1000, a = 200},
			{time = 2000, a = 255},
		}},
		{id = "lamp-easy", dst = {
			{time = 0, x = -8, y = 30, w = 41, h = 42},
			{time = 1000, a = 200},
			{time = 2000, a = 255},
		}},
		{id = "lamp-normal", dst = {
			{time = 0, x = -8, y = 30, w = 41, h = 42},
			{time = 1000, a = 200},
			{time = 2000, a = 255},
		}},
		{id = "lamp-hard", dst = {
			{time = 0, x = -8, y = 30, w = 41, h = 42},
			{time = 1000, a = 200},
			{time = 2000, a = 255},
		}},
		{id = "lamp-exhard", dst = {
			{time = 0, x = -8, y = 30, w = 41, h = 42},
			{time = 1000, a = 200},
			{time = 2000, a = 255},
		}},
		{id = "lamp-fullcombo", dst = {
			{time = 0, x = -8, y = 30, w = 41, h = 42},
			{time = 1000, a = 200},
			{time = 2000, a = 255},
		}},
		{id = "lamp-perfect", dst = {
			{time = 0, x = -8, y = 30, w = 41, h = 42},
			{time = 1000, a = 200},
			{time = 2000, a = 255},
		}},
		{id = "lamp-max", dst = {
			{time = 0, x = -8, y = 30, w = 41, h = 42},
			{time = 1000, a = 200},
			{time = 2000, a = 255},
		}},
	}
	-- ライバルランプ（ライバル選択時）
	parts.rivallamp = {
		{id = "lamp-noplay", dst = {
			{x = -8, y = -3, w = 41, h = 42}
		}},
		{id = "lamp-failed", dst = {
			{time = 0, x = -8, y = -3, w = 41, h = 42},
			{time = 1000, a = 200},
			{time = 2000, a = 255},
		}},
		{id = "lamp-assist", dst = {
			{time = 0, x = -8, y = -3, w = 41, h = 42},
			{time = 1000, a = 200},
			{time = 2000, a = 255},
		}},
		{id = "lamp-laassist", dst = {
			{time = 0, x = -8, y = -3, w = 41, h = 42},
			{time = 1000, a = 200},
			{time = 2000, a = 255},
		}},
		{id = "lamp-easy", dst = {
			{time = 0, x = -8, y = -3, w = 41, h = 42},
			{time = 1000, a = 200},
			{time = 2000, a = 255},
		}},
		{id = "lamp-normal", dst = {
			{time = 0, x = -8, y = -3, w = 41, h = 42},
			{time = 1000, a = 200},
			{time = 2000, a = 255},
		}},
		{id = "lamp-hard", dst = {
			{time = 0, x = -8, y = -3, w = 41, h = 42},
			{time = 1000, a = 200},
			{time = 2000, a = 255},
		}},
		{id = "lamp-exhard", dst = {
			{time = 0, x = -8, y = -3, w = 41, h = 42},
			{time = 1000, a = 200},
			{time = 2000, a = 255},
		}},
		{id = "lamp-fullcombo", dst = {
			{time = 0, x = -8, y = -3, w = 41, h = 42},
			{time = 1000, a = 200},
			{time = 2000, a = 255},
		}},
		{id = "lamp-perfect", dst = {
			{time = 0, x = -8, y = -3, w = 41, h = 42},
			{time = 1000, a = 200},
			{time = 2000, a = 255},
		}},
		{id = "lamp-max", dst = {
			{time = 0, x = -8, y = -3, w = 41, h = 42},
			{time = 1000, a = 200},
			{time = 2000, a = 255},
		}},
	}
	-- トロフィー機能
	parts.trophy = {
		{id = "trophy-bronze", dst = {
			{x = 37, y = 8, w = 54, h = 54}
		}},
		{id = "trophy-silver", dst = {
			{x = 37, y = 8, w = 54, h = 54}
		}},
		{id = "trophy-gold", dst = {
			{x = 37, y = 8, w = 54, h = 54}
		}},
	}
	
	-- 進捗グラフ
	--[[
	parts.gra = {
		id = "graph-lamp", dst = {
			{x = 40, y = 5, w = 650, h = 10}
		},
	}
	--]]
	
	parts.destination = {
		-- リスト表示
		{id = "songlist"},
		-- 選択曲フレーム
		{id = "selectmusic-frame", dst = {
			{x = 1112, y = 499, w = 990, h = 82}
		}},
		{id = "selectmusic-frame-top", loop = 1000, blend = 2, dst = {
			{time = 1000, x = 1112, y = 499, w = 17, h = 82, a = 0},
			{time = 1200, a = 255},
			{time = 2000},
			{time = 3000, a = 0},
			{time = 4000}
		}},
		{id = "selectmusic-frame-bottom", loop = 1000, blend = 2, dst = {
			{time = 1000, x = 1129, y = 499, w = 0, h = 82, a = 0},
			{time = 1200, w = 200, a = 255},
			{time = 2000, w = 973},
			{time = 3000, a = 0},
			{time = 4000}
		}},
	}
	
	return parts
end

return {
	load = load
}