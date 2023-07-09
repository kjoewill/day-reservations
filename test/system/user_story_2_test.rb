require "application_system_test_case"

class UserStory2Test < ApplicationSystemTestCase

  test "Select new date to view and verify results" do

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

      cell_text = find("tr:nth-child(2) td:nth-child(3)").text
      assert_equal "09:00, G2, 09-27-25", cell_text

      cell_text = find("tr:nth-child(3) td:nth-child(3)").text
      assert_equal "09:30, G2, 09-27-25", cell_text

      cell_text = find("tr:nth-child(4) td:nth-child(3)").text
      assert_equal "10:00, G2, 09-27-25", cell_text

      cell_text = find("tr:nth-child(5) td:nth-child(3)").text
      assert_equal "10:30, G2, 09-27-25", cell_text

      cell_text = find("tr:nth-child(6) td:nth-child(3)").text
      assert_equal "11:00, G2, 09-27-25", cell_text
    end
  end
   
end

