class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :address, :string, default: "", null: false
    add_column :users, :role, :string, default: "regular", null: false
    add_column :users, :sex, :string, default: "", null: false
    add_column :users, :posts_count, :interger, default: 0, null: false
  end
end
