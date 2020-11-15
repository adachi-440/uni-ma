class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages, id: :integer, comment: 'ID', unsigned: true, force: :cascade do |t|
      t.integer :item_id, null: false, comment: '商品ID', unsigned: true
      t.integer :user_id, null: false, comment: 'ユーザーID', unsigned: true
      t.string :content, null: false, comment: 'メッセージ内容', limit: 255

      t.index :item_id, name: 'item_idx'
      t.index :user_id, name: 'user_idx'
      t.timestamps
    end
  end
end
