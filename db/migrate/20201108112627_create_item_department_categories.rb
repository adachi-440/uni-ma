class CreateItemDepartmentCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :item_department_categories, id: :integer, comment: 'ID', unsigned: true, force: :cascade do |t|
      t.integer :item_sub_category_id, null: false, comment: 'サブカテゴリーID', unsigned: true
      t.string :label, null: false, comment: '詳細学問名'
      t.integer :sort, null: false,  unsigned: true, comment: 'sort'

      t.index :item_sub_category_id, name: 'item_sub_category_idx'

      t.timestamps
    end
  end
end
