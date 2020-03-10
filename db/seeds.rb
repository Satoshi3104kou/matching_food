japanese = Genre.create(name: "和食")
euro = Genre.create(name: "洋食")
chinese = Genre.create(name: "中華")
asia = Genre.create(name: "アジア・エスニック")


# 和食の子カテゴリ
japanese_izakaya = japanese.children.create(name: "居酒屋")
japanese_koryuri = japanese.children.create(name: "小料理屋")
japanese_ryoutei = japanese.children.create(name: "料亭")

# 和食の孫カテゴリ
japanese_izakaya.children.create([{name: "~3000円"}, {name: "~5000円"}, {name: "~8000円"}, {name: "10000円~"}])
japanese_koryuri.children.create([{name: "~5000円"}, {name: "~8000円"}, {name: "~10000円"}, {name: "15000円~"}])
japanese_ryoutei.children.create([{name: "~5000円"}, {name: "~10000円"}, {name: "~15000円"}, {name: "20000円~"}])

# 洋食の子カテゴリ
euro_bar = euro.children.create(name: "バル")
euro_bistro = euro.children.create(name: "ビストロ")
euro_restran = euro.children.create(name: "レストラン")
# 洋食の孫カテゴリ
euro_bar.children.create([{name: "~3000円"}, {name: "~5000円"}, {name: "~8000円"}, {name: "10000円~"}])
euro_bistro.children.create([{name: "~5000円"}, {name: "~8000円"}, {name: "~10000円"}, {name: "15000円~"}])
euro_restran.children.create([{name: "~5000円"}, {name: "~10000円"}, {name: "~15000円"}, {name: "20000円~"}])

# 中華の子カテゴリ
chinese_izakaya = chinese.children.create(name: "居酒屋")
chinese_machi = chinese.children.create(name: "街中華")
chinese_restran = chinese.children.create(name: "レストラン")
# 中華の孫カテゴリ
chinese_izakaya.children.create([{name: "~3000円"}, {name: "~5000円"}, {name: "~8000円"}, {name: "10000円~"}])
chinese_machi.children.create([{name: "~5000円"}, {name: "~8000円"}, {name: "~10000円"}, {name: "15000円~"}])
chinese_restran.children.create([{name: "~5000円"}, {name: "~10000円"}, {name: "~15000円"}, {name: "20000円~"}])

# アジアの子カテゴリ
asia_teisyoku = asia.children.create(name: "定食屋")
asia_izakaya = asia.children.create(name: "居酒屋")
asia_restran = asia.children.create(name: "レストラン")
# アジアの孫カテゴリ
asia_teisyoku.children.create([{name: "~1000円"}, {name: "~3000円"}, {name: "~5000円"}, {name: "10000円~"}])
asia_izakaya.children.create([{name: "~3000円"}, {name: "~5000円"}, {name: "~8000円"}, {name: "10000円~"}])
asia_restran.children.create([{name: "~5000円"}, {name: "~8000円"}, {name: "~10000円"}, {name: "15000円~"}])
