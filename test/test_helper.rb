ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"
#require_relative '../db/seeds'


class ActiveSupport::TestCase
  # Configure the test strategy to use transactions
  #self.use_transactional_tests = true

  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...

  #This code to provide correct path to the chrome library on heroku test environment
  chrome_bin = ENV.fetch('GOOGLE_CHROME_SHIM', nil)

  chrome_opts = chrome_bin ? { "chromeOptions" => { "binary" => chrome_bin } } : {}

  Capybara.register_driver :chrome do |app|
    Capybara::Selenium::Driver.new(
      app,
      browser: :chrome,
      desired_capabilities: Selenium::WebDriver::Remote::Capabilities.chrome(chrome_opts)
    )
  end

  Capybara.javascript_driver = :chrome
  if ENV['GOOGLE_CHROME_SHIM']
    Selenium::WebDriver::Chrome.path = ENV['GOOGLE_CHROME_SHIM']
  end
  # End chrome lib path setup

  # Configure DatabaseCleaner
  DatabaseCleaner.strategy = :transaction

  # Clean the database before running tests
  setup do
    DatabaseCleaner.start
  end

  # Clean the database after running tests
  teardown do
    DatabaseCleaner.clean
  end


end
