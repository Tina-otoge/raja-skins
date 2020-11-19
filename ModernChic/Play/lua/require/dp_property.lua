--[[
	DP用（10鍵、14鍵）用プロパティ900-999
	全体に影響が出るので変更には注意
]]
local property = {
	--カスタムオプション定義
	{name = "カスタムオプション-------------------------", item = {
		{name = "詳しくは同梱のreadme.txtをご覧ください", op = 998}
	}},
	{name = "ターゲット差分表示", def = "なし", item = {
		{name = "なし", op = 900},
		{name = "あり", op = 901},
	}},
	{name = "ターゲット差分の種類", def = "目標ランク", item = {
		{name = "目標ランク", op = 903},
		{name = "自己ベスト", op = 904},
	}},
	{name = "ターゲット差分表示位置", def = "TYPEA(判定文字上)", item = {
		{name = "TYPEA(判定文字上)", op = 906},
		{name = "TYPEB（判定文字横・外側）", op = 907},
		{name = "TYPEC（判定文字横・内側）", op = 908},
	}},
	{name = "判定タイミング表示", def = "なし", item = {
		{name = "なし", op = 910},
		{name = "あり", op = 911},
	}},
	{name = "判定タイミングの種類", def = "FAST/SLOW", item = {
		{name = "FAST/SLOW", op = 913},
		{name = "+-ms", op = 914},
	}},
	{name = "判定タイミング表示位置", def = "TYPEA(判定文字上)", item = {
		{name = "TYPEA(判定文字上)", op = 915},
		{name = "TYPEB（判定文字横・外側）", op = 916},
		{name = "TYPEC（判定文字横・内側）", op = 917},
	}},
	{name = "判定タイミングボムの使用", def = "使わない", item = {
		{name = "使わない", op = 920},
		{name = "使う（早いか遅いかでボムの色が変化します）", op = 921},
	}},
	{name = "ボムの種類", def = "ModernChic規格", item = {
		{name = "ModernChic規格", op = 923},
		{name = "OADX規格", op = 924},
	}},
	{name = "グラフバー表示位置", def = "左", item = {
		{name = "左", op = 930},
		{name = "右", op = 931},
		{name = "表示しない", op = 932},
	}},
	{name = "パーツ表示有無-------------------------", item = {
		{name = "詳しくは同梱のreadme.txtをご覧ください", op = 998}
	}},
	{name = "グローランプ表示", def = "あり", item = {
		{name = "なし", op = 938},
		{name = "あり", op = 939},
	}},
	{name = "ゲージMAXインジケータ表示", def = "あり", item = {
		{name = "なし", op = 940},
		{name = "あり", op = 941},
	}},
	{name = "ゲージ隠し", def = "なし", item = {
		{name = "なし", op = 943},
		{name = "あり", op = 944},
	}},
	{name = "ノート分布隠し", def = "なし", item = {
		{name = "なし", op = 946},
		{name = "あり", op = 947},
	}},
	{name = "タイミンググラフ隠し", def = "なし", item = {
		{name = "なし", op = 950},
		{name = "あり", op = 951},
	}},
	{name = "オートプレイ＆リプレイ時の案内", def = "表示する", item = {
		{name = "表示しない", op = 953},
		{name = "表示する", op = 954},
	}},
	{name = "10鍵用レーンカバー（10鍵モード時のみ）", def = "あり", item = {
		{name = "なし", op = 995},
		{name = "あり", op = 996},
	}},
	{name = "パーツ詳細設定-------------------------", item = {
		{name = "詳しくは同梱のreadme.txtをご覧ください", op = 998}
	}},
	{name = "キービームの高さ", def = "50%（短い）", item = {
		{name = "100%", op = 960},
		{name = "90%", op = 961},
		{name = "80%", op = 962},
		{name = "70%", op = 963},
		{name = "60%", op = 964},
		{name = "50%（短い）", op = 965},
		{name = "40%", op = 966},
		{name = "30%（とても短い）", op = 967},
		{name = "20%", op = 968},
		{name = "10%", op = 969},
	}},
	{name = "キービームの消失時間", def = "通常", item = {
		{name = "通常", op = 970},
		{name = "短い", op = 971},
		{name = "長い", op = 972},
	}},
	{name = "キービームの消失パターン", def = "TYPE-B", item = {
		{name = "TYPE-L", op = 975},
		{name = "TYPE-B", op = 976},
	}},
	{name = "グルーヴゲージの向き", def = "右方向", item = {
		{name = "右方向", op = 978},
		{name = "左方向", op = 979},
	}},
	{name = "BGA表示パターン", def = "1:1", item = {
		{name = "1:1", op = 980},
		{name = "16:9", op = 981},
		{name = "表示しない", op = 982},
	}},
	{name = "左右のレーンカバーを同期する", def = "左と同期", item = {
		{name = "左と同期", op = 985},
		{name = "同期しない", op = 986},
	}},
	--[[
	{name = "左右のリフトカバーを同期する", def = "左と同期", item = {
		{name = "左と同期", op = 988},
		{name = "同期しない", op = 989},
	}},
	]]
}

return property