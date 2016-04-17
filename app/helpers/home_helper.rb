module HomeHelper
  def relative_time(created_at)
    time_ago_in_words(created_at)
  end

  def formatted_time(time)
    time.to_formatted_s(:short)
  end

  def conversation_interlocutor(conversation)
    conversation.recipient == current_user ? conversation.sender : conversation.recipient
  end
end