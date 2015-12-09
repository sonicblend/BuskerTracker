require 'uri'

class Busker < ActiveRecord::Base
  VALID_FACEBOOK_REGEX = /\A[a-z\d.]{1,50}\z/i
  VALID_TWITTER_REGEX  = /\A[a-z\d_]{1,15}\z/i
  VALID_URL            = URI::regexp(%w(http https))
  VALID_NO_SPACES      = /\A[^ @]+\z/

  before_validation :strip_whitespace, :prefix_url

  validates :name, presence: true
  validates :facebook, allow_blank: true, format: {
    with:    VALID_FACEBOOK_REGEX,
    message: 'must only contain the identifier'
  }
  validates :twitter,  allow_blank: true, format: {
    with:    VALID_TWITTER_REGEX,
    message: 'must only contain the identifier'
  }
  validates :website,  allow_blank: true, format: VALID_URL
  validates :website,  allow_blank: true, format: {
    with:    VALID_NO_SPACES,
    message: 'must have no spaces, or @ symbols'
  }

  def twitter_url
    "https://twitter.com/#{twitter}" if twitter.present?
  end

  def facebook_url
    "https://facebook.com/#{facebook}" if facebook.present?
  end

  private
  def prefix_url
    if self.website.present? && self.website_changed?
      self.website = "http://#{website}" unless website =~ /:\/\//
    end
  end

  private
  def strip_whitespace
    # trim whitespace from beginning and end of string attributes
    changed.each do |name|
      if send(name).respond_to?(:strip)
        send("#{name}=", send(name).strip)
      end
    end
  end
end
