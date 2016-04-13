class AddColumnsToMeeting < ActiveRecord::Migration
  def change
    add_column :meetings, :description, :text
    add_column :meetings, :image_url, :string
  end
end
