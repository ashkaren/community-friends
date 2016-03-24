class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :fname, :string, default: "", null: false
    add_column :users, :lname, :string, default: "", null: false
    add_column :users, :address, :string, default: "", null: false
    add_column :users, :role, :string, default: "regular", null: false
  end
end
