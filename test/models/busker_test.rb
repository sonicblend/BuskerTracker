require 'test_helper'

class BuskerTest < ActiveSupport::TestCase
  def setup
    @busker = buskers :one
  end

  test "should be valid" do
    assert @busker.valid?
  end

  test "busker name is mandatory" do
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

  test "twitter address should be prefixed with https when no prefix specified" do
    @busker.twitter = 'twitter.com/buskinginbath'
    @busker.valid?
    assert_equal('https://twitter.com/buskinginbath', @busker.twitter)
  end

  test "twitter address should be prefixed with https when http prefix specified" do
    @busker.twitter = 'http://twitter.com/buskinginbath'
    @busker.valid?
    assert_equal('https://twitter.com/buskinginbath', @busker.twitter)
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

  test "facebook address should validate fb.com urls" do
    @busker.facebook = 'fb.com/SophieTheBusker'
    assert @busker.valid?
  end

  test "facebook address should prefer https prefix and facebook.com" do
    @busker.facebook = 'http://fb.com/SophieTheBusker'
    @busker.valid?
    assert_equal('https://facebook.com/SophieTheBusker', @busker.facebook)
  end

  test "website should be valid" do
    invalid_website_urls = ['httpz://www.google.com/', 'cadburys chocolate', 'loopy@gmail.com']
    invalid_website_urls.each do |url|
      @busker.website = url
      assert_not @busker.valid?
    end
  end

  test "should be valid with only a name" do
    assert buskers(:only_a_name).valid?
  end
end
