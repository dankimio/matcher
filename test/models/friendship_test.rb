# == Schema Information
#
# Table name: friendships
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  friend_id  :integer
#  accepted   :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

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

  test 'creates and destroys inverse relationship' do
    friendship = @friendship.dup
    @friendship.destroy

    assert_difference 'Friendship.count', 2 do
      friendship.save
      friendship.accept
    end
  end
end
