FactoryBot.define do
  factory :product do
    id                    { "1" }
    user_id               { "1" }
    name                  { "test商品" }
    description           { "test説明" }
    size_id               { "1" }
    status_id             { "1" }
    condition_id          { "1" }
    delivery_expense_id   { "1" }
    delivery_method_id    { "1" }
    area_id               { "1" }
    shipdate_id           { "1" }
    price                 { "1000" }
    brand_id              { "2" }
    category_id           { "60" }
    association :user
    association :category
    association :brand
  end
end