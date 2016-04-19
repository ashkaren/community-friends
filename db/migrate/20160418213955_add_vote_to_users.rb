class AddVoteToUsers < ActiveRecord::Migration
  def change
    add_column :users, :vote, :integer, default: 0
  end
end
