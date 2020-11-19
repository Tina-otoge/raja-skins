--[[
	リザルト用プロパティ
	全体に影響が出るので変更には注意
]]
local property = {
	--カスタムオプション定義
	{name = "カスタムオプション-------------------------", item = {
		{name = "詳しくは同梱のreadme.txtをご覧ください", op = 998},
	}},
	{name = "背景表示パターン", def = "Clear or Failed", item = {
		{name = "Clear or Failed", op = 915},
		{name = "ALL", op = 916},
	}},
	{name = "グラフ&スコア表示位置", def = "左", item = {
		{name = "左", op = 905},
		{name = "右", op = 906},
	}},
	{name = "IRメニュー表示", def = "あり（オンライン時のみ表示されます）", item = {
		{name = "なし", op = 900},
		{name = "あり（オンライン時のみ表示されます）", op = 901},
	}},
	{name = "開始時アニメーション", def = "あり", item = {
		{name = "なし", op = 910},
		{name = "あり", op = 911},
	}},
	{name = "タイムスタンプ", def = "あり", item = {
		{name = "なし", op = 920},
		{name = "あり", op = 921},
	}},
	{name = "修飾", def = "あり", item = {
		{name = "なし", op = 925},
		{name = "あり", op = 926},
	}},
}

return property