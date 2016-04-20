class AddColumnsToEvents < ActiveRecord::Migration
  def change
    add_column :events, :start_time, :datetime
    add_column :events, :address, :string
    add_column :events, :description, :text
  end
end
