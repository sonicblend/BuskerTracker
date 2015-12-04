require 'uri'

class Busker < ActiveRecord::Base
  VALID_FACEBOOK_REGEX = /(facebook|fb).com\/[a-z\d.]{1,50}\z/i
  VALID_TWITTER_REGEX  = /twitter.com\/[a-z\d_]{1,15}\z/i
  VALID_URL            = URI::regexp(%w(http https))
  VALID_NO_SPACES      = /\A[^ @]+\z/

  before_validation :strip_whitespace, :sanitize_url

  validates :name, presence: true
  validates :facebook, allow_blank: true, format: VALID_FACEBOOK_REGEX
  validates :twitter,  allow_blank: true, format: VALID_TWITTER_REGEX
  validates :website,  allow_blank: true, format: VALID_URL
  validates :website,  allow_blank: true, format: {
    with:    VALID_NO_SPACES,
    message: 'must have no spaces'
  }

  private
  def sanitize_url
    if !self.website.blank? and self.website_changed?
      self.website = self.website.strip
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
