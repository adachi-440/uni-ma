class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items, id: :integer, comment: 'ID', unsigned: true, force: :cascade do |t|
      t.integer :user_id, null: false, comment: 'ユーザーID', unsigned: true
      t.string  :name, null: false, comment: '商品名', limit: 255
      t.string  :explanation, null: true, comment: '商品説明', limit: 3000
      t.integer :item_image_id, null: false, comment: '商品画像ID', unsigned: true
      t.integer :item_category_id, null: false, comment: 'カテゴリーID', unsigned: true
      t.integer :item_tag_id, null: true, comment: 'タグID', unsigned: true
      t.integer :price, null: false, comment: '価格', unsigned: true
      t.integer :lecture_id, null: true, comment: '講義情報ID', unsigned: true
      t.integer :item_status_id, null: false, comment: '商品状態ID', unsigned: true
      t.string  :place, null: false, comment: '取引場所', limit: 255
      t.boolean :sold, null: false, comment: '購入状態フラグ', default: false
      t.integer :view, null: false, comment: '閲覧数', unsigned: true, default: 0

      t.index ['user_id'], name: 'user_idx'
      t.index ['item_category_id'], name: 'item_category_idx'
      t.index ['item_tag_id'], name: 'item_tag_idx'
      t.index ['lecture_id'], name: 'lecture_idx'
      t.index ['item_status_id'], name: 'item_status_idx'
      t.timestamps
    end
  end
end
