# 取引済み商品100レコード
100.times do |n|
  Photo.create(
    product_id: n + 1,
    photo:File.open("#{Rails.root}/db/fixtures/img#{Faker::Number.within(range: 1..2)}.png")
  )
  Photo.create(
    product_id: Faker::Number.within(range: 1..100),
    photo:File.open("#{Rails.root}/db/fixtures/img#{Faker::Number.within(range: 1..2)}.png")
  )
end

# 未取引商品100レコード
100.times do |n|
  Photo.create(
    product_id: n + 100,
    photo:File.open("#{Rails.root}/db/fixtures/img#{Faker::Number.within(range: 1..2)}.png")
  )
  Photo.create(
    product_id: Faker::Number.within(range: 101..200),
    photo:File.open("#{Rails.root}/db/fixtures/img#{Faker::Number.within(range: 1..2)}.png")
  )
  Photo.create(
    product_id: Faker::Number.within(range: 101..200),
    photo:File.open("#{Rails.root}/db/fixtures/img#{Faker::Number.within(range: 1..2)}.png")
  )
  Photo.create(
    product_id: Faker::Number.within(range: 101..200),
    photo:File.open("#{Rails.root}/db/fixtures/img#{Faker::Number.within(range: 1..2)}.png")
  )
  Photo.create(
    product_id: Faker::Number.within(range: 101..200),
    photo:File.open("#{Rails.root}/db/fixtures/img#{Faker::Number.within(range: 1..2)}.png")
  )
end
