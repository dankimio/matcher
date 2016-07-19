# == Schema Information
#
# Table name: rejections
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  friend_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Rejection < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  validates :friend, uniqueness: { scope: :user }
  validate :not_self

  private

  def not_self
    errors.add(:friend, "can't be self") if user == friend
  end
end
