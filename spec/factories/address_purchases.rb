FactoryBot.define do
  factory :address_purchase do
    postalcode {"553-3434"}
    region_id {2}
    city {"第三新東京市"}
    street {"セントラルドグマ"}
    building_name {"ネルフ本部"}
    tel {"09012345678"}
    purchase
    user_id {1}
    item_id {1}
    token {"tok_aedkjaahgdjundjgsajdkgn"}
  end
end
