class AddEmailToUsers < ActiveRecord::Migration
  def change
    add_column :users, :email, :email
  end
end
