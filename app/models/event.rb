class Event < ActiveRecord::Base
  belongs_to :user
  acts_as_votable
  acts_as_commentable
  
  validates_presence_of :name
  validates_presence_of :when
  validates_presence_of :user
end
