class User < ActiveRecord::Base
	has_many :posts, dependent: :destroy

	before_save { self.email = email.downcase }
	validates :name, presence: true, uniqueness: true

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	  validates :email, presence: true, 
	                    format: { with: VALID_EMAIL_REGEX },
	                    uniqueness: { case_sensitive: false }

  	validates :password, length: { minimum: 8 }, on: :create
  has_secure_password
end