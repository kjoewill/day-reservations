require "test_helper"
require_relative '../test_data_helper'

class AssetsPriorityTest < ActiveSupport::TestCase
  include TestDataHelper # Include TestDataHelper module

  setup do
    load_test_data # Load test data before each test
  end


  test 'There are 4 Asset instances' do
    assets = Asset.all
    assert_equal 4, assets.count
  end
  
end
