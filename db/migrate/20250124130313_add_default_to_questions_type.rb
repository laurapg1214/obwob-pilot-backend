class AddDefaultToQuestionsType < ActiveRecord::Migration[8.0]
  def change
    change_column_default :questions, :type, 0
  end
end
