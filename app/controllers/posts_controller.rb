class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all  
  end

  def show
    @categories = ['Work', 'For sale', 'Events', 'News', 'Broadcasts']
    @comments = @post.comments.all
  end

  def create
    @categories = ['Work', 'For sale', 'Events','News', 'Broadcasts']
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to welcome_path
    else
      redirect_to welcome_path, notice: @post.errors.full_messages.first
    end
  end

  def edit
  end

  def update
    @categories = ['Work', 'For sale', 'Events', 'News', 'Broadcasts']
    @post.update(post_params)
    redirect_to @post
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to welcome_path }
    end
  end

  private
  def set_categories
    @categories = ['Work', 'For sale', 'Events', 'News', 'Broadcasts']
  end
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:content, :attachment, :category)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
