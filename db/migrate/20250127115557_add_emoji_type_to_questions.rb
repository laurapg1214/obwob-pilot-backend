class AddEmojiTypeToQuestions < ActiveRecord::Migration[8.0]
  def change
    add_column :questions, :emoji_type, :string
  end
end
