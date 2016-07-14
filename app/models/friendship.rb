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

class Friendship < ApplicationRecord
  after_destroy :destroy_inverse_relationship

  belongs_to :user
  belongs_to :friend, class_name: 'User'

  validates :friend, uniqueness: { scope: :user }
  validate :not_self

  scope :accepted, -> { where(accepted: true) }
  scope :unaccepted, -> { where(accepted: false) }

  # Create inverse relationship when accepted
  def accept
    update(accepted: true)
    friend.accepted_friendships.create(friend: user)
  end

  private

  def destroy_inverse_relationship
    friend.friends.destroy(user)
  end

  def not_self
    errors.add(:friend, "can't be equal to self") if user == friend
  end
end
