class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :product_name
    validates :category_id
    validates :price
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :subscriber
  belongs_to :region
  belongs_to :lead_time

  validates :category_id, numericality: { other_than: 1 }
  validates :status_id, numericality: { other_than: 1 }
  validates :subscriber_id, numericality: { other_than: 1 }
  validates :region_id, numericality: { other_than: 1 }
  validates :lead_time_id, numericality: { other_than: 1 }
end
