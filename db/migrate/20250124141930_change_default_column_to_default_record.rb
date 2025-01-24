class ChangeDefaultColumnToDefaultRecord < ActiveRecord::Migration[8.0]
  def change
    rename_column :events, :default, :default_record
    rename_column :questions, :default, :default_record
    rename_column :responses, :default, :default_record
    rename_column :users, :default, :default_record
  end
end
