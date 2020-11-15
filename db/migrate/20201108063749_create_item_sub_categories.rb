class CreateItemSubCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :item_sub_categories, id: :integer, comment: 'ID', unsigned: true, force: :cascade do |t|
      t.string :label, null: false, comment: '商品サブカテゴリー名'
      t.integer :sort, null: false,  unsigned: true, comment: 'sort'

      t.timestamps
    end
  end
end
