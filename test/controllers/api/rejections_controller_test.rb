require 'test_helper'

class API::RejectionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rejection = rejections(:rejection)
  end

  test 'should create rejections' do
    @rejection.destroy

    assert_difference 'Rejection.count' do
      post api_rejections_path(api_token: api_token), params: {
        rejections: [@rejection.attributes.slice('friend_id')]
      }
    end
  end
end
