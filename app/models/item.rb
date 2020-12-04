class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category, class_name: 'ItemCategory', optional: true, foreign_key: 'item_category_id'
  belongs_to :department_category, class_name: 'ItemDepartmentCategory', optional: true, foreign_key: 'item_department_category_id'
  belongs_to :status, class_name: 'ItemStatus', optional: true, foreign_key: 'item_status_id'
  belongs_to :sold_status, class_name: 'ItemSoldStatus', optional: true

  has_many :images, class_name: 'ItemImage', dependent: :destroy
  has_many :tags, class_name: 'ItemTag', dependent: :destroy
  has_many :messages
  has_many :favorites

  has_one :lecture, dependent: :destroy

  accepts_nested_attributes_for :images, allow_destroy: true
  accepts_nested_attributes_for :tags, allow_destroy: true
  accepts_nested_attributes_for :lecture, allow_destroy: true
  validates_associated :images

  validates :name, presence: true, length: { maximum: 100 }
  validates :explanation, presence: true, length: { maximum: 1000 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :place, presence: true, length: { maximum: 100 }
  validates :images, presence: true

  delegate :name, to: :user, prefix: true
  delegate :label, to: :category, prefix: true
  delegate :label, to: :department_category, prefix: true
  delegate :label, to: :status, prefix: true

  def lecture?
    lecture.created_at.present?
  end
end
