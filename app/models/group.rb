class Group < ActiveRecord::Base
	has_many :posts
    has_and_belongs_to_many :users, :join_table => :groups_users
end
