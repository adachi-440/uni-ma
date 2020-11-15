class ItemDepartmentCategory < ApplicationRecord
  belongs_to :sub_category, class_name: 'ItemSubCategory'

  has_one :item
end
