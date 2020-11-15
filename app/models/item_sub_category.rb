class ItemSubCategory < ApplicationRecord
  has_one :item
  has_many :department_categories, class_name: 'ItemDepartmentCategory'
  validates_associated :item
  validates_associated :department_categories

  validates :item, presence: true
  validates :department_categories, presence: true
end
