class AddDetailsToEvents < ActiveRecord::Migration[7.2]
  def change
    add_column :events, :name, :string
    add_column :events, :date, :date
    add_column :events, :time, :time
  end
end
