require './db/seeds/category.rb'

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
require './db/seeds/products.rb'

# photos
require './db/seeds/photos.rb'

# transaction_records
100.times do |n|
  TransactionRecord.create(
    user_id: Faker::Number.within(range: 1..2),
    product_id: n + 1
  )
end