FactoryBot.define do
  factory :user do
    nick_name {"タロウタナカ"}
    email     {Faker::Internet.free_email}
    password  {"h99999"}
    password_confirmation {password}
    last_name {"田中"}
    first_name {"太郎"}
    last_name_kana {"タナカ"}
    first_name_kana {"タロウ"}
    birth_date {"1960-01-01"}
  end
end