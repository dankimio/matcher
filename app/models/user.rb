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
#

class User < ApplicationRecord
  include Authenticable

  has_secure_token :api_token

  validates :first_name, :last_name, presence: true
  validates :birthday, presence: true
  validates :gender, inclusion: { in: %w(male female) }
end
