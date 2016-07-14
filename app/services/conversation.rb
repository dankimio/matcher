class Conversation
  def initialize(user, friend)
    @user = user
    @friend = friend
  end

  def messages
    incoming.or(outgoing).order(created_at: :desc)
  end

  private

  def incoming
    @user.incoming_messages.where(user: @friend)
  end

  def outgoing
    @user.outgoing_messages.where(friend: @friend)
  end
end
