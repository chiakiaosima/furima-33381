class AddressPurchase

  include ActiveModel::Model
  attr_accessor :postalcode, :region_id, :city, :street, :building_name,  :tel, :purchase, :item_id, :user_id #セーブさせる全てのカラム名を記述

  with_options presence: true do
    validates :postalcode, format: { with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Input full-width characters." }
    validates :city
    validates :street
    validates :tel, format: { with: /\A\d{10,11}\z/}
  end
  validates :region_id, numericality: { other_than: 1 }

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create!(postalcode: postalcode, region_id: region_id, city: city, street: street, building_name: building_name, tel: tel, purchase_id: purchase.id)

  end
end