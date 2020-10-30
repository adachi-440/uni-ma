class AddFileToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :file, :binary, null: true, comment: 'プロフィール画像'
  end
end
