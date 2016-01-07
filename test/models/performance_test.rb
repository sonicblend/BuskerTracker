# == Schema Information
#
# Table name: performances
#
#  id          :integer          not null, primary key
#  start_date  :datetime
#  end_date    :datetime
#  amplified   :boolean
#  busker_id   :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  location_id :integer
#

require 'test_helper'

class PerformanceTest < ActiveSupport::TestCase
  def setup
    @first = performances :first
  end

  test "should be valid" do
    assert @first.valid?
  end

  test "start and end date must not be equal" do
    @first.start_date = @first.end_date
    assert_not @first.valid?
  end
end
