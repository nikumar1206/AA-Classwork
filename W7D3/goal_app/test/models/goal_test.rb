# == Schema Information
#
# Table name: goals
#
#  id         :bigint           not null, primary key
#  name       :string
#  details    :string
#  status     :boolean
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'test_helper'

class GoalTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
