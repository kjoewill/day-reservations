require 'database_cleaner'
require "test_helper"
require_relative 'test_data_helper'

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  include TestDataHelper # Include TestDataHelper module
  driven_by :selenium, using: :headless_chrome, screen_size: [1400, 1400]
  setup do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean_with(:truncation)
    #Rails.application.load_seed
    load_test_data
  end
end