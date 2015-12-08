Cloudinary.config do |config|
  config.cloud_name = ENV['CLOUDINARY_NAME'] || 'not-set'
  config.api_key    = ENV['CLOUDINARY_API_KEY'] || 'not-set'
  config.api_secret = ENV['CLOUDINARY_API_SECRET'] || 'not-set'
  config.cdn_subdomain = true
  config.secure = false
end if defined? Cloudinary
