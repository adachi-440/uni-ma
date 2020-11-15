class CreateItemStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :item_statuses, id: :integer, comment: 'ID', unsigned: true, force: :cascade do |t|
      t.string :label, null: false, comment: '商品状態'

      t.timestamps
    end
  end
end
