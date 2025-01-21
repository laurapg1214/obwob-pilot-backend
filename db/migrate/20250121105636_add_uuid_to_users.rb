class AddUuidToUsers < ActiveRecord::Migration[7.2]
  def change
    # similate UUID creation for SQLite
    add_column :users, :uuid, :string, null: false
    add_index :users, :uuid, unique: true
  end
end
