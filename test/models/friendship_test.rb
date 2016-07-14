require 'test_helper'

class FriendshipTest < ActiveSupport::TestCase
  setup do
    @friendship = friendships(:friendship)
  end

  test 'valid' do
    assert @friendship.valid?
  end

  test 'uniqueness' do
    friendship = @friendship.dup
    assert friendship.invalid?
  end

  test 'not self' do
    @friendship.friend = @friendship.user
    assert @friendship.invalid?
  end

  test 'creates and destroys inverse relation ship' do
    friendship = @friendship.dup
    @friendship.destroy

    assert_difference 'Friendship.count', 2 do
      friendship.save
      friendship.accept
    end
  end
end
