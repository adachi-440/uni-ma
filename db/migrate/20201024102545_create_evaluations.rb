class CreateEvaluations < ActiveRecord::Migration[5.2]
  def change
    create_table :evaluations, id: :integer, comment: 'ID', unsigned: true, force: :cascade do |t|
      t.integer :evaluator_id, null: false, unsigned: true, comment: '評価者ID'
      t.integer :evaluated_id, null: false, unsigned: true, comment: '被評価者ID'
      t.integer :rank, null: false, unsigned: true, comment: '評価'

      t.index %i[evaluator_id evaluated_id], unique: true

      t.timestamps
    end
  end
end
