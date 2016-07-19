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

require 'test_helper'

class RejectionTest < ActiveSupport::TestCase
  setup do
    @rejection = rejections(:rejection)
  end

  test 'valid' do
    assert @rejection.valid?
  end

  test 'uniqueness' do
    rejection = @rejection.dup
    assert rejection.invalid?
  end
end
