class ChangeTypeNullConstraintOnQuestions < ActiveRecord::Migration[7.2]
  def change
    change_column_null :questions, :type, true
  end
end
