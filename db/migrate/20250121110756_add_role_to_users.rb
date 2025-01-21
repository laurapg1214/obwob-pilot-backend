class AddRoleToUsers < ActiveRecord::Migration[7.2]
  def change
    # default: 0 sets default to participant
    add_column :users, :role, :integer, default: 0, null: false
  end
end
