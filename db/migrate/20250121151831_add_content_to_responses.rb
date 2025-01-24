class AddContentToResponses < ActiveRecord::Migration[7.2]
  def change
    add_column :responses, :content, :string
  end
end
