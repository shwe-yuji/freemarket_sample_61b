# 取引済みの商品100レコード
100.times do |n|
  Product.create(
    user_id: Faker::Number.within(range: 1..2),
    name: Faker::Name.product_name,
    description: Faker::Name.description,
    size_id: Faker::Number.within(range: 1..10),
    status_id: 4,
    condition_id: Faker::Number.within(range: 1..6),
    delivery_expense_id: Faker::Number.within(range: 1..2),
    delivery_method_id: Faker::Number.within(range: 1..9),
    area_id: Faker::Number.within(range: 1..47),
    shipdate_id: Faker::Number.within(range: 1..3),
    price: Faker::Number.within(range: 300..60000),
    brand_id: Faker::Number.within(range: 1..30),
    category_id: Faker::Number.within(range: 72..300)
  )
end

# 未取引の商品100レコード
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
    category_id: Faker::Number.within(range: 72..300)
  )
end