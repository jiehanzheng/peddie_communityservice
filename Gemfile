source 'https://rubygems.org'

gem 'rails', '3.2.11'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end


group :development do
  # Deploy with Capistrano
  gem 'capistrano'
  gem "rvm-capistrano"
  gem 'capistrano-unicorn', :require => false
end


group :production do
  gem 'mysql2'
end


gem 'jquery-rails'

# Use unicorn as the app server
gem 'unicorn'

# Twitter Bootstrap and its required LESS gem
gem "less-rails"
gem "twitter-bootstrap-rails"

# User authentication with Peddie Email and identity
gem "ruby-openid-apps-discovery"
gem 'bcrypt-ruby', '~> 3.0.0'
gem "omniauth-identity"
gem "omniauth-openid"

# App configuration
gem "rails_config"

# Authorization
gem "declarative_authorization"


# Tests
group :test, :development do
  gem 'sqlite3'

  gem "rspec-rails", "~> 2.0"
  gem "capybara"
  gem "guard-rspec"
  gem "rb-inotify", '~> 0.8.8'
  gem "timecop"
  gem "database_cleaner"
end