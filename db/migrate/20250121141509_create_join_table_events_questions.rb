class CreateJoinTableEventsQuestions < ActiveRecord::Migration[7.2]
  def change
    create_join_table :events, :questions do |t|
      t.index :event_id
      t.index :question_id
    end
  end
end
