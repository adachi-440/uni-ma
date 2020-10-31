class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :item_images, id: :integer, comment: 'ID', unsigned: true, force: :cascade do |t|
      t.string :file, null: false, comment: 'ファイル名'

      t.timestamps
    end
  end
end
