class Event < ActiveRecord::Base
  include Shared::Callbacks
  belongs_to :user
  acts_as_votable
  acts_as_commentable

  include PublicActivity::Model
  tracked only: [:create, :like], owner: Proc.new{ |controller, model| controller.current_user }, group_id: proc {|controller, model| controller && controller.group}, view: proc {|controller, model| controller && controller.vi}

  validates_presence_of :name
  #validates_presence_of :when
  validates_presence_of :user
end