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

  test "If an asset is deleted it will no longer display on the home page" do

    # Visit the page where the assets are displayed
    visit root_path
    assert_selector "h1", text: "High Flights Soaring", wait: 5

    # Verify the initial order of asset names
    assert_equal 'Glider-1 Reserve', find('table thead tr th:nth-child(2)').text
    assert_equal 'Glider-2 Reserve', find('table thead tr th:nth-child(3)').text
    assert_equal 'Glider-3 Reserve', find('table thead tr th:nth-child(4)').text
    assert_equal 'Glider-4 Reserve', find('table thead tr th:nth-child(5)').text

    g1 = Asset.find(1)
    assert_includes 'Glider-1', g1.name
    g1.destroy

    # Visit the page where the assets are displayed
    visit root_path
    assert_selector "h1", text: "High Flights Soaring", wait: 5

    assert_no_text("Glider-1")

    assert_equal 'Glider-2 Reserve', find('table thead tr th:nth-child(2)').text
    assert_equal 'Glider-3 Reserve', find('table thead tr th:nth-child(3)').text
    assert_equal 'Glider-4 Reserve', find('table thead tr th:nth-child(4)').text

  end

  test "If I delete asset that has reservations I can then then add back asset with same name and priority" do
    visit root_path
    fill_in "datepicker", with: "09-27-2025"
    click_button "Go"

    #Using this as a delay to avoid testing contents before they have a chance to load
    assert_selector "h1", text: "High Flights Soaring", wait: 15

    # Timing related errors when this is removed.  The wait above does not seem sufficient
    take_screenshot

    # Assert that the specific cell contains the expected text
    within "table" do
      cell_text = find("tr:nth-child(2) td:nth-child(3)").text
      assert_equal "08:30, G2, 09-27-25", cell_text
    end

    g2 = Asset.find(2)
    assert_includes 'Glider-2', g2.name

    day_sched_id = g2.day_schedules.first.id
    g2.destroy
    #Make sure the assets day_schedule was also destroyed
    assert_raises(ActiveRecord::RecordNotFound) do
      DaySchedule.find(day_sched_id)
    end

    visit root_path
    fill_in "datepicker", with: "09-27-2025"
    click_button "Go"

    #Using this as a delay to avoid testing contents before they have a chance to load
    assert_selector "h1", text: "High Flights Soaring", wait: 15
    # Timing related errors when this is removed.  The wait above does not seem sufficient
    take_screenshot

    #Glider-2 is gone and must not appear
    assert_no_text("Glider-2")

    #Create an asset with the same name and sort order
    g2 = Asset.create(name: 'Glider-2', sort_order: 2)

    visit root_path
    fill_in "datepicker", with: "09-27-2025"
    click_button "Go"

    #Using this as a delay to avoid testing contents before they have a chance to load
    assert_selector "h1", text: "High Flights Soaring", wait: 15
    # Timing related errors when this is removed.  The wait above does not seem sufficient
    take_screenshot

    assert_equal 'Glider-2 Reserve', find('table thead tr th:nth-child(3)').text

    # Assert that the specific cell contains "-" which implies no reservations
    within "table" do
      cell_text = find("tr:nth-child(1) td:nth-child(3)").text
      assert_equal "", cell_text
    end
  end

end
