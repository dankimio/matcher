class API::RejectionsController < API::APIController
  def create
    @rejections = current_user.rejections.create(rejections_params[:rejections])
    head :created
  end

  private

  def rejections_params
    params.require(:rejections)
    params.permit(rejections: [:friend_id])
  end
end
