source "https://rubygems.org"

ruby "3.1.2"

# Rails
gem "rails", "7.1.3.4"

# Database
gem "sqlite3", "~> 1.4"

# Web server
gem "puma", ">= 5.0"

# Encryption
gem 'bcrypt', '~> 3.1.7'

# Token authentication
gem 'jwt'

# postgres
gem 'pg'

# CORS handling
gem 'rack-cors'

# Time zone data for Windows
gem "tzinfo-data", platforms: %i[ mswin mswin64 mingw x64_mingw jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Database cleaner for tests
gem 'database_cleaner-active_record'

group :development, :test do
  gem 'rspec-rails', '~> 5.0.0' # Ensure compatibility with Rails 7
  gem 'factory_bot_rails'       # For creating test data
  gem 'faker'                   # For generating random test data
  gem "debug", platforms: %i[ mri mswin mswin64 mingw x64_mingw ]
end

group :development do
  gem "error_highlight", ">= 0.4.0", platforms: [:ruby]
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end
