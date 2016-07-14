class API::UsersController < API::APIController
  skip_before_action :restrict_access!, only: [:authenticate_facebook]
  before_action :set_user, only: [:update]
  before_action :set_graph, only: [:authenticate_facebook]

  def index
    @users = User.all
  end

  def create
  end

  def update
  end

  def authenticate_facebook
    @user = User.find_or_initialize_by_facebook(@graph)

    if @user.save
      render :create, status: :created
    else
      render json: @user.errors, status: 422
    end
  rescue Koala::Facebook::AuthenticationError
    head :unprocessable_entity
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def set_graph
    @graph = Koala::Facebook::API.new(params[:access_token])
  end
end
