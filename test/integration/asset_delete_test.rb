require "test_helper"

class AssetsDeleteTest < ActiveSupport::TestCase
    include ActiveRecord::TestFixtures
    fixtures :assets

  test 'There are three Asset instances' do
    assets = Asset.all
    assert_equal 3, assets.count
  end

end