require "application_system_test_case"

class AssetSortOrdersTest < ApplicationSystemTestCase

  test "changing asset sort order updates the display" do
    # Create test assets with initial sort order
    asset1 = Asset.create(name: "Asset 1", sort_order: 0)

    # Visit the page where the assets are displayed
    visit root_path
    assert_selector "h1", text: "High Flights Soaring", wait: 5

    # Verify the initial order of asset names
    assert_equal 'Asset 1 Reserve', find('table thead tr th:nth-child(2)').text
    assert_equal 'Glider-1 Reserve', find('table thead tr th:nth-child(3)').text
    assert_equal 'Glider-2 Reserve', find('table thead tr th:nth-child(4)').text
    assert_equal 'Glider-3 Reserve', find('table thead tr th:nth-child(5)').text
    assert_equal 'Glider-4 Reserve', find('table thead tr th:nth-child(6)').text
  

    # Simulate changing the asset sort order
    asset1.update(sort_order: 6)

    # Visit the page again to check the updated order
    visit root_path
    assert_selector "h1", text: "High Flights Soaring", wait: 5

    # Verify the updated order of asset names
    assert_equal 'Glider-1 Reserve', find('table thead tr th:nth-child(2)').text
    assert_equal 'Glider-2 Reserve', find('table thead tr th:nth-child(3)').text
    assert_equal 'Glider-3 Reserve', find('table thead tr th:nth-child(4)').text
    assert_equal 'Glider-4 Reserve', find('table thead tr th:nth-child(5)').text
    assert_equal 'Asset 1 Reserve', find('table thead tr th:nth-child(6)').text
  
  end

end
