source 'https://rubygems.org'
ruby '2.2.3'

# Template language
gem 'haml'
# Responsive HTML/CSS framework
gem 'foundation-rails'
gem 'foundation_rails_helper'
gem 'simple_form'
# Image upload
gem 'cloudinary'
# Puma server
gem 'puma'

# Use postgresql as the database for Active Record
gem 'pg', '~> 0.15'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use devise for user authentication
gem 'devise'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
end

group :test do
  gem 'guard'
  gem 'guard-minitest'
  gem 'minitest-reporters'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  gem 'haml-rails', '~> 0.9'
  # Required to convert Devize erb views to haml
  gem 'erb2haml'
  # Add a comment summarizing the current schema to the top of fixtures etc.
  gem 'annotate'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :production do
  # recommended by heroku - for logging, asset serving
  gem 'rails_12factor'
end
