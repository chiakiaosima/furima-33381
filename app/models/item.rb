class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :product_name
    validates :description
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range" }
  end
  

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :subscriber
  belongs_to :region
  belongs_to :lead_time

  with_options numericality: { other_than: 1 } do
  validates :category_id
  validates :status_id
  validates :subscriber_id
  validates :region_id
  validates :lead_time_id
  end
end
