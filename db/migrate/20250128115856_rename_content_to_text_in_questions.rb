class RenameContentToTextInQuestions < ActiveRecord::Migration[8.0]
  def change
    rename_column :questions, :content, :text
  end
end
