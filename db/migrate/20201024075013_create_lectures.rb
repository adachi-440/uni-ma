class CreateLectures < ActiveRecord::Migration[5.2]
  def change
    create_table :lectures, id: :integer, comment: 'ID', unsigned: true, force: :cascade do |t|
      t.string :name, null: false, comment: '講義名', limit: 255
      t.string :teacher, null: true, comment: '教授名', limit: 255
      t.integer :lecture_term_id, null: true, comment: '講義時期ID', unsigned: true
      t.string :explanation, null: true, comment: '講義説明', limit: 1000

      t.index :lecture_term_id, name: 'lecture_term_idx'

      t.timestamps
    end
  end
end
