class ChangeColumnsAddNotnullOnUsers < ActiveRecord::Migration[5.2]
  def change
    change_column_null :users, :university, true
    change_column_null :users, :department, true
    change_column_null :users, :faculty, true
  end
end
