class AddQuestionIdToResponses < ActiveRecord::Migration[7.2]
  def change
    add_reference :responses, :question, null: false, foreign_key: true
  end
end
