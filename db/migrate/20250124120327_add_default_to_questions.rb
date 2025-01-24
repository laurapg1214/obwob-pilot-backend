class AddDefaultToQuestions < ActiveRecord::Migration[8.0]
  def change
    add_column :questions, :default, :boolean, default:false
  end
end
