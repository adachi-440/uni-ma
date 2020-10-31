class CreateItemTags < ActiveRecord::Migration[5.2]
  def change
    create_table :item_tags, id: :integer, comment: 'ID', unsigned: true, force: :cascade do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
