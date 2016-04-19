class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :check_ownership, only: [:edit, :update]
  respond_to :html, :js

  def index
    @allusers = User.all
    @allusers.each do |user|
      user.point = 0
      user.posts.each do |post|
        user.point += post.cached_votes_up + post.comments_count
      end
      user.point += current_user.posts_count * 5
    end
    @user.point += current_user.posts_count * 5
    if params[:approved] == "false"
      @users = User.where("approved = ?", false).order("created_at DESC")
    else
      @users = User.where.not("id = ?",current_user.id).order("created_at DESC") 
    end
    if params[:vote] == "true"
      @users = User.where.not("id = ?",current_user.id).order("point DESC")
    end 
  end

  def show
    @user.point = 0
    @user.posts.each do |post|
      @user.point += post.cached_votes_up + post.comments_count
    end
    @user.point += current_user.posts_count * 5
    @user.update_column(:point, @user.point)
    @activities = PublicActivity::Activity.where(owner: @user).order(created_at: :desc).paginate(page: params[:page], per_page: 10)
    @hash = Gmaps4rails.build_markers(@user) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def deactivate
  end

  def approve_user
    user = User.find(params[:id])
    user.approved = true
    if user.save
      flash[:notice] = "#{user.name} has been approved"
    else
      flash[:alert] = "#{user.name} approval failure"
    end
    redirect_to :back
  end

  def friends
    @friends = @user.following_users.paginate(page: params[:page])
  end

  def followers
    @followers = @user.user_followers.paginate(page: params[:page])
  end

  private
  def user_params
    params.require(:user).permit(:name, :about, :avatar, :cover,
                                 :sex, :dob, :location, :phone_number)
  end

  def check_ownership
    redirect_to current_user, notice: 'Not Authorized' unless @user == current_user
  end

  def set_user
    @user = User.find(current_user)
  end
  def set_group
    @group = Group.find(params[:id])
  end
end
