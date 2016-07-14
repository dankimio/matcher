require 'test_helper'

class API::FriendshipsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @friendship = friendships(:friendship)
  end

  test 'should create friendship' do
    @friendship.destroy

    assert_difference 'Friendship.count' do
      post api_user_friendships_path(@friendship.friend, api_token: api_token)
    end
    assert_response :created
  end

  test 'should accept friendship if one exists' do
    assert_difference 'Friendship.count' do
      post api_user_friendships_path(@friendship.user, api_token: @friendship.friend.api_token)
    end
    assert_response :created
    assert @friendship.reload.accepted?
  end
end
