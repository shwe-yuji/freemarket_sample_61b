FactoryBot.define do
  factory :destination do
    user_id               {1}
    lastname              {"技術"}
    lastname_kana         {"てっく"}
    firstname             {"玄人"}
    firstname_kana        {"えきすぱーと"}
    postal_code           {"0000000"}
    area_id               {13}
    city                  {"渋谷区"}
    street_address        {"道玄坂"}
  end
end