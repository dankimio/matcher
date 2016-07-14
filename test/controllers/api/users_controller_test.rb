require 'test_helper'

class API::UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:foo)
  end

  test 'should get index' do
    get api_users_path(api_token: api_token)
    assert_response :success
  end

  test 'shold show user' do
    get api_user_path(api_token: api_token)
    assert_response :success
  end

  test 'should check in' do
    post check_in_api_user_path(api_token: api_token), params: { latitude: 0, longitude: 0 }
    assert_response :ok
  end
end
