class ItemSubCategory < ApplicationRecord
  belongs_to :item
  has_many :department_categories, class_name: 'ItemDepartmentCategory'
  validates_associated :department_categories

  validates :department_categories, presence: true
end
