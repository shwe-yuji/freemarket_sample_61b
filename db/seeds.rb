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
100.times do |n|
  Product.create(
    user_id: Faker::Number.within(range: 1..2),
    name: Faker::Name.product_name,
    description: Faker::Name.description,
    size_id: Faker::Number.within(range: 1..10),
    status_id: 1,
    condition_id: Faker::Number.within(range: 1..6),
    delivery_expense_id: Faker::Number.within(range: 1..2),
    delivery_method_id: Faker::Number.within(range: 1..9),
    area_id: Faker::Number.within(range: 1..47),
    shipdate_id: Faker::Number.within(range: 1..3),
    price: Faker::Number.within(range: 300..60000),
    brand_id: Faker::Number.within(range: 1..30),
    category_id: Faker::Number.within(range: 1..211)
  )
end

# photos
100.times do |n|
  Photo.create(
    product_id: Faker::Number.unique.within(range: 1..100),
    photo: open("#{Rails.root}/db/fixtures/img#{Faker::Number.within(range: 1..2)}.png")
  )
end

# transaction_records
60.times do |n|
  TransactionRecord.create(
    user_id: Faker::Number.within(range: 1..2),
    product_id: Faker::Number.unique.within(range: 1..60)
  )
end