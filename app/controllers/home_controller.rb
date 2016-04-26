class HomeController < ApplicationController
  before_action :set_user, except: :front
  respond_to :html, :js

  def index
    @allusers = User.all
    @allusers.each do |user|
      user.point = 0
      user.posts.each do |post|
        user.point += post.cached_votes_up + post.comments_count
      end
      user.point += user.posts_count * 5
      user.update_column(:point, user.point)
    end
    @posts = Post.all
    @users = User.where.not("id = ?",current_user.id).order("created_at DESC")
    @conversations = Conversation.involving(current_user).order("created_at DESC")  
    @post = Post.new
    @friends = @user.all_following.unshift(@user)
    if current_user.business?
      @activities = PublicActivity::Activity.where(owner: @user).order(created_at: :desc).paginate(page: params[:page], per_page: 10)
    else
      @activities = PublicActivity::Activity.where(:group_id => 0).where.not(:key => "post.like").where.not(:key => "event.like").where.not(:key => "comment.create").where(:view => "Public").order(created_at: :desc).paginate(page: params[:page], per_page: 10)
    end
    @wanted = PublicActivity::Activity.where(:category => "Wanted").order(created_at: :desc).paginate(page: params[:page], per_page: 10)
    @forsale = PublicActivity::Activity.where(:category => "For Sale").order(created_at: :desc).paginate(page: params[:page], per_page: 10)
    @events = PublicActivity::Activity.where(:key => "event.create").order(created_at: :desc).paginate(page: params[:page], per_page: 10)
    @news = PublicActivity::Activity.where(:category => "News").order(created_at: :desc).paginate(page: params[:page], per_page: 10)
    @business = PublicActivity::Activity.where(:group_id => -1).order(created_at: :desc).paginate(page: params[:page], per_page: 10)
    @broadcasts = PublicActivity::Activity.where(:category => "Broadcast").order(created_at: :desc).paginate(page: params[:page], per_page: 10)

  end

  def find_friends
    @friends = @user.all_following
    @users =  User.where.not(id: @friends.unshift(@user)).paginate(page: params[:page])
  end

  def promote
    user = User.find(params[:id])
    user.update_column(:lead, true)
    flash[:notice] = "#{user.name} was successfully promoted to lead"
    redirect_to users_path
  end
  def vote
    user = User.find(params[:id])
    user.vote += 1
    user.update_column(:vote, user.vote)
    flash[:notice] = "Thank for voting. You chose #{user.name}"
    redirect_to users_path
  end

  def company_view
  end

  private
  def set_user
    @user = current_user
  end

  def interlocutor(conversation)
    current_user == conversation.recipient ? conversation.sender : conversation.recipient
  end
end