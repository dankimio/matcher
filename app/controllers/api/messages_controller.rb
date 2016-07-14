class API::MessagesController < API::APIController
  before_action :set_friend

  def index
    @messages = Conversation.new(current_user, @friend).messages
  end

  def create
    @message = current_user.outgoing_messages.build(message_params)

    if @message.save
      render :show, status: :created
    else
      render json: @message.errors, status: 422
    end
  end

  private

  def set_friend
    @friend = current_user.friends.find(params[:friend_id])
  end

  def message_params
    params.require(:message).permit(:content).merge(friend: @friend)
  end
end
