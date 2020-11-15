class ItemCategory < ApplicationRecord
  has_one :item
  validates_associated :item

  validates :item, presence: true
end
