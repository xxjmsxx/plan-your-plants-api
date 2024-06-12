require 'capybara/rspec'
require 'selenium/webdriver'
require 'webdrivers'

# Ensure Webdrivers will always download the correct driver
Webdrivers.cache_time = 86_400 # Cache drivers for 24 hours

Capybara.register_driver :selenium_chrome do |app|
  Capybara::Selenium::Driver.new(
    app,
    browser: :chrome,
    options: Selenium::WebDriver::Chrome::Options.new(
      args: %w[disable-gpu no-sandbox window-size=1400,1400]
    )
  )
end

Capybara.default_driver = :selenium_chrome
Capybara.javascript_driver = :selenium_chrome

# If your React app is running on a different port
Capybara.app_host = 'http://localhost:5173' # React app URL
