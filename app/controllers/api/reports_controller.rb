class API::ReportsController < ApplicationController
  before_action :set_user, only: [:create]

  def create
    @report = @user.reports.build(report_params)

    if @report.save
      render :show, status: :created
    else
      render json: @report.errors, status: 422
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def report_params
    params.fetch(:report, {}).permit(:content)
  end
end
