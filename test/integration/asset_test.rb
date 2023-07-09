require "test_helper"

class AssetsTest < ActiveSupport::TestCase
    include ActiveRecord::TestFixtures
    fixtures :assets

  test 'There are three Asset instances' do
    assets = Asset.by_sort_order
    assert_equal 3, assets.count
  end
  
  test 'Assets can be retreived in priority sort order' do

    assets = Asset.by_sort_order
    assert_equal 'FancyGlider1', assets.first.name

    assets.first.sort_order = 99
    assets.first.save
    assets = Asset.by_sort_order

    assert_equal 'FancyGlider2', assets.first.name
    assert_equal 'FancyGlider1', assets.last.name

  end


end
