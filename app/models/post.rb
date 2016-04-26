class Post < ActiveRecord::Base
  include Shared::Callbacks
  
  belongs_to :user
  belongs_to :group
  counter_culture :user
  acts_as_votable
  acts_as_commentable
  
  CATEGORY = ['General', 'Wanted', 'For Sale', 'News']
    
  VIEW = ['Public', 'Private']

  include PublicActivity::Model
  tracked only: [:create, :like], owner: Proc.new{ |controller, model| controller.current_user }, group_id: proc {|controller, model| controller && controller.group}, category: proc {|controller, model| controller && controller.categ}

  default_scope -> { order('created_at DESC') }

  mount_uploader :attachment, AvatarUploader

  validates_presence_of :content
  validates_presence_of :user
  

  auto_html_for :content do
    html_escape
    image
    youtube(width: 400, height: 250, autoplay: true)
    link target: '_blank', rel: 'nofollow'
    simple_format
  end

end