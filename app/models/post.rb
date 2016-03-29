class Post < ActiveRecord::Base
  belongs_to :user
  acts_as_votable
  acts_as_commentable
  
  include PublicActivity::Model
  tracked only: [:create, :like], owner: Proc.new{ |controller, model| model.user }

  mount_uploader :attachment, AvatarUploader
  validates :attachment, allow_blank: true, format: {
	with:
	%r{\.(gif|jpg|png)\Z}i,
	message: 'must be a URL for GIF, JPG or PNG image.'
	}
end
