--[[
	ボリュームコントロール機能
	引数source_idはskin.sourceのID
--]]

local function load()
	local parts = {}
	local window_posx = 42
	local window_posy = 235
	
	parts.image = {
		{id = "volume-frame", src = 5,  x = 2410,  y = 970,  w = 760,  h = 160}
	}

	parts.value = {
		-- メイン音量数値
		{id = "masterVolumeNum", src = 5, x = 2401, y = 510, w = 242, h = 15, divx = 11, digit = 3, value = function()
				return main_state.volume_sys() * 100
			end,
		},
		-- キー音量数値
		{id = "keyVolumeNum", src = 5, x = 2401, y = 510, w = 242, h = 15, divx = 11, digit = 3, value = function()
				return main_state.volume_key() * 100
			end,
		},
		-- キー音量数値
		{id = "bgmVolumeNum", src = 5, x = 2401, y = 510, w = 242, h = 15, divx = 11, digit = 3, value = function()
				return main_state.volume_bg() * 100
			end,
		},
	}
	
	parts.slider = {
		{id = "master-volume",  src  = 5,  x  = 2610,  y  = 800,  w  = 15,  h  = 39,  type  = 17,  range  = 385,  angle  = 1,  changeable  = true},
		{id = "key-volume",  src  = 5,  x  = 2610,  y  = 800,  w  = 15,  h  = 39,  type  = 18,  range  = 385,  angle  = 1,  changeable  = true},
		{id = "bgm-volume",  src  = 5,  x  = 2610,  y  = 800,  w  = 15,  h  = 39,  type  = 19,  range  = 385,  angle  = 1,  changeable  = true}
	}
	
	-- op2 OPTION_SONGBAR
	-- op625 : OPTION_COMPARE_RIVAL
	parts.destination = {
		{id = "volume-frame", op = {-625, -2}, dst = {
			{x = window_posx, y = window_posy, w = 760, h = 160},
		}},
		{id = "master-volume", op = {-625, -2}, dst = {
			{x = window_posx + 264, y = window_posy + 112, w = 15, h = 39},
		}},
		{id = "key-volume", op = {-625, -2}, dst = {
			{x = window_posx + 264, y = window_posy + 64, w = 15, h = 39},
		}},
		{id = "bgm-volume", op = {-625, -2}, dst = {
			{x = window_posx + 264, y = window_posy + 16, w = 15, h = 39},
		}},
		-- 音量
		{id = "masterVolumeNum", op = {-625, -2}, dst = {
			{x = window_posx + 675, y = window_posy + 125, w = 22, h = 15},
		}},
		{id = "keyVolumeNum", op = {-625, -2}, dst = {
			{x = window_posx + 675, y = window_posy + 76, w = 22, h = 15},
		}},
		{id = "bgmVolumeNum", op = {-625, -2}, dst = {
			{x = window_posx + 675, y = window_posy + 27, w = 22, h = 15},
		}},
	}
	
	return parts
end

return {
	load = load
}