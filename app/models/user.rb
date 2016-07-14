# == Schema Information
#
# Table name: users
#
#  id             :integer          not null, primary key
#  first_name     :string           not null
#  last_name      :string           not null
#  birthday       :date             not null
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
#

class User < ApplicationRecord
  SEARCH_DISTANCE = 20

  include Authenticable
  include Geocodable

  has_many :friendships, dependent: :destroy
  has_many :accepted_friendships,
           -> { Friendship.accepted },
           class_name: 'Friendship', dependent: :destroy
  has_many :friends, through: :accepted_friendships, source: :friend
  has_many :friend_requests,
           -> { Friendship.unaccepted },
           class_name: 'Friendship', foreign_key: :friend_id
  has_many :pending_friends,
           through: :friend_requests,
           class_name: 'User', source: :user

  has_secure_token :api_token

  validates :first_name, :last_name, presence: true
  validates :birthday, presence: true
  validates :gender, inclusion: { in: %w(male female) }
  validates :team, inclusion: { in: %w(instinct mystic valor) }, allow_nil: true

  acts_as_mappable lat_column_name: :latitude, lng_column_name: :longitude

  scope :near, -> (user) { within(SEARCH_DISTANCE, origin: user.to_location) }
  scope :recent, -> { where('checked_in_at > ?', 1.day.ago) }

  def check_in(latitude, longitude)
    return false unless latitude.present? && longitude.present?
    update(latitude: latitude, longitude: longitude, checked_in_at: Time.zone.now)
  end

  def to_location
    [latitude, longitude]
  end
end
