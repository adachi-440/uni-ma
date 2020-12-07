class CreateLectureTerms < ActiveRecord::Migration[5.2]
  def change
    create_table :lecture_terms, id: :integer, comment: 'ID', unsigned: true, force: :cascade do |t|
      t.string :term, null: false, comment: '講義時期'

      t.timestamps
    end
  end
end
