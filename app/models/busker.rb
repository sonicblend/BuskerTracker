require 'uri'

class Busker < ActiveRecord::Base
  VALID_FACEBOOK_REGEX = /(facebook|fb).com\/[a-z\d.]{1,50}\z/i
  VALID_TWITTER_REGEX  = /twitter.com\/[a-z\d_]{1,15}\z/i
  VALID_URL            = URI::regexp(%w(http https))

  validates :name, presence: true
  validates :facebook, format: VALID_FACEBOOK_REGEX
  validates :twitter,  format: VALID_TWITTER_REGEX
  validates :website,  format: VALID_URL
end
