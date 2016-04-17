module UsersHelper
  def options_for_sex
    [['Male', 'male'], ['Female', 'female']]
  end

  def is_current_user?(user)
    user == current_user
  end

  def conversation_interlocutor(conversation)
    conversation.recipient == current_user ? conversation.sender : conversation.recipient
  end
end