class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_commentable, only: :create
  respond_to :js

  def create
    @comment = @commentable.comments.new do |comment|
      comment.comment = params[:comment_text]
      comment.user = current_user
    end
    @comment.save
    redirect_to welcome_path
  end

  def destroy
    @comment = current_user.comments.find(params[:id])
    @comment_id = params[:id]
    @comment.destroy

    user.point = user.point-1
    user.update_attributes(:point => user.point)

  end

  private
  def find_commentable
    @commentable_type = params[:commentable_type].classify
    @commentable = @commentable_type.constantize.find(params[:commentable_id])
  end
end