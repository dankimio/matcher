class API::UsersController < API::APIController
  skip_before_action :restrict_access!, only: [:authenticate_facebook]
  before_action :set_user, only: %i[show update]
  before_action :set_graph, only: [:authenticate_facebook]

  def index
    @users = User.recent
      .where.not(id: current_user)
      .where.not(id: current_user.swiped_users)
      .limit(25)
  end

  def show
  end

  def create
  end

  def update
    if @user.update(user_params)
      head :ok
    else
      render json: @user.errors, status: 422
    end
  end

  def check_in
    if current_user.check_in(*check_in_params)
      head :ok
    else
      render json: current_user.errors, status: 422
    end
  end

  def authenticate_facebook
    @user = User.find_or_initialize_by_facebook(@graph)

    if (@user&.new_record? && @user&.save) || @user&.persisted?
      render :create, status: :created
    else
      render json: @user.errors, status: 422
    end
  rescue Koala::Facebook::AuthenticationError
    head :unprocessable_entity
  end

  private

  def set_user
    @user = current_user
  end

  def set_graph
    @graph = Koala::Facebook::API.new(params[:access_token])
  end

  def user_params
    params.require(:user).permit(:device_token, :bio, :team, :master, :birthdate)
  end

  def check_in_params
    [params[:latitude], params[:longitude]]
  end
end
