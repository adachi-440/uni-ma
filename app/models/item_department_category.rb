class ItemDepartmentCategory < ApplicationRecord
  belongs_to :sub_category, class_name: 'ItemSubCategory', optional: true, foreign_key: 'item_sub_category_id'

  has_one :item

  delegate :label, to: :sub_category, prefix: true, allow_nil: true
end
