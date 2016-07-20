# == Schema Information
#
# Table name: messages
#
#  id         :integer          not null, primary key
#  content    :string
#  user_id    :integer
#  friend_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Message < ApplicationRecord
  after_create :notify

  belongs_to :user
  belongs_to :friend, class_name: 'User'

  validates :content, presence: true
  validate :users_are_friends
  validate :not_self

  private

  def users_are_friends
    errors.add(:friend, 'is not a friend') unless user.friends.include?(friend)
  end

  def not_self
    errors.add(:friend, "can't be self") if user == friend
  end

  def notify
    Notifier.new(friend, 'You have a new message!')
  end
end
