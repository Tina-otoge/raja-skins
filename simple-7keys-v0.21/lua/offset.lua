-- オフセットID管理用

local offset_id = 59

local function count()
	offset_id = offset_id + 1
	return offset_id
end

return{
	
	-- パラメータ
	
	PARAMETER_1_NAME = "★レーンの表示位置 Lane Position",
	PARAMETER_1_ID = count(),	
	PARAMETER_2_NAME = "1レーン目の横幅 Lane Size key1",
	PARAMETER_2_ID = count(),	
	PARAMETER_3_NAME = "2レーン目の横幅 Lane Size key2",
	PARAMETER_3_ID = count(),	
	PARAMETER_4_NAME = "3レーン目の横幅 Lane Size key3",
	PARAMETER_4_ID = count(),	
	PARAMETER_5_NAME = "4レーン目の横幅 Lane Size key4",
	PARAMETER_5_ID = count(),	
	PARAMETER_6_NAME = "5レーン目の横幅 Lane Size key5",
	PARAMETER_6_ID = count(),	
	PARAMETER_7_NAME = "6レーン目の横幅 Lane Size key6",
	PARAMETER_7_ID = count(),	
	PARAMETER_8_NAME = "7レーン目の横幅 Lane Size key7",
	PARAMETER_8_ID = count(),	
	PARAMETER_9_NAME = "スクラッチレーンの横幅 Lane Size Scratch",
	PARAMETER_9_ID = count(),	
	PARAMETER_10_NAME = "レーン間の線幅 Lane Line Weight (px)",
	PARAMETER_10_ID = count(),	
	PARAMETER_11_NAME = "レーン外枠の線幅 Lane Outline Weight (px)",
	PARAMETER_11_ID = count(),	
	PARAMETER_12_NAME = "レーンの透過度 Lane Opacity -255 ~ 0",
	PARAMETER_12_ID = count(),	
	PARAMETER_13_NAME = "レーン背景の透過度 Lane Background Opacity -255 ~ 0",
	PARAMETER_13_ID = count(),	
	PARAMETER_14_NAME = "小節線の透過度 Barline Opacity -255 ~ 0",
	PARAMETER_14_ID = count(),	
	PARAMETER_15_NAME = "グローの縦幅 Glow Size",
	PARAMETER_15_ID = count(),	
	PARAMETER_16_NAME = "判定ラインの縦幅 Judgeline Size",
	PARAMETER_16_ID = count(),	
	PARAMETER_17_NAME = "キービームの縦幅 Keybeam Size",
	PARAMETER_17_ID = count(),	
	PARAMETER_18_NAME = "キービームの透過度 Keybeam Opacity -255 ~ 0",
	PARAMETER_18_ID = count(),	
	PARAMETER_19_NAME = "ボムのサイズ Bomb Size",
	PARAMETER_19_ID = count(),	
	PARAMETER_20_NAME = "OADXボムのサイズ(%) OADX Bomb Size(%)",
	PARAMETER_20_ID = count(),	
	PARAMETER_21_NAME = "曲進行度バーの表示位置 Songprogress Position",
	PARAMETER_21_ID = count(),	
	PARAMETER_22_NAME = "曲進行度バーの縦幅 Songprogress Size",
	PARAMETER_22_ID = count(),	
	PARAMETER_23_NAME = "★スコアグラフの表示位置 Scoregraph Position",
	PARAMETER_23_ID = count(),	
	PARAMETER_24_NAME = "EXスコアの表示位置 Exscore Position",
	PARAMETER_24_ID = count(),	
	PARAMETER_25_NAME = "スコア差の表示位置 Diffscore Position",
	PARAMETER_25_ID = count(),	
	PARAMETER_26_NAME = "スコアレートの表示位置 Scorerate Position",
	PARAMETER_26_ID = count(),	
	PARAMETER_27_NAME = "ジャッジカウントの表示位置 Judgecount Position",
	PARAMETER_27_ID = count(),	
	PARAMETER_28_NAME = "MAXコンボの表示位置 Maxcombo Position",
	PARAMETER_28_ID = count(),	
	PARAMETER_29_NAME = "★グルーヴゲージの表示位置 Groovegauge Position",
	PARAMETER_29_ID = count(),	
	PARAMETER_30_NAME = "グルーヴゲージの目盛り数 Groovegauge Scale",
	PARAMETER_30_ID = count(),	
	PARAMETER_31_NAME = "BPMの表示位置 BPM Position",
	PARAMETER_31_ID = count(),	
	PARAMETER_32_NAME = "タイトルの表示位置 Title Position",
	PARAMETER_32_ID = count(),	
	PARAMETER_33_NAME = "タイトルの横幅 Title Size",
	PARAMETER_33_ID = count(),	
	PARAMETER_34_NAME = "BGAの表示位置 BGA Position",
	PARAMETER_34_ID = count(),	
	PARAMETER_35_NAME = "BGAのサイズ BGA Size",
	PARAMETER_35_ID = count(),	
	PARAMETER_36_NAME = "BGAの明るさ BGA Brightness -255 ~ 0",
	PARAMETER_36_ID = count(),	
	PARAMETER_37_NAME = "マスコットの表示位置 Mascot Position",
	PARAMETER_37_ID = count(),	
	PARAMETER_38_NAME = "背景の明るさ Background Brightness -255 ~ 0",
	PARAMETER_38_ID = count(),
	
	-- 9key
	PARAMETER_39_NAME = "8レーン目の横幅 Lane Size key8",
	PARAMETER_39_ID = count(),	
	PARAMETER_40_NAME = "9レーン目の横幅 Lane Size key9",
	PARAMETER_40_ID = count(),

	-- 追加
	PARAMETER_41_NAME = "1レーン目のノーツのサイズ Notes Size key1",
	PARAMETER_41_ID = count(),	
	PARAMETER_42_NAME = "2レーン目のノーツのサイズ Notes Size key2",
	PARAMETER_42_ID = count(),	
	PARAMETER_43_NAME = "3レーン目のノーツのサイズ Notes Size key3",
	PARAMETER_43_ID = count(),	
	PARAMETER_44_NAME = "4レーン目のノーツのサイズ Notes Size key4",
	PARAMETER_44_ID = count(),	
	PARAMETER_45_NAME = "5レーン目のノーツのサイズ Notes Size key5",
	PARAMETER_45_ID = count(),	
	PARAMETER_46_NAME = "6レーン目のノーツのサイズ Notes Size key6",
	PARAMETER_46_ID = count(),	
	PARAMETER_47_NAME = "7レーン目のノーツのサイズ Notes Size key7",
	PARAMETER_47_ID = count(),	
	PARAMETER_48_NAME = "8レーン目のノーツのサイズ Notes Size key8",
	PARAMETER_48_ID = count(),	
	PARAMETER_49_NAME = "9レーン目のノーツのサイズ Notes Size key9",
	PARAMETER_49_ID = count(),	
	PARAMETER_50_NAME = "スクラッチノーツのサイズ Notes Size Scratch",
	PARAMETER_50_ID = count(),	


	
	-- オフセット
	
	OFFSET_1_ID =  count(),
	
	-- セパレート
	
	SEPARATE_1 = count(),
	SEPARATE_2 = count(),
	SEPARATE_3 = count(),

}