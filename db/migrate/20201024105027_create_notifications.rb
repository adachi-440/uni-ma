class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications, id: :integer, comment: 'ID', unsigned: true, force: :cascade do |t|
      t.string :title, null: false, comment: 'タイトル', limit: 255
      t.string :content, null: false, comment: '内容', limit: 3000

      t.timestamps
    end
  end
end
