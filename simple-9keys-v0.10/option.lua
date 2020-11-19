-- オプション番号管理用

local op_number = 899

local function count()
	op_number = op_number + 1
	return op_number
end

return{

	---[[ バグ対応
	OP_0_NAME = "ヘルチャージノートのバグ対応(version0.7.4用)",
		OP_0_ITEM_NAME_1	= "ON",
		OP_0_ITEM_NUMBER_1	= count(),
		OP_0_ITEM_NAME_2	= "OFF",
		OP_0_ITEM_NUMBER_2	= count(),
	--]]

	-- オプション
	
	OP_1_NAME = "ターンテーブルの位置 Turntable Position",
		OP_1_ITEM_NAME_1	= "1",
		OP_1_ITEM_NUMBER_1	= count(),
		OP_1_ITEM_NAME_2	= "2",
		OP_1_ITEM_NUMBER_2	= count(),
		OP_1_ITEM_NAME_3	= "3",
		OP_1_ITEM_NUMBER_3	= count(),
		OP_1_ITEM_NAME_4	= "4",
		OP_1_ITEM_NUMBER_4	= count(),
		OP_1_ITEM_NAME_5	= "5",
		OP_1_ITEM_NUMBER_5	= count(),
		OP_1_ITEM_NAME_6	= "6",
		OP_1_ITEM_NUMBER_6	= count(),
		OP_1_ITEM_NAME_7	= "7",
		OP_1_ITEM_NUMBER_7	= count(),
		OP_1_ITEM_NAME_8	= "8",
		OP_1_ITEM_NUMBER_8	= count(),
		
	OP_2_NAME = "スクラッチキービームの表示方法 Scratch Keybeam",
		OP_2_ITEM_NAME_1	= "DEFAULT",
		OP_2_ITEM_NUMBER_1	= count(),
		OP_2_ITEM_NAME_2	= "MOMENT",
		OP_2_ITEM_NUMBER_2	= count(),
		
	OP_3_NAME = "OADXボムを使用する Use OADX Bomb",
		OP_3_ITEM_NAME_1	= "OFF",
		OP_3_ITEM_NUMBER_1	= count(),
		OP_3_ITEM_NAME_2	= "4:3",
		OP_3_ITEM_NUMBER_2	= count(),
		OP_3_ITEM_NAME_3	= "16:9",
		OP_3_ITEM_NUMBER_3	= count(),
		
	--[[ 未実装
	OP_4_NAME = "OADX+ボムを使用する Use OADX+ Bomb",
		OP_4_ITEM_NAME_1	= "OFF",
		OP_4_ITEM_NUMBER_1	= count(),
		OP_4_ITEM_NAME_2	= "4:3",
		OP_4_ITEM_NUMBER_2	= count(),
		OP_4_ITEM_NAME_3	= "16:9",
		OP_4_ITEM_NUMBER_3	= count(),
	--]]
	
	--[[ 未実装
	OP_5_NAME = "OADX+キービームを使用する Use OADX+ Laser",	
		OP_5_ITEM_NAME_1	= "OFF",
		OP_5_ITEM_NUMBER_1	= count(),
		OP_5_ITEM_NAME_2	= "ON",
		OP_5_ITEM_NUMBER_2	= count(),
	--]]
		
	OP_6_NAME = "OADX+判定文字を使用する Use OADX+ Judge",
		OP_6_ITEM_NAME_1	= "OFF",
		OP_6_ITEM_NUMBER_1	= count(),
		OP_6_ITEM_NAME_2	= "ON",
		OP_6_ITEM_NUMBER_2	= count(),
		
	--[[ 未実装
	OP_7_NAME = "OADX+ノーツを使用する Use OADX+ Notes",
		OP_7_ITEM_NAME_1	= "OFF",
		OP_7_ITEM_NUMBER_1	= count(),
		OP_7_ITEM_NAME_2	= "ON",
		OP_7_ITEM_NUMBER_2	= count(),
	--]]
	
	OP_8_NAME = "判定ラインの表示位置 Judgeline Position",
		OP_8_ITEM_NAME_1	= "POP",
		OP_8_ITEM_NUMBER_1	= count(),
		OP_8_ITEM_NAME_2	= "BEAT",
		OP_8_ITEM_NUMBER_2	= count(),

		
	-- ディスプレイ
	
		-- 判定の詳細を表示する(速/遅) FAST/SLOW
		DISP_1_NUMBER_1 = count(),
		DISP_1_NUMBER_2 = count(),
		
		-- ゴーストスコアを表示する Ghost
		DISP_2_NUMBER_1 = count(),
		DISP_2_NUMBER_2 = count(),
		DISP_2_NUMBER_3 = count(),
		
		-- スコアグラフを表示する Score Graph
		DISP_3_NUMBER_1 = count(),
		DISP_3_NUMBER_2 = count(),
		
		-- EXスコアを表示する EX Score
		DISP_4_NUMBER_1 = count(),
		DISP_4_NUMBER_2 = count(),
		
		-- ターゲット及び自己ベストとのスコア差を表示する Diff Score
		DISP_5_NUMBER_1 = count(),
		DISP_5_NUMBER_2 = count(),
		
		-- スコアレートを表示する Score Rate
		DISP_6_NUMBER_1 = count(),
		DISP_6_NUMBER_2 = count(),
		
		-- ジャッジのカウンタを表示する Judge Count
		DISP_7_NUMBER_1 = count(),
		DISP_7_NUMBER_2 = count(),
		DISP_7_NUMBER_3 = count(),
		
		-- MAXコンボを表示する Max Combo
		DISP_8_NUMBER_1 = count(),
		DISP_8_NUMBER_2 = count(),
		
		-- グルーヴゲージを表示する Groove Gauge
		DISP_9_NUMBER_1 = count(),
		DISP_9_NUMBER_2 = count(),
		
		-- 楽曲のBPMを表示する BPM
		DISP_10_NUMBER_1 = count(),
		DISP_10_NUMBER_2 = count(),
		DISP_10_NUMBER_3 = count(),
		
		-- 楽曲のタイトルを表示する Title
		DISP_11_NUMBER_1 = count(),
		DISP_11_NUMBER_2 = count(),
		
		-- BGAを表示する BGA
		DISP_12_NUMBER_1 = count(),
		DISP_12_NUMBER_2 = count(),
		DISP_12_NUMBER_3 = count(),
		
		-- マスコットを表示する Mascot
		DISP_13_NUMBER_1 = count(),
		DISP_13_NUMBER_2 = count(),
		DISP_13_NUMBER_3 = count(),
	
		-- キャラクターを表示する Character
	DISP_14_NAME = "キャラクターを表示する Character",
		DISP_14_NUMBER_1 = count(),
		DISP_14_NUMBER_2 = count(),
		DISP_14_NUMBER_3 = count(),
		DISP_14_NUMBER_4 = count(),
	
	-- セパレート
	
	SEPARATE_1 = count(),
	SEPARATE_2 = count(),
	SEPARATE_3 = count(),

}