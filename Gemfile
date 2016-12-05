source 'https://rubygems.org'
ruby "2.3.1"

# Use puma just for the sake of using it? NO!!! IS FOR HEROKU SAKE!!!
# gem 'puma', group: :production   

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.6'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.15'
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
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  #gem 'shoulda-matchers'

  #gem 'shoulda'
  
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  gem 'guard-rspec', require: false
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  # For seeding bulk data
  gem 'faker' 
end

# Use for bootstrap gem
gem 'sprockets-rails', :require => 'sprockets/railtie'

# Use bootstrap gem for front end
gem 'bootstrap-sass', '~> 3.3.6'

# For user authentication
gem "clearance"

# For safety purpose
gem 'figaro'

# For facebook login
gem 'omniauth'
gem 'omniauth-facebook'

# For pagination
gem 'kaminari'

# For image uploading, and storing
gem 'carrierwave', git: 'https://github.com/carrierwaveuploader/carrierwave.git'
gem "mini_magick"

# date picker
gem 'momentjs-rails', '>= 2.9.0'
gem 'bootstrap3-datetimepicker-rails', '~> 4.14.30'

# email sender for background queue-ing
gem 'sidekiq'

# fix redis-namespace usage?
gem 'redis-namespace'

# braintree for sandbox payment API
gem 'braintree'

# get ruby variable into js
gem 'gon'

# Implement dynamic search
gem 'pg_search'

# A gem that do 12 things
gem 'rails_12factor', group: :production

# To run unicorn server in heroku
gem 'unicorn', group: :production

# Timeout for unicorn
gem 'rack-timeout'

# new relic
#gem 'newrelic_rpm'

# rspec
gem "rspec-rails", :group => [:test, :development]

group :test do
  gem "factory_girl_rails"
  gem "capybara"


  gem 'rspec-given'
end