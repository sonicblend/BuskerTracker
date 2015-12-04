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

  test "twitter address should reject invalid urls" do
    invalid_twitter_urls = %w[tweeter.com/blabla twitter.com/asdf.asdf]
    invalid_twitter_urls.each do |url|
      @busker.twitter = url
      assert_not @busker.valid?
    end
  end

  test "twitter address should not be too long" do
    @busker.twitter = 'a' * 16
    assert_not @busker.valid?
  end

  test "facebook address should reject invalid urls" do
    invalid_facebook_urls = %w[facebook.com/☃  fayzbook.com/bla facebook.com/bla_bla]
    invalid_facebook_urls.each do |url|
      @busker.facebook = url
      assert_not @busker.valid?
    end
  end

  test "facebook address should not be too long" do
    @busker.facebook = 'a' * 51
    assert_not @busker.valid?
  end

  test "website should be valid" do
    invalid_website_urls = ['httpz://www.google.com/', 'cadburys chocolate', 'loopy@gmail.com']
    invalid_website_urls.each do |url|
      @busker.website = url
      assert_not @busker.valid?
    end
  end

  test "should be valid without a twitter, website, or facebook" do
    @busker.twitter = ' '
    @busker.website = ''
    @busker.facebook = '  '
    assert @busker.valid?
  end
end
