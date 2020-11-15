class ItemTag < ApplicationRecord
  belongs_to :item

  validates :name, presence: true
end
