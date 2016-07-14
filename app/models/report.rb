# == Schema Information
#
# Table name: reports
#
#  id         :integer          not null, primary key
#  content    :text
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Report < ApplicationRecord
  belongs_to :user
end
