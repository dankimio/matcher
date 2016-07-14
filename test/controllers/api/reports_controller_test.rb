require 'test_helper'

class API::ReportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @report = reports(:report)
  end

  test 'should create report' do
    assert_difference 'Report.count' do
      post api_user_reports_path(@report.user, api_token: api_token), params: {
        report: { content: @report.content }
      }
    end
    assert_response :created
  end
end
