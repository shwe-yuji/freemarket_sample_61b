FactoryBot.define do
# :nickname, :firstname, :lastname, :firstname_kana, :lastname_kana, :birthdate 

  factory :user do
    nickname              {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    lastname              {"技術"}
    lastname_kana         {"てっく"}
    firstname             {"玄人"}
    firstname_kana        {"えきすぱーと"}
    birthdate             {"20200101"}
  end

end