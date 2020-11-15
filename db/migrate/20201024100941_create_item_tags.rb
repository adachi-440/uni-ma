class CreateItemTags < ActiveRecord::Migration[5.2]
  def change
    create_table :item_tags, id: :integer, comment: 'ID', unsigned: true, force: :cascade do |t|
      t.integer :item_id, null: false, unsigned: true, comment: '商品ID'
      t.string :name, null: false

      t.index :item_id, name: 'item_idx'

      t.timestamps
    end
  end
end
