FactoryBot.define do
  factory :user do
    nick_name {Faker::Name.initialsf(number: 6)}
    email     {Faker::Internet.free_email}
    password  {Faker::Internet.password(min_length: 8, mix_case: true)}
    password_confirmation {password}
    last_name {"田中"}
    first_name {"太郎"}
    last_name_kana {"タナカ"}
    first_name_kana {"タロウ"}
    birth_date {1960-01-01}
  end
end