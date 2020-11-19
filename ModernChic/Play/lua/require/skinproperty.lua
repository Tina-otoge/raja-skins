local property = {
    version = "ModernChicPlay-1.3.2(SCURO)",
    width = 1920,
    height = 1080,
    loadend = 3500,     -- ロード開始からロード終了までの最低時間
    playstart = 1000,   -- ロード終了から曲開始までの時間 timer40で重要
    scene = 3600000,
    input = 0,          -- スキップ可能 timer1で重要
    close = 3000,       -- 閉店時の処理時間 timer3で重要
    fadeout = 500,      -- フェードアウト時にこの時間が過ぎると次のシーンへ timer2で重要
}

return property