class AddLeadToUsers < ActiveRecord::Migration
  def change
    add_column :users, :lead, :boolean, default: false
  end
end
