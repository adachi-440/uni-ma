class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites, id: :integer, comment: 'ID', unsigned: true, force: :cascade do |t|
      t.integer :user_id, null: false, comment: 'ユーザーID', unsigned: true
      t.integer :item_id, null: false, comment: '商品ID', unsigned: true
      t.index :user_id, name: 'user_idx'
      t.index :item_id, name: 'item_idx'
      t.index %i[user_id item_id], unique: true

      t.timestamps
    end
  end
end
