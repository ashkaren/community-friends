class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
<<<<<<< HEAD


  devise :database_authenticatable, :registerable,
=======
  devise :database_authenticatable, :registerable, :confirmable,
>>>>>>> origin/master
    :recoverable, :rememberable, :trackable, :validatable
  acts_as_voter
  acts_as_follower
  acts_as_followable

  has_many :posts
  has_many :comments
  has_many :events
  geocoded_by :address
  after_validation :geocode

  mount_uploader :avatar, AvatarUploader
  mount_uploader :cover, AvatarUploader

  validates_presence_of :name

  self.per_page = 10

end
