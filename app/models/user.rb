# == Schema Information
#
# Table name: users
#
#  id             :integer          not null, primary key
#  first_name     :string           not null
#  last_name      :string           not null
#  birthdate      :date             not null
#  avatar         :string
#  gender         :string           not null
#  team           :string
#  bio            :string
#  api_token      :string           not null
#  facebook_id    :integer
#  facebook_token :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  latitude       :float
#  longitude      :float
#  checked_in_at  :datetime
#  device_token   :string
#  master         :boolean          default(FALSE)
#

class User < ApplicationRecord
  SEARCH_DISTANCE = 20

  include Authenticable
  include Geocodable

  has_many :reports, dependent: :destroy

  has_many :outgoing_messages,
           dependent: :destroy, class_name: 'Message'
  has_many :incoming_messages,
           dependent: :destroy, class_name: 'Message', foreign_key: :friend_id

  has_many :friendships, dependent: :destroy
  has_many :liked_users,
           through: :friendships, class_name: 'User', source: :friend
  has_many :accepted_friendships,
           -> { Friendship.accepted },
           class_name: 'Friendship', dependent: :destroy
  has_many :friends, through: :accepted_friendships, source: :friend
  has_many :friend_requests,
           -> { Friendship.unaccepted },
           class_name: 'Friendship', foreign_key: :friend_id, dependent: :destroy
  has_many :pending_friends,
           through: :friend_requests,
           class_name: 'User', source: :user

  has_many :rejections, dependent: :destroy
  has_many :rejected_users,
           through: :rejections,
           class_name: 'User', source: :friend
  has_many :inverse_rejections,
           class_name: 'Rejection', foreign_key: :friend_id, dependent: :destroy

  has_secure_token :api_token

  validates :first_name, :last_name, presence: true
  validates :birthdate, presence: true, on: :update
  validates :gender, inclusion: { in: %w(male female) }
  validates :team, inclusion: { in: %w(instinct mystic valor) }, allow_nil: true

  acts_as_mappable lat_column_name: :latitude, lng_column_name: :longitude

  scope :near, -> (user) { within(SEARCH_DISTANCE, origin: user.to_location) }
  scope :recent, -> { where('checked_in_at > ?', 1.day.ago) }

  mount_uploader :avatar, AvatarUploader

  def check_in(latitude, longitude)
    return false unless latitude.present? && longitude.present?
    update(latitude: latitude, longitude: longitude, checked_in_at: Time.zone.now)
  end

  def to_location
    [latitude, longitude]
  end

  def swiped_users
    User.where(id: liked_users).or(User.where(id: rejected_users))
  end
end
