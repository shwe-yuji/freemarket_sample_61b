# categories
# 親階層
lady                         = Category.create(name: "レディース")
men                          = Category.create(name: "メンズ")
baby_kids                    = Category.create(name: "ベビー・キッズ")
interior_residence_accessory = Category.create(name: "インテリア・住まい・小物")
book_music_game              = Category.create(name: "本・音楽・ゲーム")
toy_hobby_goods              = Category.create(name: "おもちゃ・ホビー・グッズ")
cosme_perfume_beauty         = Category.create(name: "コスメ・香水・美容")
appliance_smartphone_camera  = Category.create(name: "家電・スマホ・カメラ")
sport_leisure                = Category.create(name: "スポーツ・レジャー")
handmade                     = Category.create(name: "ハンドメイド")
ticket                       = Category.create(name: "チケット")
car_motorcycle               = Category.create(name: "自動車・オートバイ")
others                       = Category.create(name: "その他")

# 子階層(レディース)
lady_1  = lady.children.create(name: "トップス")
lady_2  = lady.children.create(name: "ジャケット/アウター")
lady_3  = lady.children.create(name: "パンツ")
lady_4  = lady.children.create(name: "スカート")
lady_5  = lady.children.create(name: "ワンピース")
lady_6  = lady.children.create(name: "靴")
lady_7  = lady.children.create(name: "ルームウェア/パジャマ")
lady_8  = lady.children.create(name: "レッグウェア")
lady_9  = lady.children.create(name: "帽子")
lady_10 = lady.children.create(name: "バッグ")
lady_11 = lady.children.create(name: "アクセサリー")
lady_12 = lady.children.create(name: "ヘアアクセサリー")
lady_13 = lady.children.create(name: "小物")
lady_14 = lady.children.create(name: "時計")
lady_15 = lady.children.create(name: "ウィッグ/エクステ")
lady_16 = lady.children.create(name: "浴衣/水着")
lady_17 = lady.children.create(name: "スーツ/フォーマル/ドレス")
lady_18 = lady.children.create(name: "マタニティ")
lady_19 = lady.children.create(name: "その他")

# 孫階層_レディース
lady_1.children.create([{name: "Tシャツ/カットソー(半袖/袖なし)"},{name: "Tシャツ/カットソー(七分/長袖)"},{name: "シャツ/ブラウス(半袖/袖なし)"},{name: "シャツ/ブラウス(七分/長袖)"},{name: "ポロシャツ"},{name: "キャミソール"},{name: "タンクトップ"},{name: "ホルターネック"},{name: "ニット/セーター"},{name: "チュニック"},{name: "カーディガン/ボレロ"},{name: "アンサンブル"},{name: "ベスト/ジレ"},{name: "パーカー"},{name: "トレーナー/スウェット"},{name: "ベアトップ/チューブトップ"},{name: "ジャージ"},{name: "その他"}])
lady_2.children.create([{name: "テーラードジャケット"},{name: "ノーカラージャケット"},{name: "Gジャン/デニムジャケット"},{name: "レザージャケット"},{name: "ダウンジャケット"},{name: "ライダースジャケット"},{name: "ミリタリージャケット"},{name: "ダウンベスト"},{name: "ジャンパー/ブルゾン"},{name: "ポンチョ"},{name: "ロングコート"},{name: "トレンチコート"},{name: "ダッフルコート"},{name: "ピーコート"},{name: "チェスターコート"},{name: "モッズコート"},{name: "スタジャン"},{name: "毛皮/ファーコート"},{name: "スプリングコート"},{name: "スカジャン"},{name: "その他"}])
lady_3.children.create([{name: "デニム/ジーンズ"},{name: "ショートパンツ"},{name: "カジュアルパンツ"},{name: "ハーフパンツ"},{name: "チノパン"},{name: "ワークパンツ/カーゴパンツ"},{name: "クロップドパンツ"},{name: "サロペット/オーバーオール"},{name: "オールインワン"},{name: "サルエルパンツ"},{name: "ガウチョパンツ"},{name: "その他"}])
lady_4.children.create([{name: "ミニスカート"},{name: "ひざ丈スカート"},{name: "ロングスカート"},{name: "キュロット"},{name: "その他"}])
lady_5.children.create([{name: "ミニワンピース"},{name: "ひざ丈ワンピース"},{name: "ロングワンピース"},{name: "その他"}])
lady_6.children.create([{name: "ハイヒール/パンプス"},{name: "ブーツ"},{name: "サンダル"},{name: "スニーカー"},{name: "ミュール"},{name: "モカシン"},{name: "ローファー/革靴"},{name: "フラットシューズ/バレエシューズ"},{name: "長靴/レインシューズ"},{name: "その他"}])
lady_7.children.create([{name: "パジャマ"},{name: "ルームウェア"}])
lady_8.children.create([{name: "ソックス"},{name: "スパッツ/レギンス"},{name: "ストッキング/タイツ"},{name: "レッグウォーマー"},{name: "その他"}])
lady_9.children.create([{name: "ニットキャップ/ビーニー"},{name: "ハット"},{name: "ハンチング/ベレー帽"},{name: "キャップ"},{name: "キャスケット"},{name: "麦わら帽子"},{name: "その他"}])
lady_10.children.create([{name: "ハンドバッグ"},{name: "トートバッグ"},{name: "エコバッグ"},{name: "リュック/バックパック"},{name: "ボストンバッグ"},{name: "スポーツバッグ"},{name: "ショルダーバッグ"},{name: "クラッチバッグ"},{name: "ポーチ/バニティ"},{name: "ボディバッグ/ウェストバッグ"},{name: "マザーズバッグ"},{name: "メッセンジャーバッグ"},{name: "ビジネスバッグ"},{name: "旅行用バッグ/キャリーバッグ"},{name: "ショップ袋"},{name: "和装用バッグ"},{name: "かごバッグ"},{name: "その他"}])
lady_11.children.create([{name: "ネックレス"},{name: "ブレスレット"},{name: "バングル/リストバンド"},{name: "リング"},{name: "ピアス(片耳用)"},{name: "ピアス(両耳用)"},{name: "イヤリング"},{name: "アンクレット"},{name: "ブローチ/コサージュ"},{name: "チャーム"},{name: "その他"}])
lady_12.children.create([{name: "ヘアゴム/シュシュ"},{name: "ヘアバンド/カチューシャ"},{name: "ヘアピン"},{name: "その他"}])
lady_13.children.create([{name: "長財布"},{name: "折り財布"},{name: "コインケース/小銭入れ"},{name: "名刺入れ/定期入れ"},{name: "キーケース"},{name: "キーホルダー"},{name: "手袋/アームカバー"},{name: "ハンカチ"},{name: "ベルト"},{name: "マフラー/ショール"},{name: "ストール/スヌード"},{name: "バンダナ/スカーフ"},{name: "ネックウォーマー"},{name: "サスペンダー"},{name: "サングラス/メガネ"},{name: "モバイルケース/カバー"},{name: "手帳"},{name: "イヤマフラー"},{name: "傘"},{name: "レインコート/ポンチョ"},{name: "ミラー"},{name: "タバコグッズ"},{name: "その他"}])
lady_14.children.create([{name: "腕時計(アナログ)"},{name: "腕時計(デジタル)"},{name: "ラバーベルト"},{name: "レザーベルト"},{name: "金属ベルト"},{name: "その他"}])
lady_15.children.create([{name: "前髪ウィッグ"},{name: "ロングストレート"},{name: "ロングカール"},{name: "ショートストレート"},{name: "ショートカール"},{name: "その他"}])
lady_16.children.create([{name: "浴衣"},{name: "着物"},{name: "振袖"},{name: "長襦袢/半襦袢"},{name: "水着セパレート"},{name: "水着ワンピース"},{name: "水着スポーツ用"},{name: "その他"}])
lady_17.children.create([{name: "スカートスーツ上下"},{name: "パンツスーツ上下"},{name: "ドレス"},{name: "パーティーバッグ"},{name: "シューズ"},{name: "ウェディング"},{name: "その他"}])
lady_18.children.create([{name: "トップス"},{name: "アウター"},{name: "インナー"},{name: "ワンピース"},{name: "パンツ/スパッツ"},{name: "スカート"},{name: "パジャマ"},{name: "授乳服"},{name: "その他"}])
lady_19.children.create([{name: "コスプレ"},{name: "下着"},{name: "その他"}])

# users
users = [
  { nickname: "プロフリマー", email: "test@example.com", password: "12345678", firstname: Gimei.last.kanji, lastname: Gimei.first.kanji, firstname_kana: Gimei.last.katakana, lastname_kana: Gimei.first.katakana, birthdate: Faker::Date.between(from: 40.years.ago, to: Date.today), profile: "お金が大好きです。よろしくおねがいします。", image: "" },
  { nickname: "会社員", email: "test2@example.com", password: "12345678", firstname: Gimei.last.kanji, lastname: Gimei.first.kanji, firstname_kana: Gimei.last.katakana, lastname_kana: Gimei.first.katakana, birthdate: Faker::Date.between(from: 40.years.ago, to: Date.today), profile: "返品、クレーム受け付けます！", image: "" }
]
users.each do |record|
  User.create!(record) unless User.find_by(email: record[:email])
end

# destinations
2.times do |n|
  Destination.create(
    user_id: "#{n+1}",
    firstname: Gimei.last.kanji,
    lastname: Gimei.first.kanji,
    firstname_kana: Gimei.last.katakana,
    lastname_kana: Gimei.first.katakana,
    postal_code: Faker::Address.postcode,
    area_id: Faker::Number.within(range: 1..47),
    city: Gimei.city.kanji,
    street_address: Faker::Address.zip_code,
    building_name: "ロイヤルクレスト アーバンシティパーク #{Faker::Space.galaxy}",
    phone_number: Faker::PhoneNumber.cell_phone
  )
end

# brands
30.times do |n|
  Brand.create(
    name: Faker::Restaurant.type
  )
end

# products
products = [
  { user_id: 1, name: "おにぎり", description: "中古美品です。使用済みのためやや食べかけですが、ラップもしてあり賞味期限はまだ２日残っています。中古のためノークレームノーリターンでお願いします。", size_id: Faker::Number.within(range: 1..10), status_id: 1, condition_id: Faker::Number.within(range: 1..6), delivery_expense_id: 1, delivery_method_id: Faker::Number.within(range: 1..9), area_id: Faker::Number.within(range: 1..47), shipdate_id: Faker::Number.within(range: 1..3), price: Faker::Number.within(range: 300..60000), brand_id: Faker::Number.within(range: 1..30), category_id: Faker::Number.within(range: 1..211) },
  { user_id: 2, name: "手作りカットソー", description: "自分で作ったカットソーです。サイズはフリーサイズになります。", size_id: Faker::Number.within(range: 1..10), status_id: 1, condition_id: Faker::Number.within(range: 1..6), delivery_expense_id: 1, delivery_method_id: Faker::Number.within(range: 1..9), area_id: Faker::Number.within(range: 1..47), shipdate_id: Faker::Number.within(range: 1..3), price: Faker::Number.within(range: 300..60000), brand_id: Faker::Number.within(range: 1..30), category_id: Faker::Number.within(range: 1..211) }
]
products.each do |record|
  Product.create!(record) unless Product.find_by(name: record[:name])
end

# photos
Photo.create!(product_id: 1, photo: open("#{Rails.root}/db/fixtures/img1.png"))
Photo.create!(product_id: 2, photo: open("#{Rails.root}/db/fixtures/img2.png"))