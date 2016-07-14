class API::FriendshipsController < API::APIController
  before_action :set_user, only: [:create]
  before_action :set_friend_request, only: [:create]

  def create
    @friendship = if @friend_request.present?
                    @friend_request.accept
                    @friend_request
                  else
                    current_user.friendships.build(friend: @user)
                  end

    if @friendship.save
      render :show, status: :created
    else
      render json: @friendship.errors, status: 422
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_friend_request
    @friend_request = current_user.friend_requests.find_by(user: @user)
  end
end
