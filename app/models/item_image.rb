class ItemImage < ApplicationRecord
  belongs_to :item, optional: true
  mount_uploader :name, ImageUploader

  validates :name, presence: true
end
