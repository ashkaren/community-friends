class AddViewToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :view, :string
  end
end
