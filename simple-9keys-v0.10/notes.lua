function img_notes_key_1p(var)

	local img = {}

	for i = 1, var do
		table.insert(img, {id = "note-" .. i, src = "src-notes-" .. i, x = 0, y = 0, w = 128, h = 40})							-- ノート
		table.insert(img, {id = "lns-" .. i, src = "src-notes-" .. i, x = 0, y = 80, w = 128, h = 40})							-- ロングノート始点
		table.insert(img, {id = "lne-" .. i, src = "src-notes-" .. i, x = 0, y = 40, w = 128, h = 40})							-- ロングノート終点
		table.insert(img, {id = "lnb-" .. i, src = "src-notes-" .. i, x = 0, y = 132, w = 128, h = 24, divy = 2, cycle = 266})	-- ロングノートアクティブ
		table.insert(img, {id = "lna-" .. i, src = "src-notes-" .. i, x = 0, y = 120, w = 128, h = 12})							-- ロングノート非アクティブ
		table.insert(img, {id = "hcns-" .. i, src = "src-notes-" .. i, x = 0, y = 196, w = 128, h = 40})						-- ヘルチャージノート始点
		table.insert(img, {id = "hcne-" .. i, src = "src-notes-" .. i, x = 0, y = 156, w = 128, h = 40})						-- ヘルチャージノート終点
		table.insert(img, {id = "hcnb-" .. i, src = "src-notes-" .. i, x = 0, y = 248, w = 128, h = 24, divy = 2, cycle = 266})	-- ヘルチャージノートアクティブ
		table.insert(img, {id = "hcna-" .. i, src = "src-notes-" .. i, x = 0, y = 236, w = 128, h = 12})						-- ヘルチャージノート非アクティブ
		table.insert(img, {id = "hcnd-" .. i, src = "src-notes-" .. i, x = 0, y = 272, w = 128, h = 24, divy = 2, cycle = 100})	-- ヘルチャージノートダメージ
		table.insert(img, {id = "hcnr-" .. i, src = "src-notes-" .. i, x = 0, y = 248, w = 128, h = 24, divy = 2, cycle = 266})	-- ヘルチャージノートリアクティブ
		table.insert(img, {id = "mine-" .. i, src = "src-notes-" .. i, x = 0, y = 296, w = 128, h = 40})						-- 地雷
	end

	return img
	
end

function img_notes_scratch_1p()

	local img = {}
	
	table.insert(img, {id = "note-s", src = "src-notes-s", x = 0, y = 0, w = 128, h = 40})							-- ノート
	table.insert(img, {id = "lns-s", src = "src-notes-s", x = 0, y = 80, w = 128, h = 40})							-- ロングノート始点
	table.insert(img, {id = "lne-s", src = "src-notes-s", x = 0, y = 40, w = 128, h = 40})							-- ロングノート終点
	table.insert(img, {id = "lnb-s", src = "src-notes-s", x = 0, y = 132, w = 128, h = 24, divy = 2, cycle = 266})	-- ロングノートアクティブ
	table.insert(img, {id = "lna-s", src = "src-notes-s", x = 0, y = 120, w = 128, h = 12})							-- ロングノート非アクティブ
	table.insert(img, {id = "hcns-s", src = "src-notes-s", x = 0, y = 196, w = 128, h = 40})						-- ヘルチャージノート始点
	table.insert(img, {id = "hcne-s", src = "src-notes-s", x = 0, y = 156, w = 128, h = 40})						-- ヘルチャージノート終点
	table.insert(img, {id = "hcnb-s", src = "src-notes-s", x = 0, y = 248, w = 128, h = 24, divy = 2, cycle = 266})	-- ヘルチャージノートアクティブ
	table.insert(img, {id = "hcna-s", src = "src-notes-s", x = 0, y = 236, w = 128, h = 12})						-- ヘルチャージノート非アクティブ
	table.insert(img, {id = "hcnd-s", src = "src-notes-s", x = 0, y = 272, w = 128, h = 24, divy = 2, cycle = 100})	-- ヘルチャージノートダメージ
	table.insert(img, {id = "hcnr-s", src = "src-notes-s", x = 0, y = 248, w = 128, h = 24, divy = 2, cycle = 266})	-- ヘルチャージノートリアクティブ
	table.insert(img, {id = "mine-s", src = "src-notes-s", x = 0, y = 296, w = 128, h = 40})						-- 地雷

	return img
	
end