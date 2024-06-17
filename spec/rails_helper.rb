require 'spec_helper'
require 'rspec/rails'
require 'capybara/rspec'
require 'capybara/rails'
require 'database_cleaner/active_record'

# Require support files
ENV['RAILS_ENV'] ||= 'test'
Dir[Rails.root.join('spec/support/**/*.rb')].sort.each { |f| require f }

# Checks for pending migrations and applies them before tests are run.
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
  config.include Capybara::DSL, type: :feature


  config.before(:each, type: :feature) do
    Capybara.app_host = 'http://localhost:5173'
  end

  # Use deletion strategy for feature and request specs
  config.before(:each, type: :feature) do
    DatabaseCleaner.strategy = :deletion
  end

  config.before(:each, type: :request) do
    DatabaseCleaner.strategy = :deletion
  end

  # Use transaction strategy for other specs (default)
  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  # Configure Capybara server to run silently
  Capybara.server = :puma, { Silent: true }

  # Silence deprecation warnings
  config.before(:suite) do
    ActiveSupport::Deprecation.silenced = true
  end

  # Infer the spec type from file location
  config.infer_spec_type_from_file_location!

  # Filter out Rails gems from backtraces
  config.filter_rails_from_backtrace!
end
