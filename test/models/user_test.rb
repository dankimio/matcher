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

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = users(:foo)
  end

  test 'valid' do
    assert @user.valid?
  end
end
