-- 描画設定

	-- レーンの表示位置(座標は左下が0,0)
	lane_origin_x = 210
	lane_origin_y = 210
	
	-- レーンの並び 1~7が鍵盤に対応 8はスクラッチ
	lane_order = {1,2,3,4,5,6,7,8}
	
	-- レーンの横幅 {1,2,3,4,5,6,7,sc}の順で値を入力してください
	lane_width = {100, 88, 100, 88, 100, 88, 100, 140}
				
	-- ノーツの横幅 {1,2,3,4,5,6,7,sc}
	note_width = {90, 78, 90, 78, 90, 78, 90, 130}
	
	-- ノーツの縦幅 {1,2,3,4,5,6,7,sc}
	note_height = {30,30,30,30,30,30,30,30}
	
	-- レーン間の線幅
	lane_line_px = 3
	
	-- レーン外枠の線幅
	lane_outline_px = 3
	
		-- 座標の計算
		lanes_width = (lane_line_px * 7) + (lane_outline_px * 2)
		for i, v in ipairs(lane_width) do
			lanes_width = lanes_width + v
		end
		-- レーン中央
		lanes_center_x = lane_origin_x + (lanes_width / 2)
		-- レーン右端
		lanes_right_x = lane_origin_x + lanes_width
	
	-- レーンの不透明度
	lane_opacity = 128
	
	-- レーン間の線の不透明度
	lane_line_opacity = 128
	
	-- レーン外枠の不透明度
	lane_outline_opacity = 255
	
	-- レーン背景の不透明度
	lanebg_opacity = 255
	
	-- 小節線の不透明度
	barline_opacity = 0
	
	-- グローの縦幅
	glow_height = 64
	
	-- グローの不透明度
	glow_opacity = 96
	
	-- 判定ラインの縦幅
	judgeline_height = 14
	
	-- 判定ラインの不透明度
	judgeline_opacity = 255
	
	-- キービームの縦幅
	keybeam_height = 370
	
	-- キービームの不透明度
	keybeam_opacity = 128
	
	-- キーオン時のキービームの可変幅
	keybeam_variable_key_on = 10
	
	-- キーオン時のキービームアニメーション表示時間
	keybeam_time_key_on = 20
	
	-- キーオフ時のキービームの可変幅
	keybeam_variable_key_off = 20
	
	-- キーオフ時のキービームアニメーション表示時間
	keybeam_time_key_off = 60
	
	-- ボムのサイズ
	bomb_width = 384
	bomb_height = 384
	
	-- ボムのアニメーション再生時間
	bomb_animation_cycle = 250
	
	-- ホールドボムのアニメーション再生周期
	hold_animation_cycle = 500
	
	-- OADXボムの表示倍率
	oadx_bomb_magnification = 3
	
	-- ジャッジの座標
	judge_y = lane_origin_y + 160
	
	-- 判定文字のサイズ
	-- overwrite_judge_f_width = 180
	-- overwrite_judge_f_height = 50
	
	-- 判定数字のサイズ
	-- overwrite_judge_n_width = 36
	-- overwrite_judge_n_height = 50
	
	-- FAST/SLOWの表示位置
	-- overwrite_judgedetail_x = lanes_center_x - 108
	-- overwrite_judgedetail_y = judge_y + 100
	
	-- ゴーストスコアの表示位置
	-- overwrite_ghost_x = lanes_center_x + 36
	-- overwrite_ghost_y = judge_y + 100
	
	-- 曲進行度バーのサイズ
	songprogress_height = 1080 - lane_origin_y - 80
	
	-- 曲進行度バーの表示位置
	songprogress_x = lanes_right_x - 22
	songprogress_y = lane_origin_y + songprogress_height
		
	-- スコアグラフの表示位置
	graph_x = lanes_right_x + 48
	graph_y = 360	
	
	-- EXスコアの表示位置
	exscore_x = graph_x + 6
	exscore_y = graph_y + 17
	
	-- スコア差の表示位置
	diffscore_x = graph_x + 6
	diffscore_y = graph_y + 55
	
	-- スコアレートの表示位置
	rate_x = graph_x + 6
	rate_y = graph_y + 36
	
	-- ジャッジカウントの表示位置
	judgecount_x = graph_x + 6
	judgecount_y = graph_y - 150
	
	-- MAXコンボの表示位置
	maxcombo_x = graph_x + 6
	maxcombo_y = graph_y - 169
	
	-- 推定ランクの表示位置
	rankpace_x = graph_x + 6
	rankpace_y = graph_y + 112
	
	-- マスコットの表示位置
	mascot_x = graph_x + 52
	mascot_y = graph_y + 3

	-- グルーヴゲージの表示位置
	gauge_x = lane_origin_x
	gauge_y = 64
	
	-- グルーヴゲージの目盛り数
	gauge_scale = 48
	
	-- グルーヴゲージのサイズ
	gauge_width = 12 * gauge_scale
	gauge_height = 36
	
	-- グルーヴゲージ数値の表示位置
	gauge_num_x = gauge_x + gauge_width
	gauge_num_y = gauge_y

	-- BPMの表示位置
	bpm_x = gauge_x + gauge_width + 18
	bpm_y = gauge_y - 56
	
	-- タイトルの横幅
	title_width = gauge_width
	
	-- タイトルの表示位置
	title_x = gauge_x + (title_width / 2)
	title_y = gauge_y - 56
	
	-- BGAの表示位置
	bga_x = 0
	bga_y = -420
	
	-- BGAのサイズ
	bga_width = 1920
	bga_height = 1920
	
	-- BGAの不透明度
	bga_opacity = 128
	
	-- 背景の不透明度
	background_opacity = 255
	
	-- タイミングビジュアライザー
	timingvisualizer_x = lane_origin_x
	timingvisualizer_y = lane_origin_y - 60
	timingvisualizer_w = lanes_width - lane_width[8] - lane_outline_px
	timingvisualizer_h = 40