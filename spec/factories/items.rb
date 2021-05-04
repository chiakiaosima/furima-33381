FactoryBot.define do
  factory :item do
    product_name {"ロンギヌスの槍"}
    description {"ATフィールドを貫く槍。アスカはこれでやられてしまった。"}
    category_id {2}
    status_id {2}
    subscriber_id {2}
    region_id {2}
    lead_time_id {2}
    price {"100000"}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
