ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...

  #This code to provide correct path to the chrome library on heroku test environment

  puts "Kevin: Loading test_helper.rb..."

  binary = ENV.fetch("GOOGLE_CHROME_BIN", nil)

  Selenium::WebDriver::Chrome.path = binary if binary

  Capybara.register_driver(:headless_chrome) do |app|
    options = {
      args: %w[headless no-sandbox disable-dev-shm-usage disable-gpu remote-debugging-port=9222],
      binary: binary
    }.compact_blank
    
    capabilities = Selenium::WebDriver::Chrome::Options.new(options)
    Capybara::Selenium::Driver.new(app, browser: :chrome, capabilities: capabilities)
  end
  # End chrome lib path setup




end
