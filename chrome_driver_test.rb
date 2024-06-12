require 'selenium-webdriver'

options = Selenium::WebDriver::Chrome::Options.new(args: %w[disable-gpu no-sandbox window-size=1400,1400])
driver = Selenium::WebDriver.for(:chrome, options: options)
puts driver.capabilities.browser_version
driver.quit
