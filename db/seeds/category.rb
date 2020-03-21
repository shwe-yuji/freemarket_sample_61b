lady = Category.create(value: "レディース")
man = Category.create(value: "メンズ")
baby = Category.create(value: "ベビー・キッズ")
home = Category.create(value: "インテリア・住まい・小物")
book = Category.create(value: "本・音楽・ゲーム")
hobby = Category.create(value: "おもちゃ・ホビー・グッズ")
beauty = Category.create(value: "コスメ・香水・美容")
mech = Category.create(value: "家電・スマホ・カメラ")
sport = Category.create(value: "スポーツ・レジャー")
handmade = Category.create(value: "ハンドメイド")
ticket = Category.create(value: "チケット")
mobil = Category.create(value: "自動車・オートバイ")
other = Category.create(value: "その他")

# レディースの子カテゴリ
lady_tops = lady.children.create(value: "トップス")
lady_jacket = lady.children.create(value: "ジャケット/アウター")
lady_pants = lady.children.create(value: "パンツ")
lady_skirt = lady.children.create(value: "スカート")
lady_onepiece = lady.children.create(value: "ワンピース")
lady_other = lady.children.create(value: "その他")

# メンズの子カテゴリ
man_tops = man.children.create(value: "トップス")
man_jacket = man.children.create(value: "ジャケット/アウター")
man_pants = man.children.create(value: "パンツ")
man_suits = man.children.create(value: "スーツ")
man_other = man.children.create(value: "その他")

# ベビーの子カテゴリ
baby_girl = baby.children.create(value: "ベビー服(女の子用)")
baby_boy = baby.children.create(value: "ベビー服(男の子用)")
baby_item = baby.children.create(value: "子ども用ファッション小物")
baby_toilet = baby.children.create(value: "おむつ/トイレ/バス")
baby_other = baby.children.create(value: "その他")

# 家庭用品の子カテゴリ
home_kitchen = home.children.create(value: "キッチン/食器")
home_bed = home.children.create(value: "ベッド/マットレス")
home_sofa = home.children.create(value: "ソファ/ソファベッド")
home_chair = home.children.create(value: "椅子/チェア")
home_table = home.children.create(value: "机/テーブル")
home_other = home.children.create(value: "その他")

# 本の子カテゴリ
book_book = book.children.create(value: "本")
book_manga = book.children.create(value: "漫画")
book_cd = book.children.create(value: "CD")
book_game = book.children.create(value: "テレビゲーム")

# 趣味の子カテゴリ
hobby_toy = hobby.children.create(value: "おもちゃ")
hobby_card = hobby.children.create(value: "トレーディングカード")
hobby_figure = hobby.children.create(value: "フィギュア")
hobby_instrument = hobby.children.create(value: "楽器/器材")
hobby_other = hobby.children.create(value: "その他")

# 美容の子カテゴリ
beauty_base = beauty.children.create(value: "ベースメイク")
beauty_makeup = beauty.children.create(value: "メイクアップ")
beauty_other = beauty.children.create(value: "その他")

# 機械の子カテゴリ
mech_phone = mech.children.create(value: "スマートフォン/携帯電話")
mech_pc = mech.children.create(value: "PC/タブレット")
mech_camera = mech.children.create(value: "カメラ")
mech_other = mech.children.create(value: "その他")

# スポーツの子カテゴリ
sport_fishing = sport.children.create(value: "フィッシング")
sport_training = sport.children.create(value: "トレーニング/エクササイズ")
sport_soccer = sport.children.create(value: "サッカー/フットサル")
sport_other = sport.children.create(value: "その他")

# ハンドメイドの子カテゴリ
handmade_item = handmade.children.create(value: "ファッション/小物")
handmade_accessory = handmade.children.create(value: "アクセサリー/時計")
handmade_interior = handmade.children.create(value: "日用品/インテリア")
handmade_other = handmade.children.create(value: "その他")

# チケットの子カテゴリ
ticket_music = ticket.children.create(value: "音楽")
ticket_sport = ticket.children.create(value: "スポーツ")
ticket_show = ticket.children.create(value: "演劇/芸能")
ticket_other = ticket.children.create(value: "その他")

# 自動車の子カテゴリ
mobil_car = mobil.children.create(value: "自動車本体")
mobil_carpart = mobil.children.create(value: "自動車アクセサリー")
mobil_bike = mobil.children.create(value: "オートバイ車体")
mobil_other = mobil.children.create(value: "その他")

# その他の子カテゴリ
other_matome = other.children.create(value: "まとめ売り")
other_food = other.children.create(value: "食品")
other_drink = other.children.create(value: "飲料/酒")
other_other = other.children.create(value: "その他")


# レディースの孫カテゴリ
lady_tops.children.create([{value: "Tシャツ/カットソー(半袖/袖なし)"}, {value: "Tシャツ/カットソー(七分/長袖)"}, {value: "シャツ/ブラウス(半袖/袖なし)"}, {value: "シャツ/ブラウス(七分/長袖)"}, {value: "ポロシャツ"}, {value: "キャミソール"}, {value: "タンクトップ"}, {value: "ホルターネック"}, {value: "ニット/セーター"}, {value: "チュニック"}, {value: "カーディガン/ボレロ"}, {value: "アンサンブル"}, {value: "ベスト/ジレ"}, {value: "パーカー"}, {value: "トレーナー/スウェット"}, {value: "ベアトップ/チューブトップ"}, {value: "ジャージ"}, {value: "その他"}])
lady_jacket.children.create([{value: "テーラードジャケット"}, {value: "ノーカラージャケット"}, {value: "Gジャン/デニムジャケット"}, {value: "レザージャケット"}, {value: "ダウンジャケット"}, {value: "ライダースジャケット"}, {value: "ミリタリージャケット"}, {value: "ダウンベスト"}, {value: "ジャンパー/ブルゾン"}, {value: "ポンチョ"}, {value: "ロングコート"}, {value: "トレンチコート"}, {value: "ダッフルコート"}, {value: "ピーコート"}, {value: "チェスターコート"}, {value: "モッズコート"}, {value: "スタジャン"}, {value: "毛皮/ファーコート"}, {value: "スプリングコート"}, {value: "スカジャン"}, {value: "その他"}])
lady_pants.children.create([{value: "デニム/ジーンズ"}, {value: "ショートパンツ"}, {value: "カジュアルパンツ"}, {value: "ハーフパンツ"}, {value: "チノパン"}, {value: "ワークパンツ/カーゴパンツ"}, {value: "クロップドパンツ"}, {value: "サロペット/オーバーオール"}, {value: "オールインワン"}, {value: "サルエルパンツ"}, {value: "ガウチョパンツ"}, {value: "その他"}])
lady_skirt.children.create([{value: "ミニスカート"}, {value: "ひざ丈スカート"}, {value: "ロングスカート"}, {value: "キュロット"}, {value: "その他"}])
lady_onepiece.children.create([{value: "ミニワンピース"}, {value: "ひざ丈ワンピース"}, {value: "ロングワンピース"}, {value: "その他"}])
lady_other.children.create([{value: "スカートスーツ上下"}, {value: "パンツスーツ上下"}, {value: "ドレス"}, {value: "パーティーバッグ"}, {value: "シューズ"}, {value: "ウェディング"}])


# メンズの孫カテゴリ
man_tops.children.create([{value: "トップス"}, {value: "アウター"}, {value: "パンツ"}, {value: "おくるみ"}, {value: "下着/肌着"}, {value: "パジャマ"}, {value: "ロンパース"}, {value: "その他"}])
man_jacket.children.create([{value: "コート"}, {value: "ジャケット/上着"}, {value: "トップス(Tシャツ/カットソー)"}, {value: "トップス(トレーナー)"}, {value: "トップス(チュニック)"}, {value: "トップス(タンクトップ)"}, {value: "トップス(その他)"}])
man_pants.children.create([{value: "デニム/ジーンズ"}, {value: "ショートパンツ"}, {value: "カジュアルパンツ"}, {value: "ハーフパンツ"}, {value: "チノパン"}, {value: "ワークパンツ/カーゴパンツ"}, {value: "クロップドパンツ"}, {value: "サロペット/オーバーオール"}, {value: "オールインワン"}, {value: "サルエルパンツ"}, {value: "ガウチョパンツ"}, {value: "その他"}])
man_suits.children.create([{value: "パンツ"}, {value: "セットアップ"}, {value: "パジャマ"}, {value: "フォーマル/ドレス"}, {value: "和服"}, {value: "浴衣"}, {value: "甚平"}, {value: "水着"}, {value: "その他"}])
man_other.children.create([{value: "スニーカー"}, {value: "サンダル"}, {value: "ブーツ"}, {value: "長靴"}, {value: "靴下/スパッツ"}, {value: "帽子"}, {value: "エプロン"}, {value: "サスペンダー"}, {value: "タイツ"}, {value: "ハンカチ"}, {value: "バンダナ"}, {value: "ベルト"}, {value: "マフラー"}, {value: "傘"}, {value: "手袋"}, {value: "スタイ"}, {value: "バッグ"}, {value: "その他"}])


# ベビーの孫カテゴリ
baby_girl.children.create([{value: "コート"}, {value: "ジャケット/上着"}, {value: "トップス(Tシャツ/カットソー)"}, {value: "トップス(トレーナー)"}, {value: "トップス(その他)"}, {value: "ボトムス"}, {value: "パジャマ"}, {value: "その他"}])
baby_boy.children.create([{value: "コート"}, {value: "ジャケット/上着"}, {value: "トップス(Tシャツ/カットソー)"}, {value: "トップス(トレーナー)"}, {value: "トップス(その他)"}, {value: "ボトムス"}, {value: "パジャマ"}, {value: "その他"}])
baby_item.children.create([{value: "おふろのおもちゃ"}, {value: "がらがら"}, {value: "オルゴール"}, {value: "ベビージム"}, {value: "手押し車/カタカタ"}, {value: "知育玩具"}, {value: "その他"}])
baby_toilet.children.create([{value: "おむつ用品"}, {value: "おまる/補助便座"}, {value: "トレーニングパンツ"}, {value: "ベビーバス"}, {value: "お風呂用品"}, {value: "その他"}])
baby_other.children.create([{value: "お宮参り用品"}, {value: "お食い初め用品"}, {value: "アルバム"}, {value: "手形/足形"}, {value: "その他"}])


# 家庭用品の孫カテゴリ
home_kitchen.children.create([{value: "食器"}, {value: "調理器具"}, {value: "収納/キッチン雑貨"}, {value: "弁当用品"}, {value: "カトラリー(スプーン等)"}, {value: "テーブル用品"}, {value: "容器"}, {value: "エプロン"}, {value: "アルコールグッズ"}, {value: "浄水機"}, {value: "その他"}])
home_bed.children.create([{value: "セミシングルベッド"}, {value: "シングルベッド"}, {value: "セミダブルベッド"}, {value: "ダブルベッド"}, {value: "ワイドダブルベッド"}, {value: "クイーンベッド"}, {value: "キングベッド"}, {value: "脚付きマットレスベッド"}, {value: "マットレス"}, {value: "すのこベッド"}, {value: "ロフトベッド/システムベッド"}, {value: "簡易ベッド/折りたたみベッド"}, {value: "収納付き"}, {value: "その他"}])
home_sofa.children.create([{value: "ソファセット"}, {value: "シングルソファ"}, {value: "ラブソファ"}, {value: "トリプルソファ"}, {value: "オットマン"}, {value: "コーナーソファ"}, {value: "ビーズソファ/クッションソファ"}, {value: "ローソファ/フロアソファ"}, {value: "ソファベッド"}, {value: "応接セット"}, {value: "ソファカバー"}, {value: "リクライニングソファ"}, {value: "その他"}])
home_chair.children.create([{value: "一般"}, {value: "スツール"}, {value: "ダイニングチェア"}, {value: "ハイバックチェア"}, {value: "ロッキングチェア"}, {value: "座椅子"}, {value: "折り畳みイス"}, {value: "デスクチェア"}, {value: "その他"}])
home_table.children.create([{value: "こたつ"}, {value: "カウンターテーブル"}, {value: "サイドテーブル"}, {value: "センターテーブル"}, {value: "ダイニングテーブル"}, {value: "座卓/ちゃぶ台"}, {value: "アウトドア用"}, {value: "パソコン用"}, {value: "事務机/学習机"}, {value: "その他"}])
home_other.children.create([{value: "正月"}, {value: "成人式"}, {value: "バレンタインデー"}, {value: "ひな祭り"}, {value: "子どもの日"}, {value: "母の日"}, {value: "父の日"}, {value: "サマーギフト/お中元"}, {value: "夏/夏休み"}, {value: "ハロウィン"}, {value: "敬老の日"}, {value: "七五三"}, {value: "お歳暮"}, {value: "クリスマス"}, {value: "冬一般"}, {value: "その他"}])


# 本の孫カテゴリ
book_book.children.create([{value: "文学/小説"}, {value: "人文/社会"}, {value: "ノンフィクション/教養"}, {value: "地図/旅行ガイド"}, {value: "ビジネス/経済"}, {value: "健康/医学"}, {value: "コンピュータ/IT"}, {value: "趣味/スポーツ/実用"}, {value: "住まい/暮らし/子育て"}, {value: "アート/エンタメ"}, {value: "洋書"}, {value: "絵本"}, {value: "参考書"}, {value: "その他"}])
book_manga.children.create([{value: "全巻セット"}, {value: "少年漫画"}, {value: "少女漫画"}, {value: "青年漫画"}, {value: "女性漫画"}, {value: "同人誌"}, {value: "その他"}])
book_cd.children.create([{value: "邦楽"}, {value: "洋楽"}, {value: "アニメ"}, {value: "クラシック"}, {value: "K-POP/アジア"}, {value: "キッズ/ファミリー"}, {value: "その他"}])
book_game.children.create([{value: "家庭用ゲーム本体"}, {value: "家庭用ゲームソフト"}, {value: "携帯用ゲーム本体"}, {value: "携帯用ゲームソフト"}, {value: "PCゲーム"}, {value: "その他"}])


# 趣味の孫カテゴリ
hobby_toy.children.create([{value: "キャラクターグッズ"}, {value: "ぬいぐるみ"}, {value: "小物/アクセサリー"}, {value: "模型/プラモデル"}, {value: "ミニカー"}, {value: "トイラジコン"}, {value: "プラモデル"}, {value: "ホビーラジコン"}, {value: "鉄道模型"}, {value: "その他"}])
hobby_card.children.create([{value: "遊戯王"}, {value: "マジック：ザ・ギャザリング"}, {value: "ポケモンカードゲーム"}, {value: "デュエルマスターズ"}, {value: "バトルスピリッツ"}, {value: "プリパラ"}, {value: "アイカツ"}, {value: "カードファイト!!ヴァンガード"}, {value: "ヴァイスシュヴァルツ"}, {value: "プロ野球オーナーズリーグ"}, {value: "ベースボールヒーローズ"}, {value: "ドラゴンボール"}, {value: "スリーブ"}, {value: "その他"}])
hobby_figure.children.create([{value: "コミック/アニメ"}, {value: "特撮"}, {value: "ゲームキャラクター"}, {value: "SF/ファンタジー/ホラー"}, {value: "アメコミ"}, {value: "スポーツ"}, {value: "ミリタリー"}, {value: "その他"}])
hobby_instrument.children.create([{value: "エレキギター"}, {value: "アコースティックギター"}, {value: "ベース"}, {value: "エフェクター"}, {value: "アンプ"}, {value: "弦楽器"}, {value: "管楽器"}, {value: "鍵盤楽器"}, {value: "打楽器"}, {value: "和楽器"}, {value: "楽譜/スコア"}, {value: "レコーディング/PA機器"}, {value: "DJ機器"}, {value: "DTM/DAW"}, {value: "その他"}])
hobby_other.children.create([{value: "トランプ/UNO"}, {value: "カルタ/百人一首"}, {value: "ダーツ"}, {value: "ビリヤード"}, {value: "麻雀"}, {value: "パズル/ジグソーパズル"}, {value: "囲碁/将棋"}, {value: "オセロ/チェス"}, {value: "人生ゲーム"}, {value: "野球/サッカーゲーム"}, {value: "スポーツ"}, {value: "三輪車/乗り物"}, {value: "ヨーヨー"}, {value: "模型製作用品"}, {value: "鉄道"}, {value: "航空機"}, {value: "アマチュア無線"}, {value: "パチンコ/パチスロ"}, {value: "その他"}])


# 美容の孫カテゴリ
beauty_base.children.create([{value: "ファンデーション"}, {value: "化粧下地"}, {value: "コントロールカラー"}, {value: "BBクリーム"}, {value: "CCクリーム"}, {value: "コンシーラー"}, {value: "フェイスパウダー"}, {value: "トライアルセット/サンプル"}, {value: "その他"}])
beauty_makeup.children.create([{value: "アイシャドウ"}, {value: "口紅"}, {value: "リップグロス"}, {value: "リップライナー"}, {value: "チーク"}, {value: "フェイスカラー"}, {value: "マスカラ"}, {value: "アイライナー"}, {value: "つけまつげ"}, {value: "アイブロウペンシル"}, {value: "パウダーアイブロウ"}, {value: "眉マスカラ"}, {value: "トライアルセット/サンプル"}, {value: "メイク道具/化粧小物"}, {value: "美顔用品/美顔ローラー"}, {value: "その他"}])
beauty_other.children.create([{value: "健康用品"}, {value: "看護/介護用品"}, {value: "救急/衛生用品"}, {value: "その他"}])


# 機械の孫カテゴリ
mech_phone.children.create([{value: "スマートフォン本体"}, {value: "バッテリー/充電器"}, {value: "携帯電話本体"}, {value: "PHS本体"}, {value: "その他"}])
mech_pc.children.create([{value: "タブレット"}, {value: "ノートPC"}, {value: "デスクトップ型PC"}, {value: "ディスプレイ"}, {value: "電子ブックリーダー"}, {value: "PC周辺機器"}, {value: "PCパーツ"}, {value: "その他"}])
mech_camera.children.create([{value: "デジタルカメラ"}, {value: "ビデオカメラ"}, {value: "レンズ(単焦点)"}, {value: "レンズ(ズーム)"}, {value: "フィルムカメラ"}, {value: "防犯カメラ"}, {value: "その他"}])
mech_other.children.create([{value: "ポータブルプレーヤー"}, {value: "イヤフォン"}, {value: "ヘッドフォン"}, {value: "アンプ"}, {value: "スピーカー"}, {value: "ケーブル/シールド"}, {value: "ラジオ"}, {value: "その他"}])


# スポーツの孫カテゴリ
sport_fishing.children.create([{value: "ロッド"}, {value: "リール"}, {value: "ルアー用品"}, {value: "ウエア"}, {value: "釣り糸/ライン"}, {value: "その他"}])
sport_training.children.create([{value: "ランニング"}, {value: "ウォーキング"}, {value: "ヨガ"}, {value: "トレーニング用品"}, {value: "その他"}])
sport_soccer.children.create([{value: "ウェア"}, {value: "シューズ"}, {value: "ボール"}, {value: "アクセサリー"}, {value: "記念グッズ"}, {value: "応援グッズ"}, {value: "その他"}])
sport_other.children.create([{value: "ダンス/バレエ"}, {value: "サーフィン"}, {value: "バスケットボール"}, {value: "バドミントン"}, {value: "バレーボール"}, {value: "スケートボード"}, {value: "陸上競技"}, {value: "ラグビー"}, {value: "アメリカンフットボール"}, {value: "ボクシング"}, {value: "ボウリング"}, {value: "その他"}])


# ハンドメイドの孫カテゴリ
handmade_item.children.create([{value: "ピアス"}, {value: "イヤリング"}, {value: "ネックレス"}, {value: "ブレスレット"}, {value: "リング"}, {value: "チャーム"}, {value: "ヘアゴム"}, {value: "アンクレット"}, {value: "その他"}])
handmade_accessory.children.create([{value: "アクセサリー(男性用)"}, {value: "時計(女性用)"}, {value: "時計(男性用)"}, {value: "その他"}])
handmade_interior.children.create([{value: "クラフト/布製品"}, {value: "おもちゃ/人形"}, {value: "その他"}])
handmade_other.children.create([{value: "バッグ(女性用)"}, {value: "バッグ(男性用)"}, {value: "財布(女性用)"}, {value: "財布(男性用)"}, {value: "ファッション雑貨"}, {value: "その他"}])


# チケットの孫カテゴリ
ticket_music.children.create([{value: "男性アイドル"}, {value: "女性アイドル"}, {value: "韓流"}, {value: "国内アーティスト"}, {value: "海外アーティスト"}, {value: "音楽フェス"}, {value: "声優/アニメ"}, {value: "その他"}])
ticket_sport.children.create([{value: "サッカー"}, {value: "野球"}, {value: "テニス"}, {value: "格闘技/プロレス"}, {value: "相撲/武道"}, {value: "ゴルフ"}, {value: "バレーボール"}, {value: "バスケットボール"}, {value: "モータースポーツ"}, {value: "ウィンタースポーツ"}, {value: "その他"}])
ticket_show.children.create([{value: "ミュージカル"}, {value: "演劇"}, {value: "伝統芸能"}, {value: "落語"}, {value: "お笑い"}, {value: "オペラ"}, {value: "サーカス"}, {value: "バレエ"}, {value: "その他"}])
ticket_other.children.create([{value: "ショッピング"}, {value: "レストラン/食事券"}, {value: "フード/ドリンク券"}, {value: "宿泊券"}, {value: "その他"}])


# 自動車の孫カテゴリ
mobil_car.children.create([{value: "国内自動車本体"}, {value: "外国自動車本体"}, {value: "タイヤ/ホイールセット"}, {value: "タイヤ"}, {value: "ホイール"}, {value: "その他"}])
mobil_carpart.children.create([{value: "車内アクセサリー"}, {value: "カーナビ"}, {value: "カーオーディオ"}, {value: "車外アクセサリー"}, {value: "メンテナンス用品"}, {value: "チャイルドシート"}, {value: "ドライブレコーダー"}, {value: "レーダー探知機"}, {value: "カタログ/マニュアル"}, {value: "セキュリティ"}, {value: "ETC"}, {value: "その他"}])
mobil_bike.children.create([{value: "国内車本体"}, {value: "外国車本体"}, {value: "タイヤ"}, {value: "マフラー"}, {value: "エンジン、冷却装置"}, {value: "外国オートバイ用パーツ"}, {value: "その他"}])
mobil_other.children.create([{value: "ヘルメット/シールド"}, {value: "バイクウエア/装備"}, {value: "アクセサリー"}, {value: "メンテナンス"}, {value: "カタログ/マニュアル"}, {value: "その他"}])


# その他の孫カテゴリ
other_matome.children.create([{value: "ペットフード"}, {value: "犬用品"}, {value: "猫用品"}, {value: "魚用品/水草"}, {value: "小動物用品"}, {value: "爬虫類/両生類用品"}, {value: "かご/おり"}, {value: "鳥用品"}, {value: "虫類用品"}, {value: "その他"}])
other_food.children.create([{value: "菓子"}, {value: "米"}, {value: "野菜"}, {value: "果物"}, {value: "調味料"}, {value: "魚介類(加工食品)"}, {value: "肉類(加工食品)"}, {value: "その他 加工食品"}, {value: "その他"}])
other_drink.children.create([{value: "コーヒー"}, {value: "ソフトドリンク"}, {value: "ミネラルウォーター"}, {value: "茶"}, {value: "ウイスキー"}, {value: "ワイン"}, {value: "ブランデー"}, {value: "焼酎"}, {value: "日本酒"}, {value: "ビール、発泡酒"}, {value: "その他"}])
other_other.children.create([{value: "オフィス用品一般"}, {value: "オフィス家具"}, {value: "店舗用品"}, {value: "OA機器"}, {value: "ラッピング/包装"}, {value: "その他"}])