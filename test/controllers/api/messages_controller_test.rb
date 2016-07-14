require 'test_helper'

class API::MessagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @message = messages(:message)
  end

  test 'should get index' do
    get api_friend_messages_path(@message.friend, api_token: api_token)
    assert_response :success
  end

  test 'should create message' do
    assert_difference 'Message.count' do
      post api_friend_messages_path(@message.friend, api_token: api_token), params: {
        message: { content: @message.content }
      }
    end
    assert_response :created
  end
end
