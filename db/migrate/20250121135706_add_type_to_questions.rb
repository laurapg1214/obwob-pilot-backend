class AddTypeToQuestions < ActiveRecord::Migration[7.2]
  def change
    # default: 0 sets default to text
    add_column :questions, :type, :integer, default: 0, null: false
  end
end
