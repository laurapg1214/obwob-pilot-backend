class CreateJoinTableEventsUsers < ActiveRecord::Migration[7.2]
  def change
    create_join_table :events, :users do |t|
      t.index :event_id
      t.index :user_id
    end
  end
end
