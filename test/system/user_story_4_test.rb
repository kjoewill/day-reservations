require "application_system_test_case"

class UserStory4Test < ApplicationSystemTestCase

  test "adding an asset with sort order displays correctly" do

    # Visit the page where the assets are displayed
    visit root_path
    assert_selector "h1", text: "High Flights Soaring", wait: 5

    # Verify the initial order of asset names
    assert_equal 'Glider-1 Reserve', find('table thead tr th:nth-child(2)').text
    assert_equal 'Glider-2 Reserve', find('table thead tr th:nth-child(3)').text
    assert_equal 'Glider-3 Reserve', find('table thead tr th:nth-child(4)').text
    assert_equal 'Glider-4 Reserve', find('table thead tr th:nth-child(5)').text

    # Create new test assets with initial sort order
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

  test "delete then add back asset that has reservations" do
    visit root_path
    fill_in "datepicker", with: "09-27-2025"
    click_button "Go"

    #Using this as a delay to avoid testing contents before they have a chance to load
    assert_selector "h1", text: "High Flights Soaring", wait: 15

    # Timing related errors when this is removed.  The wait above does not seem sufficient
    take_screenshot

    # Assert that the specific cell contains the expected text
    within "table" do
      cell_text = find("tr:nth-child(1) td:nth-child(3)").text
      assert_equal "08:30, G2, 09-27-25", cell_text
    end
  end

end
