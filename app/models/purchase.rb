class Purchase < ApplicationRecord

  belongs_to :user
  belonge_to :item
  has_one :address
end
