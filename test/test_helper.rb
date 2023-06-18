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
  chrome_bin = ENV.fetch('GOOGLE_CHROME_SHIM', nil)
  chrome_opts = chrome_bin ? { "chromeOptions" => { "binary" => chrome_bin } } : {}

  puts "Chrome binary location: #{chrome_bin}"
  puts "Chrome options: #{chrome_opts}"
  puts "GOOGLE_CHROME_BIN: #{ENV.fetch('GOOGLE_CHROME_BIN', '')}"
  puts "GOOGLE_CHROME_SHIM: #{ENV.fetch('GOOGLE_CHROME_SHIM', '')}"

  Capybara.register_driver :chrome do |app|
    Capybara::Selenium::Driver.new(
      app,
      browser: :chrome,
      desired_capabilities: Selenium::WebDriver::Remote::Capabilities.chrome(chrome_opts)
    )
  end

  Capybara.javascript_driver = :chrome
  # End chrome lib path setup




end
