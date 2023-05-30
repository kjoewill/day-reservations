require "application_system_test_case"

class HomesTest < ApplicationSystemTestCase

  test "viewing the home page" do
    visit root_path
    assert_selector "h1", text: "High Flights Soaring"
  end 

  test "Select new date at hit go" do
    visit root_path
    fill_in "datepicker", with: "09-27-2025"
    click_button "Go"
    assert_text "Day Schedules for 09/27/2025"
  end

  test "Select new date 9/27/2025 and check results" do
    visit root_path
    fill_in "datepicker", with: "09-27-2025"
    click_button "Go"

    # Assert that the specific cell contains the expected text
    within "table" do
      cell_text = find("tr:nth-child(1) td:nth-child(3)").text
      assert_equal "08:30, G2, 09-27-25", cell_text
    end
   
  end





end