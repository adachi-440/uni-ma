class ItemStatus < ApplicationRecord
  has_one :item

  validates_associated :item

  validates :item, presence: true
  validates :label, presence: true
end
