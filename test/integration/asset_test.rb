require "test_helper"

class AssetsPriorityTest < ActiveSupport::TestCase

  test 'There are 4 Asset instances' do
    assets = Asset.all
    assert_equal 4, assets.count
  end
  
end
