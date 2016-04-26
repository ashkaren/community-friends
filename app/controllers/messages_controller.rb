class MessagesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @users = User.where.not("id = ?",current_user.id).order("created_at DESC")
    @conversations = Conversation.between(params[:sender_id],params[:recipient_id])
  end

  def create
    @conversation = Conversation.find(params[:conversation_id])
    @message = @conversation.messages.build(message_params)
    @message.user_id = current_user.id
    @message.save!

    @path = conversation_path(@conversation)
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end
end