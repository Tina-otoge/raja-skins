--[[
	SP用（5鍵、7鍵）用プロパティ
	全体に影響が出るので変更には注意
]]
local property = {
	--カスタムオプション定義
	{name = "カスタムオプション-------------------------", item = {
		{name = "詳しくは同梱のreadme.txtをご覧ください", op = 998}
	}},
	{name = "プレイサイド", def = "1P（左スクラッチ）", item = {
		{name = "1P（左スクラッチ）", op = 900},
		{name = "2P（右スクラッチ）", op = 901},
	}},
	{name = "プレイ位置", def = "1P（左側表示）", item = {
		{name = "1P（左側表示）", op = 903},
		{name = "2P（右側表示）", op = 904},
	}},
	{name = "ターゲット差分表示", def = "なし", item = {
		{name = "なし", op = 910},
		{name = "あり", op = 911},
	}},
	{name = "ターゲット差分の種類", def = "目標ランク", item = {
		{name = "目標ランク", op = 983},
		{name = "自己ベスト", op = 984},
	}},
	{name = "ターゲット差分表示位置", def = "TYPEA(判定文字上)", item = {
		{name = "TYPEA(判定文字上)", op = 915},
		{name = "TYPEB（判定文字横）", op = 916},
		{name = "TYPEC（判定ライン横）", op = 917},
		{name = "TYPED（判定文字下）", op = 918},
	}},
	{name = "判定タイミング表示", def = "なし", item = {
		{name = "なし", op = 920},
		{name = "あり", op = 921},
	}},
	{name = "判定タイミングの種類", def = "FAST/SLOW", item = {
		{name = "FAST/SLOW", op = 923},
		{name = "+-ms", op = 924},
	}},
	{name = "判定タイミング表示位置", def = "TYPEA(判定文字上)", item = {
		{name = "TYPEA(判定文字上)", op = 925},
		{name = "TYPEB（判定文字横）", op = 926},
		{name = "TYPEC（判定ライン横）", op = 927},
		{name = "TYPED（判定文字下）", op = 928},
	}},
	{name = "判定タイミングボムの使用", def = "使わない", item = {
		{name = "使わない", op = 908},
		{name = "使う（早いか遅いかでボムの色が変化します）", op = 909},
	}},
	{name = "ボムの種類", def = "ModernChic規格", item = {
		{name = "ModernChic規格", op = 906},
		{name = "OADX規格", op = 907},
	}},
	{name = "グラフバーの伸びる向き", def = "左方向", item = {
		{name = "左方向", op = 980},
		{name = "右方向", op = 981},
	}},
	{name = "スコアグラフ、ノート分布、タイミングエリアの配置", def = "TYPEA（グラフ：左、ノート、タイミング：右）", item = {
		{name = "TYPEA（グラフ：左、ノート、タイミング：右）", op = 985},
		{name = "TYPEB（ノート、タイミング：左、グラフ：右）", op = 986},
	}},
	{name = "パーツ表示有無-------------------------", item = {
		{name = "詳しくは同梱のreadme.txtをご覧ください", op = 998}
	}},
	{name = "グローランプ表示", def = "あり", item = {
		{name = "なし", op = 972},
		{name = "あり", op = 973},
	}},
	{name = "ゲージMAXインジケータ表示", def = "あり", item = {
		{name = "なし", op = 975},
		{name = "あり", op = 976},
	}},
	{name = "ゲージ隠し", def = "なし", item = {
		{name = "なし", op = 930},
		{name = "あり", op = 931},
	}},
	{name = "グラフエリア隠し", def = "なし", item = {
		{name = "なし", op = 932},
		{name = "あり", op = 933},
	}},
	{name = "ノート分布隠し", def = "なし", item = {
		{name = "なし", op = 934},
		{name = "あり", op = 935},
	}},
	{name = "タイミンググラフ隠し", def = "なし", item = {
		{name = "なし", op = 936},
		{name = "あり", op = 937},
	}},
	{name = "オートプレイ＆リプレイ時の案内", def = "表示する", item = {
		{name = "表示しない", op = 955},
		{name = "表示する", op = 956},
	}},
	{name = "5鍵用レーンカバー（5鍵モード時のみ）", def = "あり", item = {
		{name = "なし", op = 995},
		{name = "あり", op = 996},
	}},
	{name = "パーツ詳細設定-------------------------", item = {
		{name = "詳しくは同梱のreadme.txtをご覧ください", op = 998}
	}},
	{name = "キービームの高さ", def = "50%（短い）", item = {
		{name = "100%", op = 940},
		{name = "90%", op = 941},
		{name = "80%", op = 942},
		{name = "70%", op = 943},
		{name = "60%", op = 944},
		{name = "50%（短い）", op = 945},
		{name = "40%", op = 946},
		{name = "30%（とても短い）", op = 947},
		{name = "20%", op = 948},
		{name = "10%", op = 949},
	}},
	{name = "キービームの消失時間", def = "通常", item = {
		{name = "通常", op = 960},
		{name = "短い", op = 961},
		{name = "長い", op = 962},
	}},
	{name = "キービームの消失パターン", def = "TYPE-B", item = {
		{name = "TYPE-L", op = 965},
		{name = "TYPE-B", op = 966},
	}},
	{name = "BGA表示パターン", def = "16:9", item = {
		{name = "1:1", op = 950},
		{name = "16:9", op = 951},
		{name = "1:1 x2", op = 952},
		{name = "16:9 x4", op = 953},
		{name = "表示しない", op = 954},
	}},
	{name = "汎用BGAの種類", def = "動画", item = {
		{name = "動画", op = 990},
		{name = "画像", op = 991},
		{name = "表示しない", op = 992},
	}},
}

return property