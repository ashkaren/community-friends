class Meeting < ActiveRecord::Base
	 belongs_to :user
	  acts_as_votable
	  acts_as_commentable
	  geocoded_by :address
	  after_validation :geocode
	  mount_uploader :attachment, AvatarUploader
  
end
