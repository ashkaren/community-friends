class AddGroupToEvents < ActiveRecord::Migration
  def change
    add_column :events, :group_id, :string
  end
end
