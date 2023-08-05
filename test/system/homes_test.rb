require "application_system_test_case"

class HomesTest < ApplicationSystemTestCase

  test "viewing the home page" do
    visit root_path
    assert_selector "h1", text: "High Flights Soaring", wait: 5
  end 

  test "Select new date at hit go" do
    visit root_path
    fill_in "datepicker", with: "09-27-2025"
    click_button "Go"
    assert_text "Reservations for 09/27/2025"
  end

  test "Select new date 9/27/2025 and check results" do
    visit root_path
    fill_in "datepicker", with: "09-27-2025"
    click_button "Go"

    #Using this as a delay to avoid testing contents before they have a chance to load
    assert_selector "h1", text: "High Flights Soaring", wait: 10

    take_screenshot

    # Assert that the specific cell contains the expected text
    within "table" do
      cell_text = find("tr:nth-child(2) td:nth-child(3)").text
      assert_equal "08:30, G2, 09-27-25", cell_text

      cell_text = find("tr:nth-child(3) td:nth-child(3)").text
      assert_equal "09:00, G2, 09-27-25", cell_text

      cell_text = find("tr:nth-child(4) td:nth-child(3)").text
      assert_equal "09:30, G2, 09-27-25", cell_text

      cell_text = find("tr:nth-child(5) td:nth-child(3)").text
      assert_equal "10:00, G2, 09-27-25", cell_text

      cell_text = find("tr:nth-child(6) td:nth-child(3)").text
      assert_equal "10:30, G2, 09-27-25", cell_text

      cell_text = find("tr:nth-child(7) td:nth-child(3)").text
      assert_equal "11:00, G2, 09-27-25", cell_text
    end
   
  end





end