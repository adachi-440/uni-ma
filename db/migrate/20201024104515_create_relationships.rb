class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships, id: :integer, comment: 'ID', unsigned: true, force: :cascade do |t|
      t.integer :follow_id, null: false, unsigned: true, comment: 'フォローID'
      t.integer :follower_id, null: false, unsigned: true, comment: 'フォロワーID'

      t.index :follow_id, name: 'follow_idx'
      t.index :follower_id, name: 'follower_idx'
      t.index [:follow_id, :follower_id], unique: true

      t.timestamps
    end
  end
end
