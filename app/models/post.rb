class Post < ActiveRecord::Base
  belongs_to :user
  acts_as_votable
  acts_as_commentable

  mount_uploader :attachment, AvatarUploader
  validates :attachment, allow_blank: true, format: {
	with:
	%r{\.(gif|jpg|png)\Z}i,
	message: 'must be a URL for GIF, JPG or PNG image.'
	}
end
