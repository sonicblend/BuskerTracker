require 'test_helper'

class BuskerTest < ActiveSupport::TestCase
  def setup
    @busker = buskers :two
  end

  test "should be valid" do
    assert @busker.valid?
  end

  test "busker name is mandatory" do
    @busker.name = '   '
    assert_not @busker.valid?
  end

  test "twitter should reject invalid identifiers" do
    invalid_twitter_urls = %w[tweeter.com/blabla twitter.com/asdf.asdf asdf.asdf]
    invalid_twitter_urls.each do |url|
      @busker.twitter = url
      assert_not @busker.valid?
    end
  end

  test "twitter identifier should not be too long" do
    @busker.twitter = 'a' * 16
    assert_not @busker.valid?
  end

  test "twitter url should be prefixed with correct host" do
    @busker.twitter = 'buskinginbath'
    @busker.valid?
    assert_equal('https://twitter.com/buskinginbath', @busker.twitter_url)
  end

  test "facebook url should be prefixed with correct host" do
    @busker.facebook = 'mariahcarey'
    @busker.valid?
    assert_equal('https://facebook.com/mariahcarey', @busker.facebook_url)
  end

  test "facebook should reject invalid identifiers" do
    invalid_facebook_urls = %w[facebook.com/☃  fayzbook.com/bla facebook.com/bla_bla bla_bla ☃]
    invalid_facebook_urls.each do |url|
      @busker.facebook = url
      assert_not @busker.valid?
    end
  end

  test "facebook identifier should not be too long" do
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

  test "should be valid with only a name" do
    assert buskers(:only_a_name).valid?
  end
end
