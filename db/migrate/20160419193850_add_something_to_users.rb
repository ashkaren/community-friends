class AddSomethingToUsers < ActiveRecord::Migration
  def change
  	add_reference :meetings, :user, index: true, foreign_key: true
  	add_column :users, :cached_votes_up, :integer, default: 0
  	add_column :users, :comments_count, :integer, default: 0
  end
end
