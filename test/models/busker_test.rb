require 'test_helper'

class BuskerTest < ActiveSupport::TestCase
  def setup
    @busker = Busker.new(name: "Loopy Tom",
                         description: "Loop-based music",
                         image_id: "http://www.mickyatesphotography.com/Candid-Street/The-People-of-Bath/i-hJKQWWs/0/XL/Leica%20Bath%20May%202014%20Colour%20Wash%20-2-XL.jpg",
                         facebook: "https://www.facebook.com/loopytom",
                         twitter: "https://twitter.com/loopytomdotcom",
                         website: "http://loopytom.com/")
  end

  test "should be valid" do
    assert @busker.valid?
  end

  test "name should be present" do
    @busker.name = '   '
    assert_not @busker.valid?
  end
end
