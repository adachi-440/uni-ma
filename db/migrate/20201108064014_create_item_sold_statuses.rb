class CreateItemSoldStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :item_sold_statuses, id: :integer, comment: 'ID', unsigned: true, force: :cascade do |t|
      t.string :label, null: false, comment: '購入状態'

      t.timestamps
    end
  end
end
