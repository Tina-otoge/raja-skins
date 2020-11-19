local property = {
	-- カスタムオプション定義
	{name = "カスタムオプション---------------", item = {
		{name = "詳しくは同梱のreadme.txtをご覧ください", op = 998}
	}},
	{name = "背景の種類", def = "静止画", item = {
		{name = "静止画", op = 900},
		{name = "動画", op = 901},
	}},
	{name = "画像フォントの使用", def = "使用しない", item = {
		{name = "使用しない", op = 910},
		{name = "使用する", op = 911},
	}},
	{name = "ステージ＆バナーファイル", def = "両方表示", item = {
		{name = "両方表示", op = 915},
		{name = "ステージファイルをフルサイズ表示", op = 916},
	}},
	{name = "曲リストの並び", def = "直線", item = {
		{name = "直線", op = 920},
		{name = "曲線", op = 921},
		{name = "斜め", op = 922},
	}},
	{name = "サブタイトルのスクロール", def = "する", item = {
		{name = "する", op = 925},
		{name = "しない", op = 926},
	}},
	{name = "ビーム（装飾）", def = "する", item = {
		{name = "する", op = 928},
		{name = "しない", op = 929},
	}},
	{name = "開始パターン", def = "フェードイン", item = {
		{name = "フェードイン", op = 930},
		{name = "シャッター", op = 931},
	}},
	{name = "IR情報表示", def = "クリアレート&フルコンボレート", item = {
		{name = "クリアレート&フルコンボレート", op = 935},
		{name = "ランキング", op = 936},
	}},
}

return property