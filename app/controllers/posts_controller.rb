class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def show
    @comments = @post.comments.all
  end

  def create
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
    @post.update(post_params)
    redirect_to @post
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to welcome_path }
    end

    user.point = user.point-1
    user.update_attributes(:point => user.point)
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:content, :attachment)
  end
end
