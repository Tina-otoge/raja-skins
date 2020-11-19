local main_state = require("main_state")

local header = {
	type = 6,
	name = "ModernChicDecide-1.2(Lua)",
	w = 1920,
	h = 1080,
	fadeout = 1000,	-- フェードアウト時間（メインシーン後）
	scene = 3000,	-- メインシーン時間
	input = 500,	-- スキップ可能時間
	property = {
		--カスタムオプション定義
		{name = "カスタムオプション---------------", item = {
			{name = "詳しくは同梱のreadme.txtをご覧ください", op = 998}
		}},
		{name = "背景の種類（beatoraja0.7.5以下は『静止画』を選択してください）", def = "静止画", item = {
			{name = "静止画", op = 900},
			{name = "動画", op = 901},
		}},
		{name = "画像フォントの使用（beatoraja0.7.5以下は『使用しない』を選択してください）", def = "使用しない", item = {
			{name = "使用しない", op = 910},
			{name = "使用する", op = 911},
		}},
		{name = "ステージファイル", def = "表示する", item = {
			{name = "表示する", op = 915},
			{name = "表示しない", op = 916},
		}},
	},
	filepath = {
		{name = "背景選択---------------", path = "parts/dummy/-"},
		{name = "背景（静止画）bg/image/*.png", path = "bg/image/*.png", def = "sample"},
		{name = "背景（動画）bg/movie/*.mp4", path = "bg/movie/*.mp4", def = "sample"},
	},
}
local function isBgImage()
	return skin_config.option["背景の種類（beatoraja0.7.5以下は『静止画』を選択してください）"] == 900
end
local function isBgMovie()
	return skin_config.option["背景の種類（beatoraja0.7.5以下は『静止画』を選択してください）"] == 901
end
local function isOutlineFont()
	return skin_config.option["画像フォントの使用（beatoraja0.7.5以下は『使用しない』を選択してください）"] == 910
end
local function isBitmapFont()
	return skin_config.option["画像フォントの使用（beatoraja0.7.5以下は『使用しない』を選択してください）"] == 911
end

local function add_all(list, t)
	if t then
		for i, v in ipairs(t) do
			table.insert(list, v) 
		end
	end
end

local function rand(min, max)
	return math.random(min, max)
end

local function diffOutlineColor()
	if main_state.option(151) then
		return "165423ff"
	elseif main_state.option(152) then
		return "105e60ff"
	elseif main_state.option(153) then
		return "644f0fff"
	elseif main_state.option(154) then
		return "521313ff"
	elseif main_state.option(155) then
		return "401340ff"
	elseif main_state.option(150) then
		return "444444ff"
	end
end

local function diffRGB()
	if main_state.option(151) then
		return {6, 255, 0}
	elseif main_state.option(152) then
		return {18, 210, 215}
	elseif main_state.option(153) then
		return {255, 192, 0}
	elseif main_state.option(154) then
		return {255, 0, 0}
	elseif main_state.option(155) then
		return {148, 44, 150}
	elseif main_state.option(150) then
		return {195, 195, 195}
	end
end

local function main()
	-- ヘッダ情報のコピー
	local skin = {}
	for k, v in pairs(header) do
		skin[k] = v
	end
	
	skin.source =  {
		{id = 1, path = "bg/image/*.png"},
		{id = 2, path = "bg/movie/*.mp4"},
		{id = 3, path = "parts/parts.png"},
		{id = 4, path = "parts/parts2.png"},
	}
	
	-- フォント
	do
		local mainShadowOffset = 4
		local subShadowOffset = 2
		local color = diffOutlineColor()
		if isOutlineFont() then
			-- アウトラインフォント
			skin.font =  {
				{id = 0, path = "font/ttf/GenShinGothic-Heavy.ttf"},
				{id = 1, path = "font/ttf/GenShinGothic-Medium.ttf"},
			}
			skin.text = {
				{id = "tablename&tablelevel", font = 0, size = 35, ref = 1003, overflow = 1, align = 1, shadowOffsetX = subShadowOffset, shadowOffsetY = subShadowOffset},
				{id = "genre", font = 1, size = 40, ref = 13, overflow = 1,  align = 1, shadowOffsetX = subShadowOffset, shadowOffsetY = subShadowOffset},
				{id = "title", font = 0, size = 90, ref = 12, overflow = 1, align = 1, shadowOffsetX = mainShadowOffset, shadowOffsetY = mainShadowOffset},
				{id = "artist", font = 1, size = 40, ref = 14, overflow = 1, align = 1, shadowOffsetX = subShadowOffset, shadowOffsetY = subShadowOffset},
			}
		elseif isBitmapFont() then
			-- ビットマップフォント（ちと重い）
			skin.font =  {
				{id = 2, path = "font/fnt/title.fnt", type = 1},
				{id = 3, path = "font/fnt/subtitle.fnt", type = 1},
			}
			skin.text = {
				{id = "tablename&tablelevel", font = 2, size = 35, ref = 1003, overflow = 1, outlineColor = color, outlineWidth = 1, align = 1},
				{id = "genre", font = 3, size = 40, ref = 13, overflow = 1, outlineColor = color, outlineWidth = 1, align = 1},
				{id = "title", font = 2, size = 90, ref = 12, overflow = 1, outlineColor = color, outlineWidth = 1, align = 1},
				{id = "artist", font = 3, size = 40, ref = 14, overflow = 1, outlineColor = color, outlineWidth = 1, align = 1},
			}
		end
	end
	
	--背景選択
	local bg_type
	if isBgImage() then
		bg_type = 1
	else
		bg_type = 2
	end
	
	skin.image = {
		--背景
		{id = "bg", src = bg_type, x = 0, y = 0, w = 1920, h = 1080},
		{id = "beginner", src = 3, x = 0, y = 558, w = 240, h = 45},
		{id = "normal", src = 3, x = 0, y = 603, w = 240, h = 45},
		{id = "hyper", src = 3, x = 0, y = 648, w = 240, h = 45},
		{id = "another", src = 3, x = 0, y = 693, w = 240, h = 45},
		{id = "insane", src = 3, x = 0, y = 738, w = 240, h = 45},
		{id = "unknown", src = 3, x = 0, y = 783, w = 240, h = 45},
		{id = "getready", src = 4, x = 0, y = 0, w = 730, h = 50},
		{id = "lockon-lu", src = 4, x = 0, y = 50, w = 50, h = 50},
		{id = "lockon-ru", src = 4, x = 60, y = 50, w = 50, h = 50},
		{id = "lockon-ld", src = 4, x = 120, y = 50, w = 50, h = 50},
		{id = "lockon-rd", src = 4, x = 180, y = 50, w = 50, h = 50},
	}
	skin.value = {
		--選曲レベル
		{id = "levelBeginner", src = 3, x = 0, y = 0, w = 710, h = 93, divx = 10, digit = 2, align = 2, ref = 96},
		{id = "levelNormal", src = 3, x = 0, y = 93, w = 710, h = 93, divx = 10, digit = 2, align = 2, ref = 96},
		{id = "levelHyper", src = 3, x = 0, y = 186, w = 710, h = 93, divx = 10, digit = 2, align = 2, ref = 96},
		{id = "levelAnother", src = 3, x = 0, y = 279, w = 710, h = 93, divx = 10, digit = 2, align = 2, ref = 96},
		{id = "levelInsane", src = 3, x = 0, y = 372, w = 710, h = 93, divx = 10, digit = 2, align = 2, ref = 96},
		{id = "levelUnknown", src = 3, x = 0, y = 465, w = 710, h = 93, divx = 10, digit = 2, align = 2,ref = 96},
	}
	
	local tablenamePosX = 960
	local tablenamePosY = 900
	local genrePosX = 960
	local genrePosY = 610
	local titlePosX = 960
	local titlePosY = 490
	local artistPosX = 960
	local artistPosY = 420
	local categoryPosX = 840
	local categoryPosY = 710
	local levelPosX = 890
	local levelPosY = 300
	
	skin.destination = {}
	-- 背景配置
	table.insert(skin.destination,{
		id = "bg", dst = {
			{x = 0, y = 0, w = 1920, h = 1080}
		}
	})
	-- ステージファイル
	table.insert(skin.destination,	{
		id = "-100", op = {915},  loop = 500, dst = {
			{time = 0, x = 910, y = 490, w = 1, h = 1},
			{time = 500, x = 640, y = 300, w = 640, h = 480},
		}
	})
	-- 表示用背景
	table.insert(skin.destination,	{
		id = "-110", loop = 500, dst = {
			{time = 0, x = 960, y = 585, w = 1, h = 1, a = 150},
			{time = 500, x = 0, y = 240, w = 1920, h = 600}
		}
	})
	do
		local num1 = rand(0, 255)
		local num2 = rand(0, 255)
		local num3 = rand(0, 255)
		-- アニメーション
		table.insert(skin.destination,	{
			id = "lockon-lu", loop = 1000, dst = {
				{time = 0, x = 0, y = 1080, w = 50, h = 50, acc = 2},
				{time = 1000, x = 627, y = 743, r = num1, g = num2, b = num3},
			}
		})
		table.insert(skin.destination,	{
			id = "lockon-ru", loop = 1000, dst = {
				{time = 0, x = 1920, y = 1080, w = 50, h = 50, acc = 2},
				{time = 1000, x = 1243, y = 743, r = num1, g = num2, b = num3},
			}
		})
		table.insert(skin.destination,	{
			id = "lockon-ld", loop = 1000, dst = {
				{time = 0, x = 0, y = 0, w = 50, h = 50, acc = 2},
				{time = 1000, x = 627, y = 288, r = num1, g = num2, b = num3},
			}
		})
		table.insert(skin.destination,	{
			id = "lockon-rd", loop = 1000, dst = {
				{time = 0, x = 1920, y = 0, w = 50, h = 50, acc = 2},
				{time = 1000, x = 1243, y = 288, r = num1, g = num2, b = num3},
			}
		})
	end
		
	do
		local option = {151, 152, 153, 154, 155, 150}
		local cat = {"beginner", "normal", "hyper", "another", "insane", "unknown"}
		local lev = {"levelBeginner", "levelNormal", "levelHyper", "levelAnother", "levelInsane", "levelUnknown"}
		local RGB = diffRGB()
		for i = 1, 6, 1 do
			-- テーブル名
			table.insert(skin.destination, {
				id = "tablename&tablelevel", op = {option[i]}, dst = {
					{x = tablenamePosX, y = tablenamePosY, w = 1720, h = 35, r = RGB[1], g = RGB[2], b = RGB[3]}
				}
			})
			-- ジャンル名
			table.insert(skin.destination, {
				id = "genre", op = {option[i]}, dst = {
					{x = genrePosX, y = genrePosY, w = 1720, h = 40, r = RGB[1], g = RGB[2], b = RGB[3]}
				}
			})
			-- タイトル
			table.insert(skin.destination, {
				id = "title", op = {option[i]}, dst = {
					{x = titlePosX, y = titlePosY, w = 1720, h = 90, r = RGB[1], g = RGB[2], b = RGB[3]}
				}
			})
			-- アーティスト
			table.insert(skin.destination, {
				id = "artist", op = {option[i]}, dst = {
					{x = artistPosX, y = artistPosY, w = 1720, h = 40, r = RGB[1], g = RGB[2], b = RGB[3]}
				}
			})
			-- カテゴリ
			table.insert(skin.destination, {
				id = cat[i], op = {option[i]}, dst = {
					{x = categoryPosX, y = categoryPosY, w = 240, h = 45}
				}
			})
			-- レベル
			table.insert(skin.destination, {
				id = lev[i], op = {option[i]}, dst = {
					{x = levelPosX, y = levelPosY, w = 71, h = 93}
				}
			})
		end
	end
	
	-- 黒背景でフェードアウト
	table.insert(skin.destination, {
		id = "-110", loop = 1000, timer = 2, dst = {
			{time = 0, x = 0, y = 540, w = 1920, h = 0},
			{time = 500},
			{time = 1000, y = 0, h = 1080},
		}
	})
	table.insert(skin.destination, {
		id = "getready", loop = 1000, timer = 2, dst = {
			{time = 500, x = 598, y = 514, w = 730, h = 50},
			{time = 600, a = 0},
			{time = 700, a = 255},
			{time = 800, a = 0},
			{time = 850, a = 255},
			{time = 900, a = 0},
			{time = 950, a = 255},
		}
	})
	return skin
end

return{
	header = header,
	main = main
}