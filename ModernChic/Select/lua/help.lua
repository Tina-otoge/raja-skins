--[[
	ヘルプ画面
]]

local function load()
	local parts = {}

	local isMenuOpen = false
	local function menuSwitch()
		isMenuOpen = not isMenuOpen
	end
	
	parts.image = {}

	table.insert(parts.image, {
		id = "helpBtn", src = 5, x = 1570, y = 2230, w = 168, h = 20, act = function()
			return menuSwitch()
		end
	})

	table.insert(parts.image, {
		id = "helpScene", src = 10, x = 0, y = 0, w = 1920, h = 1080, act = function()
			return menuSwitch()
		end
	})

	-- カスタムタイマー
	local menuOpen = get_customTimer_id()
	local menuClose = get_customTimer_id()
	parts.customTimers = {
		{id = menuOpen, timer = timer_util.timer_observe_boolean(function()
			return isMenuOpen
		end)},
		{id = menuClose, timer = timer_util.timer_observe_boolean(function()
			if isMenuOpen == true then
				return false
			elseif isMenuOpen == false then
				return true
			end
		end)},
	}
	
	parts.destination = {}

	-- op21: オプション
	-- op22: アシストオプション
	-- op23: サブオプション
	table.insert(parts.destination, {
		id = "helpBtn", dst = {
			{x = 10, y = 1050, w = 168, h = 20},
		}
	})

	table.insert(parts.destination, {
		id = "helpScene", loop = 200, timer = menuOpen, dst = {
			{time = 0, x = 0, y = 0, w = 1920, h = 1080, a = 0},
			{time = 200, a = 255}
		}
	})
	table.insert(parts.destination, {
		id = "helpScene", loop = -1, timer = menuClose, dst = {
			{time = 0, x = 0, y = 0, w = 1920, h = 1080},
			{time = 200, a = 0}
		}
	})

	return parts
end

return {
	load = load
}