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
