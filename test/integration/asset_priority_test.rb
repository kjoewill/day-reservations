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
  
  test 'Assets are available in order based on asset.sort_order' do
    g1 = Asset.find(1)
    g2 = Asset.find(2)
    g3 = Asset.find(3)
    g4 = Asset.find(4)

    assets = Asset.by_sort_order
    assert_equal [g1, g2, g3, g4], assets
  end

  test 'If an assets sort_order changes then Assets are available in the new order based on asset.sort_order' do
    g1 = Asset.find(1)
    g2 = Asset.find(2)
    g3 = Asset.find(3)
    g4 = Asset.find(4)

    #g4 becomes first in order
    g4.update(sort_order: 0)

    assets = Asset.by_sort_order
    assert_equal [g4, g1, g2, g3], assets
  end

  test 'If an asset is deleted then remaining assets are available in their sort_order order' do
    g1 = Asset.find(1)
    g2 = Asset.find(2)
    g3 = Asset.find(3)
    g4 = Asset.find(4)

    #g4 becomes first in order
    g4.update(sort_order: 0)

    assets = Asset.by_sort_order
    assert_equal [g4, g1, g2, g3], assets

    g4.destroy
    assets = Asset.by_sort_order
    assert_equal [g1, g2, g3], assets

    g2.destroy
    assets = Asset.by_sort_order
    assert_equal [g1, g3], assets

    g1.update(sort_order: 99)
    assets = Asset.by_sort_order
    assert_equal [g3, g1], assets

    g1.destroy
    assets = Asset.by_sort_order
    assert_equal [g3], assets

    g3.destroy
    assets = Asset.by_sort_order
    assert_equal [], assets

  end

  test 'If an new asset is created then assets are available in their sort_order order' do
    g1 = Asset.find(1)
    g2 = Asset.find(2)
    g3 = Asset.find(3)
    g4 = Asset.find(4)

    assets = Asset.by_sort_order
    assert_equal [g1, g2, g3, g4], assets

    g5 = Asset.create(name: 'Glider-5', sort_order: 5)
    assets = Asset.by_sort_order
    assert_equal [g1, g2, g3, g4, g5], assets
  end

  test 'The order can be reversed' do
    g1 = Asset.find(1)
    g2 = Asset.find(2)
    g3 = Asset.find(3)
    g4 = Asset.find(4)

    assets = Asset.by_sort_order
    assert_equal [g1, g2, g3, g4], assets

    reversed_assets = assets.reverse

    reversed_assets.each_with_index do |asset, index|
      asset.update(sort_order: index + 1)
    end

    assets = Asset.by_sort_order
    assert_equal assets, reversed_assets
    assert_equal [g4, g3, g2, g1], assets
  end
end
