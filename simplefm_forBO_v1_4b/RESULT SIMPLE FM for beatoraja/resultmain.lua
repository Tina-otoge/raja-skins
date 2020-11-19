-- local function append_all(list, list1)
-- 	for i, v in ipairs(list1) do
-- 		table.insert(list, v)
-- 	end
-- end

local function is_play_side()
	return skin_config.option["GRAPH POSITION"] == 911
end

local function is_info_side()
	return skin_config.option["INFO POSITION"] == 921
end

local function is_rank_size()
	return skin_config.option["RANK SIZE"] == 940
end

local function is_clear_state()
	return skin_config.option["CLEAR STATE"] == 950
end

local function is_filter()
	return skin_config.option["FILTER"] == 961
end

local function is_stagefile()
	return skin_config.option["STAGEFILE WINDOW"] == 971
end

 

local header = {
   type = 7,
   name = "RESULT SIMPLE FM for beatoraja \(lua\)",
   w = 1280,
   h = 720,
   scene = 3600000,
   input = 500,
   fadeout = 700,
   property = {
      { name = "---------------------------------カスタマイズオプション----------------------------------", item = {{name = "---"}}},
      { name = "GRAPH POSITION" ,
	item = {
	   {name = "LEFT \(1P\)", op = 910},
	   {name = "RIGHT \(2P\)", op = 911}
	}	
      },
      { name = "INFO POSITION" ,
	item = {
	   {name = "BOTTOM", op = 920},
	   {name = "TOP", op = 921}
	}	
      },
      { name = "STAGEFILE" ,
	item = {
	   {name = "OFF", op = 900},
	   {name = "ON\(CLEAR時\)", op = 901},
	   {name = "ON\(常時\)", op = 902}
	}	
      },
      { name = "PGREATのFAST/SLOW表示" ,
	item = {
	   {name = "OFF\(FAST/\SLOWの文字)", op = 931},
	   {name = "ON", op = 930}
	}	
      },
      { name = "RANK SIZE" ,
	item = {
	   {name = "SMALL", op = 940},
	   {name = "BIG", op = 941}
	}
      },
      { name = "CLEAR STATE" ,
	item = {
	   {name = "ON", op = 950},
	   {name = "OFF", op = 951}
	}
      },
      { name = "FILTER" ,
	item = {
	   {name = "OFF", op = 960},
	   {name = "ON", op = 961}
	}
      },
      { name = "STAGEFILE WINDOW" ,
	item = {
	   {name = "OFF", op = 970},
	   {name = "ON", op = 971}
	}
      }
   },
      filepath = {
	 { name = "---------------------------------背景オプション---------------------------------"},
      { name = "AAA", path = "bg/AAA/*.png"},
      { name = "AA", path = "bg/AA/*.png"},
      { name = "A", path = "bg/A/*.png"},
      { name = "CLEAR", path = "bg/clear/*.png"},
      { name = "FAILED", path = "bg/failed/*.png"}
   },
   offset = {
      { name = "---------------------------------カスタムオフセット---------------------------------"},
      { name = "INFO背景の透明度\(a=-255で透明\)", id = 60, a=0},
      { name = "ゲージ遷移表の透明度\(a=255で透明\)", id = 50, a=0},
      { name = "ゲージ遷移表の位置", id = 51, x = 0, y = 0},
      { name = "ジャッジの位置", id = 52, x = 0, y = 0},
      { name = "詳細情報の位置", id = 53, x = 0, y = 0},
      { name = "STAGEFILE WINDOW", id = 54, x = 0, y = 0, w = 0, h = 0}
   }
}

local function main()
   --ヘッダー情報をスキン本体へコピー
   local skin = {}
   for k,v in pairs(header) do
      skin[k] = v
   end

   --　ここからスキン内容記述
   skin.source = {
      {id = 0, path = "bg/A/*.png"},
      {id = 1, path = "bg/AA/*.png"},
      {id = 2, path = "bg/AAA/*.png"},
      {id = 3, path = "bg/clear/*.png"},
      {id = 4, path = "bg/failed/*.png"},
      {id = 5, path = "parts/parts.png"},
      {id = 6, path = "parts/groove.png"},
      {id = 7, path = "parts/number.png"},
      {id = 8, path = "parts/rank.png"},
      {id = 9, path = "parts/rank_big.png"},
      {id = 10, path = "parts/subbg.png"},
      {id = 11, path = "parts/state.png"}
   }
   skin.font = {
      {id = 0, path = "font/GenShinGothic-Heavy.ttf"}
   }
   skin.image = {
      --背景
      {id = "bg_A", src = 0, x = 0, y = 0, w = -1, h = -1},
      {id = "bg_AA", src = 1, x = 0, y = 0, w = -1, h = -1},
      {id = "bg_AAA", src = 2, x = 0, y = 0, w = -1, h = -1},
      {id = "bg_clear", src = 3, x = 0, y = 0, w = -1, h = -1},
      {id = "bg_failed", src = 4, x = 0, y = 0, w = -1, h = -1},
      {id = "bg_sub_L", src = 10, x = 0, y = 0, w = 122, h = 55},
      {id = "bg_sub_R", src = 10, x = 122, y = 0, w = 600, h = 55},
      --パーツ
      {id = "pt_LV", src = 5 , x = 0, y = 126, w = 37, h = 17},
      {id = "pt_PERCENT_G", src = 6 , x = 110, y = 9, w = 9, h = 8},
      {id = "pt_DEAD", src = 6, x = 0, y = 17, w = 42, h = 17},
      {id = "pt_PGREAT", src = 5 , x = 0, y = 0, w = 78, h = 17},
      {id = "pt_GREAT", src = 5 , x = 0, y = 0, w = 78, h = 17},
      {id = "pt_GOOD", src = 5 , x = 0, y = 18, w = 78, h = 17},
      {id = "pt_BAD", src = 5 , x = 0, y = 36, w = 78, h = 17},
      {id = "pt_POOR", src = 5 , x = 0, y = 54, w = 78, h = 17},
      {id = "pt_MISS", src = 5 , x = 0, y = 72, w = 78, h = 17},
      {id = "pt_CB", src = 5 , x = 160, y = 126, w = 78, h = 17},
      {id = "pt_MAX_COMBO", src = 5 , x = 79, y = 0, w = 159, h = 17},
      {id = "pt_EX_SCORE", src = 5 , x = 79, y = 18, w = 159, h = 17},
      {id = "pt_TARGET_SCORE", src = 5 , x = 79, y = 36, w = 159, h = 17},
      {id = "pt_BEST_SCORE", src = 5 , x = 79, y = 54, w = 159, h = 17},
      {id = "pt_MISS_COUNT", src = 5 , x = 79, y = 72, w = 159, h = 17},
      {id = "pt_SCORE_RATE", src = 5 , x = 79, y = 90, w = 159, h = 17},
      {id = "pt_SCORE", src = 5 , x = 239, y = 0, w = 147, h = 17},
      {id = "pt_TOTAL_NOTES", src = 5 , x = 239, y = 18, w = 147, h = 17},
      {id = "pt_NEXT_RANK", src = 5 , x = 239, y = 36, w = 147, h = 17},
      {id = "pt_IR", src = 5 , x = 239, y = 54, w = 147, h = 17},
      {id = "pt_FOLDER", src = 5 , x = 239, y = 72, w = 147, h = 17},
      {id = "pt_GENRE", src = 5 , x = 239, y = 90, w = 147, h = 17},
      {id = "pt_ARTIST", src = 5 , x = 239, y = 108, w = 147, h = 17},
      --記号
      {id = "pt_FAST", src = 5, x = 129, y = 108, w = 54, h = 17},
      {id = "pt_SLOW", src = 5, x = 184, y = 108, w = 54, h = 17},
      {id = "pt_F", src = 5, x = 42, y = 126, w = 14, h = 17},
      {id = "pt_S", src = 5, x = 56, y = 126, w = 14, h = 17},
      {id = "pt_SLASH", src = 5 , x = 0, y = 90, w = 12, h = 17},
      {id = "pt_NEXTTO", src = 5 , x = 70, y = 126, w = 12, h = 17},
      {id = "pt_PERCENT", src = 5 , x = 13, y = 90, w = 14, h = 17},
      {id = "pt_PGREAT1", src = 5 , x = 0, y = 0, w = 67, h = 17},
      {id = "pt_PGREAT2", src = 5 , x = 0, y = 144, w = 67, h = 17},
      --nextRANK用
      {id = "pt_RANK_MAX_s", src = 5, x = 36, y = 90, w = 42, h = 17},
      {id = "pt_RANK_AAA_s", src = 5, x = 0, y = 108, w = 42, h = 17},
      {id = "pt_RANK_AA_s", src = 5, x = 0, y = 108, w = 28, h = 17},
      {id = "pt_RANK_A_s", src = 5, x = 0, y = 108, w = 14, h = 17},
      {id = "pt_RANK_B_s", src = 5, x = 42, y = 108, w = 14, h = 17},
      {id = "pt_RANK_C_s", src = 5, x = 56, y = 108, w = 14, h = 17},
      {id = "pt_RANK_D_s", src = 5, x = 70, y = 108, w = 14, h = 17},
      {id = "pt_RANK_E_s", src = 5, x = 84, y = 108, w = 14, h = 17},
      --クリア状況
      {id = "pt_CLEARED_STATUS", src = 11, x = 0, y = 0, w = -1, h = -1,divy = 11, len = 11, ref = 371},
      {id = "pt_CLEAR_STATUS", src = 11, x = 0, y = 0, w = -1, h = -1, divy = 11, len = 11, ref = 370},
   }
   if is_rank_size() then
      image_rank = {
		    --ランク
		    {id = "pt_RANK_AAA", src = 8, x = 0, y = 0, w = 97, h = 41},
		    {id = "pt_RANK_AA", src = 8, x = 0, y = 0, w = 65, h = 41},
		    {id = "pt_RANK_A", src = 8, x = 0, y = 0, w = 33, h = 41},
		    {id = "pt_RANK_B", src = 8, x = 98, y = 0, w = 33, h = 41},
		    {id = "pt_RANK_C", src = 8, x = 0, y = 42, w = 33, h = 41},
		    {id = "pt_RANK_D", src = 8, x = 34, y = 42, w = 33, h = 41},
		    {id = "pt_RANK_E", src = 8, x = 68, y = 42, w = 33, h = 41},
		    {id = "pt_RANK_F", src = 8, x = 102, y = 42, w = 33, h = 41}
      }
      for i, v in ipairs(image_rank) do
         table.insert(skin.image, v)
      end
   else
      image_rank = {
		    --ランク
		    {id = "pt_RANK_AAA", src = 9, x = 0, y = 0, w = 160, h = 68},
		    {id = "pt_RANK_AA", src = 9, x = 0, y = 0, w = 107, h = 68},
		    {id = "pt_RANK_A", src = 9, x = 0, y = 0, w = 54, h = 68},
		    {id = "pt_RANK_B", src = 9, x = 161, y = 0, w = 54, h = 68},
		    {id = "pt_RANK_C", src = 9, x = 0, y = 69, w = 54, h = 68},
		    {id = "pt_RANK_D", src = 9, x = 55, y = 69, w = 54, h = 68},
		    {id = "pt_RANK_E", src = 9, x = 110, y = 69, w = 54, h = 68},
		    {id = "pt_RANK_F", src = 9, x = 165, y = 69, w = 54, h = 68}
      }
      for i, v in ipairs(image_rank) do
         table.insert(skin.image, v)
      end
   end
   skin.value = {
      -- {id = 400, src = 5, x = 0, y = 0, w = 240, h = 24, divx = 10, digit = 4, ref = 91},
      {id = "num_BG", src = 7, x = 0, y = 17, w = 154, h = 17, divx = 11, digit = 2, ref = 45},
      {id = "num_NO", src = 7, x = 0, y = 17, w = 154, h = 17, divx = 11, digit = 2, ref = 46},
      {id = "num_HY", src = 7, x = 0, y = 17, w = 154, h = 17, divx = 11, digit = 2, ref = 47},
      {id = "num_AN", src = 7, x = 0, y = 17, w = 154, h = 17, divx = 11, digit = 2, ref = 48},
      {id = "num_IN", src = 7, x = 0, y = 17, w = 154, h = 17, divx = 11, digit = 2, ref = 49},
      {id = "num_PERCENT", src = 6, x = 0, y = 0, w = 110, h = 17, divx = 10, digit = 3, ref = 107},
      {id = "num_PGREAT", src = 7, x = 0, y = 0, w = 154, h = 17, divx = 11, digit = 4, ref = 110},
      {id = "num_GREAT", src = 7, x = 0, y = 0, w = 154, h = 17, divx = 11, digit = 4, ref = 111},
      {id = "num_GOOD", src = 7, x = 0, y = 0, w = 154, h = 17, divx = 11, digit = 4, ref = 112},
      {id = "num_BAD", src = 7, x = 0, y = 0, w = 154, h = 17, divx = 11, digit = 4, ref = 113},
      {id = "num_POOR", src = 7, x = 0, y = 0, w = 154, h = 17, divx = 11, digit = 4, ref = 114},
      {id = "num_MISS", src = 7, x = 0, y = 0, w = 154, h = 17, divx = 11, digit = 4, ref = 420},
      {id = "num_CB", src = 7, x = 0, y = 0, w = 154, h = 17, divx = 11, digit = 4, ref = 425},
      {id = "num_POOR_MISS", src = 7, x = 0, y = 0, w = 154, h = 17, divx = 11, digit = 4, ref = 426},
      {id = "num_PGREAT_FAST", src = 7, x = 0, y = 17, w = 154, h = 17, divx = 11, digit = 4, ref = 410},
      {id = "num_GREAT_FAST", src = 7, x = 0, y = 17, w = 154, h = 17, divx = 11, digit = 4, ref = 412},
      {id = "num_GOOD_FAST", src = 7, x = 0, y = 17, w = 154, h = 17, divx = 11, digit = 4, ref = 414},
      {id = "num_BAD_FAST", src = 7, x = 0, y = 17, w = 154, h = 17, divx = 11, digit = 4, ref = 416},
      {id = "num_POOR_FAST", src = 7, x = 0, y = 17, w = 154, h = 17, divx = 11, digit = 4, ref = 418},
      {id = "num_MISS_FAST", src = 7, x = 0, y = 17, w = 154, h = 17, divx = 11, digit = 4, ref = 421},
      {id = "num_TOTAL_FAST", src = 7, x = 0, y = 17, w = 154, h = 17, divx = 11, digit = 4, ref = 423},
      {id = "num_PGREAT_LATE", src = 7, x = 0, y = 17, w = 154, h = 17, divx = 11, digit = 4, ref = 411},
      {id = "num_GREAT_LATE", src = 7, x = 0, y = 17, w = 154, h = 17, divx = 11, digit = 4, ref = 413},
      {id = "num_GOOD_LATE", src = 7, x = 0, y = 17, w = 154, h = 17, divx = 11, digit = 4, ref = 415},
      {id = "num_BAD_LATE", src = 7, x = 0, y = 17, w = 154, h = 17, divx = 11, digit = 4, ref = 417},
      {id = "num_POOR_LATE", src = 7, x = 0, y = 17, w = 154, h = 17, divx = 11, digit = 4, ref = 419},
      {id = "num_MISS_LATE", src = 7, x = 0, y = 17, w = 154, h = 17, divx = 11, digit = 4, ref = 422},
      {id = "num_TOTAL_LATE", src = 7, x = 0, y = 17, w = 154, h = 17, divx = 11, digit = 4, ref = 424},
      {id = "num_MAX_COMBO", src = 7, x = 0, y = 0, w = 154, h = 17, divx = 11, digit = 4, ref = 105},
      {id = "num_EX_SCORE", src = 7, x = 0, y = 0, w = 154, h = 17, divx = 11, digit = 4, ref = 101},
      {id = "num_TARGET_SCORE", src = 7, x = 0, y = 0, w = 154, h = 17, divx = 11, digit = 4, ref = 151},
      {id = "num_TARGET_SCORE_dif", src = 7, x = 0, y = 17, w = 336, h = 17, divx = 24, digit = 5, ref = 153, align = 1, padding = 2},
      {id = "num_BEST_SCORE", src = 7, x = 0, y = 0, w = 154, h = 17, divx = 11, digit = 4, ref = 170},
      {id = "num_BEST_SCORE_dif", src = 7, x = 0, y = 17, w = 336, h = 17, divx = 24, digit = 5, ref = 152, align = 1, padding = 2},
      {id = "num_MISS_COUNT", src = 7, x = 0, y = 0, w = 154, h = 17, divx = 11, digit = 4, ref = 177},
      {id = "num_MISS_COUNT_dif", src = 7, x = 0, y = 34, w = 336, h = 17, divx = 24, digit = 5, ref = 178, align = 1, padding = 2},
      {id = "num_SCORE_RATE", src = 7, x = 0, y = 0, w = 154, h = 17, divx = 11, digit = 3, ref = 115},
      {id = "num_SCORE", src = 7, x = 0, y = 0, w = 154, h = 17, divx = 11, digit = 6, ref = 100},
      {id = "num_TOTAL_NOTES", src = 7, x = 0, y = 0, w = 154, h = 17, divx = 11, digit = 4, ref = 106},
      {id = "num_NEXT_RANK", src = 7, x = 0, y = 51, w = 336, h = 17, divx = 24, digit = 5,  padding = 2, ref = 154},      
      {id = "num_IR_RANK", src = 7, x = 0, y = 0, w = 154, h = 17, divx = 11, digit = 5, ref = 179},
      {id = "num_IR_TOTAL", src = 7, x = 0, y = 0, w = 154, h = 17, divx = 11, digit = 5, ref = 180}
   }
   skin.text = {
      --曲名
      {id = "title", font = 0, size = 28, align = 1, ref = 12},
      --難易度表
      {id = "folder", font = 0, size = 17, align = 0, ref = 1003},
      --アーティスト
      {id = "artist", font = 0, size = 17, align = 0, ref = 14},
      --ジャンル
      {id = "genre", font = 0, size = 17, align = 0, ref = 13}
   }
   skin.gaugegraph = {
      {id = "gaugegraph"}
   }

   skin.judgegraph = {
      {id = "judgegraph", delay = 500}
   }
   --プレイサイドごとの座標の設定
   local opt = {
   }

   opt.stagedata_x = 960
   opt.stagedata_y = 400
    
   if is_play_side() then 
      opt.judge_x = 0
      opt.info_x = 320
      opt.bg_x = 960
   else
      opt.judge_x = 320
      opt.info_x = 640
      opt.bg_x = 0
   end
   
   if is_info_side() then
      opt.judge_y = 491
      opt.info_y = 491
      opt.bg_y = 491
   else
      opt.judge_y = 0
      opt.info_y = 0
      opt.bg_y = 0
   end

   if is_clear_state() then
      opt.cs_y = 34
   else
      opt.cs_y = 0
   end

   if is_filter() then
      opt.filter = 1
   else
      opt.filter = 0
   end

   skin.destination = {}

   local parts_bg = {
      --背景定義
      {id = "bg_failed", filter = 1, op = {91}, dst = { {x = 0, y = 0, w =1280, h = 720} }},
      {id = "gaugegraph", op={91},  offset = 51, dst = { { time = 0, x = opt.bg_x, y = opt.cs_y + opt.bg_y + 40, w = 320, h =190 - opt.cs_y}  }},
      {id = "bg_failed", filter = 1, offset = 50,  op = {91}, dst = { {x = 0, y = 0, w =1280, h = 720, a = 0} }},
      
      {id = "bg_clear", filter = 1, op = {90}, dst = { {x = 0, y = 0, w =1280, h = 720} }},
      {id = "gaugegraph", op = {90}, offset = 51, dst = { { time = 0, x = opt.bg_x, y = opt.cs_y + opt.bg_y + 40, w = 320, h =190 - opt.cs_y}  }},
      {id = "bg_clear", filter = 1, offset = 50,  op = {90}, dst = { {x = 0, y = 0, w =1280, h = 720, a = 0} }},
      
      {id = "bg_A", filter = 1, op = {90,302}, dst = { {x = 0, y = 0, w =1280, h = 720} }},
      {id = "gaugegraph", op = {90,302},offset = 51, dst = {{ time = 0, x = opt.bg_x, y = opt.cs_y + opt.bg_y + 40, w = 320, h =190 - opt.cs_y}  }},
      {id = "bg_A", filter = 1, offset = 50, op = {90,302}, dst = { {x = 0, y = 0, w =1280, h = 720, a = 0} }},
      
      {id = "bg_AA", filter = 1, op = {90,301}, dst = { {x = 0, y = 0, w =1280, h = 720} }},
      {id = "gaugegraph", op = {90,301}, offset = 51, dst = {{ time = 0, x = opt.bg_x, y = opt.cs_y + opt.bg_y + 40, w = 320, h =190 - opt.cs_y} }},
      {id = "bg_AA", filter = 1, offset = 50, op = {90,301}, dst = { {x = 0, y = 0, w =1280, h = 720, a = 0} }},
      
      {id = "bg_AAA", filter = 1, op = {90,300}, dst = { {x = 0, y = 0, w =1280, h = 720} }},
      {id = "gaugegraph",op = {90,300}, offset = 51, dst = {{ time = 0, x = opt.bg_x, y = opt.cs_y + opt.bg_y + 40, w = 320, h =190 - opt.cs_y} }},
      {id = "bg_AAA", filter = 1, offset = 50, op = {90,300}, dst = { {x = 0, y = 0, w =1280, h = 720, a = 0} }},
      
      {id = -100, filter = 1, op = {90, 191, 901}, dst = { {x = 0, y = 0, w =1280, h = 720} }},
      {id = "gaugegraph", op = {90,191,901}, offset = 51, dst = { { time = 0, x = opt.bg_x, y = opt.cs_y + opt.bg_y + 40, w = 320, h =190 - opt.cs_y} }},
      {id = -100, filter = 1, offset = 50, op = {90, 191, 901}, dst = { {x = 0, y = 0, w =1280, h = 720, a = 0} }},
      {id = -100, filter = 1, op = {191, 902}, dst = { {x = 0, y = 0, w =1280, h = 720} }},
      {id = "gaugegraph", op = {191,902}, offset = 51, dst = { { time = 0, x = opt.bg_x, y = opt.cs_y + opt.bg_y + 40, w = 320, h =190 - opt.cs_y} }},
      {id = -100, filter = 1, offset = 50, op = {191, 902}, dst = { {x = 0, y = 0, w =1280, h = 720, a = 0} }},
    
      --レベル、達成率
      {id = -110,  blend = 1, offset = 51, dst = { {x = opt.bg_x + 10, y = opt.cs_y +  opt.bg_y + 43, w = 300, h = 22, a = 152} }},
      {id = -110, blend = 1,  offsets = {60,51}, dst = { {x = opt.bg_x, y = opt.bg_y + 40, w = 320, h = opt.cs_y, a = 152} }},
      {id = "pt_LV", op = {151}, filter = opt.filter, offset = 51, dst = { {x = opt.bg_x +17, y = opt.cs_y +  opt.bg_y + 45, w = 37, h = 17, r = 0, g = 255, b = 155} }},
      {id = "num_BE",op = {151}, filter = opt.filter, offset = 51, dst = { {x = opt.bg_x +57, y = opt.cs_y +  opt.bg_y + 45, w = 14, h = 17, r = 0, g = 255, b = 155} }},
      {id = "pt_LV", op = {152}, filter = opt.filter, offset = 51, dst = { {x = opt.bg_x +17, y = opt.cs_y +  opt.bg_y + 45, w = 37, h = 17, r = 20, g = 200, b = 255} }},
      {id = "num_NO",op = {152}, filter = opt.filter, offset = 51, dst = { {x = opt.bg_x +57, y = opt.cs_y +  opt.bg_y + 45, w = 14, h = 17, r = 20, g = 200, b = 255} }},
      {id = "pt_LV", op = {153}, filter = opt.filter, offset = 51, dst = { {x = opt.bg_x +17, y = opt.cs_y +  opt.bg_y + 45, w = 37, h = 17, r = 255, g = 255, b = 0} }},
      {id = "num_HY",op = {153}, filter = opt.filter, offset = 51, dst = { {x = opt.bg_x +57, y = opt.cs_y +  opt.bg_y + 45, w = 14, h = 17, r = 255, g = 255, b = 0} }},
      {id = "pt_LV", op = {154}, filter = opt.filter, offset = 51, dst = { {x = opt.bg_x +17, y = opt.cs_y +  opt.bg_y + 45, w = 37, h = 17, r = 225, g = 30, b = 30} }},
      {id = "num_AN",op = {154}, filter = opt.filter, offset = 51, dst = { {x = opt.bg_x +57, y = opt.cs_y +  opt.bg_y + 45, w = 14, h = 17, r = 225, g = 30, b = 30} }},
      {id = "pt_LV", op = {155}, filter = opt.filter, offset = 51, dst = { {x = opt.bg_x +17, y = opt.cs_y +  opt.bg_y + 45, w = 37, h = 17, r = 255, g = 0, b = 255} }},
      {id = "num_IN",op = {155}, filter = opt.filter, offset = 51, dst = { {x = opt.bg_x +57, y = opt.cs_y +  opt.bg_y + 45, w = 14, h = 17, r = 255, g = 0, b = 255} }},
      {id = "pt_DEAD", op = {43,91}, filter = opt.filter, offset = 51, dst = { {x = opt.bg_x +261, y = opt.cs_y +  opt.bg_y + 45, w = 42, h = 17} }},
      {id = "pt_DEAD", op = {45,91}, filter = opt.filter, offset = 51, dst = { {x = opt.bg_x +261, y = opt.cs_y +  opt.bg_y + 45, w = 42, h = 17} }},
      {id = "num_PERCENT", op = {-43,91}, filter = opt.filter, offset = 51, dst = { {x = opt.bg_x +251, y = opt.cs_y +  opt.bg_y + 45, w = 14, h = 17} }},
      {id = "pt_PERCENT_G", op = {-43,91}, filter = opt.filter, offset = 51, dst = { {x = opt.bg_x +294, y = opt.cs_y +  opt.bg_y + 45, w = 9, h = 8} }},
      {id = "num_PERCENT", op = {-45,91}, filter = opt.filter, offset = 51, dst = { {x = opt.bg_x +251, y = opt.cs_y +  opt.bg_y + 45, w = 14, h = 17} }},
      {id = "pt_PERCENT_G", op = {-45,91}, filter = opt.filter, offset = 51, dst = { {x = opt.bg_x +294, y = opt.cs_y +  opt.bg_y + 45, w = 9, h = 8} }},	
      {id = "num_PERCENT", op = {90}, filter = opt.filter, offset = 51, dst = { {x = opt.bg_x +251, y = opt.cs_y +  opt.bg_y + 45, w = 14, h = 17} }},
      {id = "pt_PERCENT_G", op = {90}, filter = opt.filter, offset = 51, dst = { {x = opt.bg_x +294, y = opt.cs_y +  opt.bg_y + 45, w = 9, h = 8} }},
      --クリア状況
      {id = "pt_CLEARED_STATUS", op = {950}, filter = opt.filter, offset = 51, dst = { {x = opt.bg_x + 32, y = opt.bg_y + 48, w = 90, h = 17} }},
      {id = "pt_NEXTTO", op ={950}, filter = opt.filter, offset = 51, dst = { {x = opt.bg_x + 152, y = opt.bg_y + 48, w = 12, h = 17} }},
      --今回のクリアランプ
      {id = "pt_CLEAR_STATUS", op = {950}, filter = opt.filter, offset = 51, dst = { {x = opt.bg_x + 196, y = opt.bg_y + 48, w = 90, h = 17} }}
   }
   if is_rank_size() then
      parts_rank = {
		    {id = "pt_RANK_AAA",op = {300}, filter = opt.filter, offset = 51, dst = { {x = opt.bg_x +15, y = opt.cs_y + opt.bg_y + 67, w = 97, h = 41} }},
		    {id = "pt_RANK_AA",op = {301}, filter = opt.filter, offset = 51, dst = { {x = opt.bg_x +15, y = opt.cs_y + opt.bg_y + 67, w = 65, h = 41} }},
		    {id = "pt_RANK_A",op = {302}, filter = opt.filter, offset = 51, dst = { {x = opt.bg_x +15, y = opt.cs_y + opt.bg_y + 67, w = 33, h = 41} }},
		    {id = "pt_RANK_B",op = {303}, filter = opt.filter, offset = 51, dst = { {x = opt.bg_x +15, y = opt.cs_y + opt.bg_y + 67, w = 33, h = 41} }},
		    {id = "pt_RANK_C",op = {304}, filter = opt.filter, offset = 51, dst = { {x = opt.bg_x +15, y = opt.cs_y + opt.bg_y + 67, w = 33, h = 41} }},
		    {id = "pt_RANK_D",op = {305}, filter = opt.filter, offset = 51, dst = { {x = opt.bg_x +15, y = opt.cs_y + opt.bg_y + 67, w = 33, h = 41} }},
		    {id = "pt_RANK_E",op = {306}, filter = opt.filter, offset = 51, dst = { {x = opt.bg_x +15, y = opt.cs_y + opt.bg_y + 67, w = 33, h = 41} }},
		    {id = "pt_RANK_F",op = {307}, filter = opt.filter, offset = 51, dst = { {x = opt.bg_x +15, y = opt.cs_y + opt.bg_y + 67, w = 33, h = 41} }}
      }
      for i, v in ipairs(parts_rank) do
         table.insert(parts_bg, v)
      end
   else
      parts_rank = {
         {id = "pt_RANK_AAA",op = {300}, filter = opt.filter, offset = 51, dst = { {x = opt.bg_x + 15, y = opt.cs_y + opt.bg_y + 67, w = 160, h = 68} }},
         {id = "pt_RANK_AA",op = {301}, filter = opt.filter, offset = 51, dst = { {x = opt.bg_x + 15, y = opt.cs_y + opt.bg_y + 67, w = 107, h = 68} }},
         {id = "pt_RANK_A",op = {302}, filter = opt.filter, offset = 51, dst = { {x = opt.bg_x + 15, y = opt.cs_y + opt.bg_y + 67, w = 54, h = 68} }},
         {id = "pt_RANK_B",op = {303}, filter = opt.filter, offset = 51, dst = { {x = opt.bg_x + 15, y = opt.cs_y + opt.bg_y + 67, w = 54, h = 68} }},
         {id = "pt_RANK_C",op = {304}, filter = opt.filter, offset = 51, dst = { {x = opt.bg_x + 15, y = opt.cs_y + opt.bg_y + 67, w = 54, h = 68} }},
         {id = "pt_RANK_D",op = {305}, filter = opt.filter, offset = 51, dst = { {x = opt.bg_x + 15, y = opt.cs_y + opt.bg_y + 67, w = 54, h = 68} }},
         {id = "pt_RANK_E",op = {306}, filter = opt.filter, offset = 51, dst = { {x = opt.bg_x + 15, y = opt.cs_y + opt.bg_y + 67, w = 54, h = 68} }},
         {id = "pt_RANK_F",op = {307}, filter = opt.filter, offset = 51, dst = { {x = opt.bg_x + 15, y = opt.cs_y + opt.bg_y + 67, w = 54, h = 68} }}
      }
      for i, v in ipairs(parts_rank) do
         table.insert(parts_bg, v)
      end
   end

   local parts_title = {
      {id = -110, dst = { {x =0, y = 0, w = 1280, h = 40} }},
      {id = "title", filter = 1, dst = { {x =  640, y = 3, w = 1700, h = 28} }}
   }

   local parts_judge ={
      --スコア情報系
      --ベース
      {id = -110, blend = 1,  offsets ={52,60}, dst = { {x = opt.judge_x , y = opt.judge_y +40, w =320, h = 190, a = 152} }},
      --パーツ
      {id = "pt_PGREAT", filter = opt.filter, offset = 52, dst = { {x = opt.judge_x + 10, y = opt.judge_y + 204, w = 78, h = 17} }},
      {id = "pt_GREAT", filter = opt.filter, offset = 52, dst = { {x = opt.judge_x + 10, y = opt.judge_y + 178, w = 78, h = 17} }},
      {id = "pt_GOOD", filter = opt.filter, offset = 52, dst = { {x = opt.judge_x + 10, y = opt.judge_y + 152, w = 78, h = 17} }},
      {id = "pt_BAD", filter = opt.filter, offset = 52, dst = { {x = opt.judge_x + 10, y = opt.judge_y + 126, w = 78, h = 17} }},
      {id = "pt_POOR", filter = opt.filter, offset = 52, dst = { {x = opt.judge_x + 10, y = opt.judge_y + 100, w = 78, h = 17} }},
      {id = "pt_MISS",  filter = opt.filter, offset = 52, dst = { {x = opt.judge_x + 10, y = opt.judge_y + 74, w = 78, h = 17} }},
      {id = "pt_CB",  filter = opt.filter, offset = 52, dst = { {x = opt.judge_x + 10, y = opt.judge_y + 48, w = 78, h = 17} }},
      --記号系統
      {id = "pt_FAST",  op = {931},  filter = opt.filter, offset = 52, dst = { {x = opt.judge_x + 171, y =opt.judge_y + 204, w = 54, h = 17, r = 255, g = 0, b = 0} }},
      {id = "pt_SLOW",  op = {931},  filter = opt.filter, offset = 52, dst = { {x = opt.judge_x + 249, y =opt.judge_y + 204, w = 54, h = 17, r = 129, g = 159, b = 255} }},
      {id = "pt_SLASH", filter = opt.filter, offset = 52, dst = { {x = opt.judge_x + 154, y = opt.judge_y + 204, w = 12, h = 17} }},
      {id = "pt_SLASH", filter = opt.filter, offset = 52, dst = { {x = opt.judge_x + 154, y = opt.judge_y + 178, w = 12, h = 17} }},
      {id = "pt_SLASH", filter = opt.filter, offset = 52, dst = { {x = opt.judge_x + 154, y = opt.judge_y + 152, w = 12, h = 17} }},
      {id = "pt_SLASH", filter = opt.filter, offset = 52, dst = { {x = opt.judge_x + 154, y = opt.judge_y + 126, w = 12, h = 17} }},
      {id = "pt_SLASH", filter = opt.filter, offset = 52, dst = { {x = opt.judge_x + 154, y = opt.judge_y + 100, w = 12, h = 17} }},
      {id = "pt_SLASH", filter = opt.filter, offset = 52, dst = { {x = opt.judge_x + 154, y = opt.judge_y + 74, w = 12, h = 17} }},
      {id = "pt_SLASH", filter = opt.filter, offset = 52, dst = { {x = opt.judge_x + 154, y = opt.judge_y + 48, w = 12, h = 17} }},
      {id = "pt_SLASH", filter = opt.filter, offset = 52, dst = { {x = opt.judge_x + 232, y = opt.judge_y + 204, w = 12, h = 17} }},
      {id = "pt_SLASH", filter = opt.filter, offset = 52, dst = { {x = opt.judge_x + 232, y = opt.judge_y + 178, w = 12, h = 17} }},
      {id = "pt_SLASH", filter = opt.filter, offset = 52, dst = { {x = opt.judge_x + 232, y = opt.judge_y + 152, w = 12, h = 17} }},
      {id = "pt_SLASH", filter = opt.filter, offset = 52, dst = { {x = opt.judge_x + 232, y = opt.judge_y + 126, w = 12, h = 17} }},
      {id = "pt_SLASH", filter = opt.filter, offset = 52, dst = { {x = opt.judge_x + 232, y = opt.judge_y + 100, w = 12, h = 17} }},
      {id = "pt_SLASH", filter = opt.filter, offset = 52, dst = { {x = opt.judge_x + 232, y = opt.judge_y + 74, w = 12, h = 17} }},
      {id = "pt_SLASH", filter = opt.filter, offset = 52, dst = { {x = opt.judge_x + 232, y = opt.judge_y + 48, w = 12, h = 17} }},
      {id = "pt_PGREAT1", loop = 0, filter = opt.filter, offset = 52, dst = {
	  {time =  50 , x = opt.judge_x + 10, y =opt.judge_y + 204, w = 67, h = 17, r = 255, g = 190, b =190 },
	  {time = 100 , r = 190, g = 255, b =190 },
	  {time = 150 , r = 190, g = 190, b =255 }
      }},      
      --数値関連
      {id = "num_PGREAT", filter = opt.filter, offset = 52, dst = { {x = opt.judge_x + 93, y = opt.judge_y + 204, w = 14, h = 17} }},
      {id = "num_GREAT", filter = opt.filter, offset = 52, dst = { {x = opt.judge_x + 93, y = opt.judge_y + 178, w = 14, h = 17} }},
      {id = "num_GOOD", filter = opt.filter, offset = 52, dst = { {x = opt.judge_x + 93, y = opt.judge_y + 152, w = 14, h = 17} }},
      {id = "num_BAD", filter = opt.filter, offset = 52, dst = { {x = opt.judge_x + 93, y = opt.judge_y + 126, w = 14, h = 17} }},
      {id = "num_POOR",  filter = opt.filter, offset = 52, dst = { {x = opt.judge_x + 93, y = opt.judge_y + 100, w = 14, h = 17} }},
      {id = "num_MISS",  filter = opt.filter, offset = 52, dst = { {x = opt.judge_x + 93, y = opt.judge_y + 74, w = 14, h = 17} }},
      {id = "num_CB",  filter = opt.filter, offset = 52, dst = { {x = opt.judge_x + 93, y = opt.judge_y + 48, w = 14, h = 17} }},
      {id = "num_PGREAT_FAST", op = {930}, filter = opt.filter, offset = 52, dst = { {x = opt.judge_x + 171, y = opt.judge_y + 204, w = 14, h = 17, r = 255, g = 0, b = 0} }},
      {id = "num_GREAT_FAST", filter = opt.filter, offset = 52, dst = { {x = opt.judge_x + 171, y = opt.judge_y + 178, w = 14, h = 17, r = 255, g = 0, b = 0} }},
      {id = "num_GOOD_FAST", filter = opt.filter, offset = 52, dst = { {x = opt.judge_x + 171, y = opt.judge_y + 152, w = 14, h = 17, r = 255, g = 0, b = 0} }},
      {id = "num_BAD_FAST", filter = opt.filter, offset = 52, dst = { {x = opt.judge_x + 171, y = opt.judge_y + 126, w = 14, h = 17, r = 255, g = 0, b = 0} }},
      {id = "num_POOR_FAST", filter = opt.filter, offset = 52, dst = { {x = opt.judge_x + 171, y = opt.judge_y + 100, w = 14, h = 17, r = 255, g = 0, b = 0} }},
      {id = "num_MISS_FAST", filter = opt.filter, offset = 52, dst = { {x = opt.judge_x + 171, y = opt.judge_y + 74, w = 14, h = 17, r = 255, g = 0, b = 0} }},
      {id = "num_TOTAL_FAST",  filter = opt.filter, offset = 52, dst = { {x = opt.judge_x + 171, y = opt.judge_y + 48, w = 14, h = 17, r = 255, g = 0, b = 0} }},
      {id = "num_PGREAT_LATE", op = {930}, filter = opt.filter, offset = 52, dst = { {x = opt.judge_x + 249, y = opt.judge_y + 204, w = 14, h = 17, r = 129, g = 159, b = 255} }},
      {id = "num_GREAT_LATE", filter = opt.filter, offset = 52, dst = { {x = opt.judge_x + 249, y = opt.judge_y + 178, w = 14, h = 17, r = 129, g = 159, b = 255} }},
      {id = "num_GOOD_LATE", filter = opt.filter, offset = 52, dst = { {x = opt.judge_x + 249, y = opt.judge_y + 152, w = 14, h = 17, r = 129, g = 159, b = 255} }},
      {id = "num_BAD_LATE", filter = opt.filter, offset = 52, dst = { {x = opt.judge_x + 249, y = opt.judge_y + 126, w = 14, h = 17, r = 129, g = 159, b = 255} }},
      {id = "num_POOR_LATE", filter = opt.filter, offset = 52, dst = { {x = opt.judge_x + 249, y = opt.judge_y + 100, w = 14, h = 17, r = 129, g = 159, b = 255} }},
      {id = "num_MISS_LATE", filter = opt.filter, offset = 52, dst = { {x = opt.judge_x + 249, y = opt.judge_y + 74, w = 14, h = 17, r = 129, g = 159, b = 255} }},
      {id = "num_TOTAL_LATE", filter = opt.filter, offset = 52, dst = { {x = opt.judge_x + 249, y = opt.judge_y + 48, w = 14, h = 17, r = 129, g = 159, b = 255} }}
   }

   local parts_info = {
      --詳細情報系_
      {id = -110, blend = 1,  offsets = {60,53}, dst = { {x = opt.info_x , y = opt.info_y + 40, w =640, h = 190, a = 152} }},
      {id = "pt_SLASH", filter = opt.filter, offset = 53, dst = { {x = opt.info_x + 547, y = opt.info_y + 100, w = 12, h = 17} }},
      {id = "pt_PERCENT", filter = opt.filter, offset = 53, dst = { {x = opt.info_x + 519, y = opt.info_y + 152, w = 14, h = 17} }},
      {id = "bg_sub_R", filter = opt.filter, blend = 1, offset = 53, dst = { {x = opt.info_x + 30, y = opt.info_y + 42, w = 600, h =55} }},
      {id = "bg_sub_L", filter = opt.filter, blend = 1, offset = 53, dst = { {x = opt.info_x + 10, y = opt.info_y + 42, w = 122, h =55} }},
      {id = "pt_FOLDER", op = {1008}, filter = opt.filter, offset = 53, dst = { {x = opt.info_x - 35 , y = opt.info_y + 74, w = 147, h = 17} }},
      {id = "pt_GENRE", op = {-1008}, filter = opt.filter, offset = 53, dst = { {x = opt.info_x - 35, y = opt.info_y + 74, w = 147, h = 17} }},
      {id = "pt_ARTIST", filter = opt.filter, offset = 53, dst = { {x = opt.info_x - 35, y = opt.info_y + 48, w = 147, h = 17} }},
      {id = "folder", filter = 1, op = {1008}, offset = 53, dst = { {x = opt.info_x + 118, y = opt.info_y + 72, w = 224, h = 17} }},
      {id = "genre", filter = 1, op = {-1008}, offset = 53, dst = { {x = opt.info_x + 118, y = opt.info_y + 72, w = 224, h = 17} }},
      {id = "artist", filter = 1, offset = 53, dst = { {x = opt.info_x + 118, y = opt.info_y + 46, w = 224, h = 17} }},
      {id = "pt_MAX_COMBO", filter = opt.filter, offset = 53, dst = { {x = opt.info_x + 9, y =opt.info_y + 204, w = 159, h = 17} }},
      {id = "pt_EX_SCORE", filter = opt.filter, offset = 53, dst = { {x = opt.info_x + 9, y =opt.info_y + 178, w = 159, h = 17} }},
      {id = "pt_TARGET_SCORE", filter = opt.filter, offset = 53, dst = { {x = opt.info_x + 9, y = opt.info_y + 152, w = 159, h = 17} }},
      {id = "pt_BEST_SCORE", filter = opt.filter, offset = 53, dst = { {x = opt.info_x + 9, y = opt.info_y + 126, w = 159, h = 17} }},
      {id = "pt_MISS_COUNT", filter = opt.filter, offset = 53, dst = { {x = opt.info_x + 9, y =26 + opt.info_y + 74, w = 159, h = 17} }},
      {id = "num_MAX_COMBO", filter = opt.filter, offset = 53, dst = { {x = opt.info_x +173, y = opt.info_y + 204, w = 14, h = 17} }},
      {id = "num_EX_SCORE", filter = opt.filter, offset = 53, dst = { {x = opt.info_x + 173, y = opt.info_y + 178, w = 14, h = 17} }},
      {id = "num_TARGET_SCORE", filter = opt.filter, offset = 53, dst = { {x = opt.info_x + 173, y = opt.info_y + 152, w = 14, h = 17} }},
      {id = "num_TARGET_SCORE_dif", filter = opt.filter, offset = 53, dst = { {x = opt.info_x + 243, y = opt.info_y + 152, w = 14, h = 17} }},
      {id = "num_BEST_SCORE", filter = opt.filter, offset = 53, dst = { {x = opt.info_x + 173, y = opt.info_y + 126, w = 14, h = 17} }},
      {id = "num_BEST_SCORE_dif", filter = opt.filter, offset = 53, dst = { {x = opt.info_x + 243, y = opt.info_y + 126, w = 14, h = 17} }},
      {id = "num_MISS_COUNT", filter = opt.filter, offset = 53, dst = { {x = opt.info_x + 173, y = opt.info_y + 100, w = 14, h = 17} }},
      {id = "num_MISS_COUNT_dif", filter = opt.filter, offset = 53, dst = { {x = opt.info_x + 243, y = opt.info_y + 100, w = 14, h = 17} }},
      {id = "pt_SCORE", filter = opt.filter, offset = 53, dst = { {x = opt.info_x + 323, y =opt.info_y + 204, w = 147, h = 17} }},
      {id = "pt_TOTAL_NOTES", filter = opt.filter, offset = 53, dst = { {x = opt.info_x + 323, y =opt.info_y + 178, w = 147, h = 17} }},
      {id = "pt_SCORE_RATE", filter = opt.filter, offset = 53, dst = { {x = opt.info_x + 311, y = opt.info_y + 152, w = 159, h = 17} }},
      {id = "pt_NEXT_RANK", filter = opt.filter, offset = 53, dst = { {x = opt.info_x + 323, y = opt.info_y + 126, w = 147, h = 17} }},
      {id = "pt_IR", filter = opt.filter, offset = 53, dst = { {x = opt.info_x + 323, y =26 + opt.info_y + 74, w = 147, h = 17} }},
      {id = "num_SCORE", filter = opt.filter, offset = 53, dst = { {x =opt.info_x + 476, y = opt.info_y + 204, w = 14, h = 17} }},
      {id = "num_TOTAL_NOTES", filter = opt.filter, offset = 53, dst = { {x = opt.info_x + 476, y = opt.info_y + 178, w = 14, h = 17} }},
      {id = "num_SCORE_RATE", filter = opt.filter, offset = 53, dst = { {x = opt.info_x + 476, y = opt.info_y + 152, w = 14, h = 17} }},
      {id = "pt_RANK_MAX_s", op={300}, filter = opt.filter, offset = 53, dst = { {x = opt.info_x + 476, y = opt.info_y + 126, w = 45, h = 17} }},
      {id = "pt_RANK_AAA_s", op={301}, filter = opt.filter, offset = 53, dst = { {x = opt.info_x + 476, y = opt.info_y + 126, w = 45, h = 17} }},
      {id = "pt_RANK_AA_s", op={302}, filter = opt.filter, offset = 53, dst = { {x = opt.info_x + 490, y = opt.info_y + 126, w = 30, h = 17} }},
      {id = "pt_RANK_A_s", op={303}, filter = opt.filter, offset = 53, dst = { {x = opt.info_x + 504, y = opt.info_y + 126, w = 14, h = 17} }},
      {id = "pt_RANK_B_s", op={304}, filter = opt.filter, offset = 53, dst = { {x = opt.info_x + 504, y = opt.info_y + 126, w = 14, h = 17} }},
      {id = "pt_RANK_C_s", op={305}, filter = opt.filter, offset = 53, dst = { {x = opt.info_x + 504, y = opt.info_y + 126, w = 14, h = 17} }},
      {id = "pt_RANK_D_s", op={306}, filter = opt.filter, offset = 53, dst = { {x = opt.info_x + 504, y = opt.info_y + 126, w = 14, h = 17} }},
      {id = "pt_RANK_E_s", op={307}, filter = opt.filter, offset = 53, dst = { {x = opt.info_x + 504, y = opt.info_y + 126, w = 14, h = 17} }},
      {id = "num_NEXT_RANK", filter = opt.filter, offset = 53, dst = { {x = opt.info_x + 532, y = opt.info_y + 126 , w = 14, h = 17} }},
      {id = "num_IR_RANK", filter = opt.filter, offset = 53, dst = { {x = opt.info_x + 476, y = opt.info_y + 100, w = 14, h = 17} }},
      {id = "num_IR_TOTAL", filter = opt.filter, offset = 53, dst = { {x = opt.info_x + 560, y = opt.info_y + 100, w = 14, h = 17} }}
   }

   local parts_stagedata = {
      --ベース
      {id = -110, blend = 1, op = {191},  offsets = {60,54}, dst = { {x = 0 , y = 0, w =500, h = 340, a = 152} }},
      {id = -100, filter = 1, op = {191}, offset = 54, filter = 1,  dst = { {x = 10, y = 10, w =480, h = 320} }}
   }
   for i, v in ipairs(parts_bg) do
		table.insert(skin.destination, v)
   end
   for i, v in ipairs(parts_title) do
		table.insert(skin.destination, v)
   end
   for i, v in ipairs(parts_judge) do
		table.insert(skin.destination, v)
   end
   for i, v in ipairs(parts_info) do
		table.insert(skin.destination, v)
   end

   if is_stagefile() then
      for i, v in ipairs(parts_stagedata) do
         table.insert(skin.destination, v)
      end
   end
   parts_other = {
      {id = "pt_PGREAT2", loop = 0, filter = opt.filter, offset = 52,
      dst = { {x = opt.judge_x + 10, y =opt.judge_y + 204, w = 67, h = 17} },
      mouseRect = { x = -( opt.judge_x + 10), y = -(opt.judge_y + 204), w = 1280, h = 40 }
      }, 
      --[[ neta 
         {id = "judgegraph", loop = 100,  dst = {x = opt.bg_x, y = opt.cs_y + opt.infoside_y + 40, w = 233, h =190 - opt.cs_y}},
         mouseRect = { x = 0, y = opt.cs_y - 190, w = 233, h =190 - opt.cs_y}},
      --]]
      --フェードイン
      {id = -110, blend = 1, loop = 250, dst = {
         {time = 0,x = 0, y = 0, w = 1280, h = 720, a = 255},
         {time = 250, a = 0}
      }},
      --フェードアウト
      {id = -110, blend = 1, loop = 500, timer = 2, dst = {
         {time = 0,x = 0, y = 0, w = 1280, h = 720, a = 0},
         {time = 500, a = 255}
      }}
   }
   for i, v in ipairs(parts_other) do
		table.insert(skin.destination, v)
   end

   return skin
end

return{
   header = header,
   main = main
}
