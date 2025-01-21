class AddContentToQuestions < ActiveRecord::Migration[7.2]
  def change
    add_column :questions, :content, :string
  end
end
