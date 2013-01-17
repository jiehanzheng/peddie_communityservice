source 'https://rubygems.org'

gem 'rails', '3.2.9'


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
  gem 'sqlite3'

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
gem "omniauth-identity"
gem "omniauth-openid"

# App configuration
gem "rails_config"

# Time-only selector in forms
gem "combined_time_select", "~> 1.0.0"