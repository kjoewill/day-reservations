require "application_system_test_case"

class UserStory2Test < ApplicationSystemTestCase

  test "Reserve a time for G2" do

    visit root_path
    fill_in "datepicker", with: "09-27-2100"
    click_button "Go"
    assert_text "09/27/2100"

    find('th', text: 'Glider-2').click_link('Reserve')

    assert_selector "h1", text: "High Flights Soaring", wait: 5

    # CSS selector to find the first input field
    text_field = all('input[type="text"]').first
    text_field.fill_in(with: '08:30, G2, 09-27-2100')

    within('form') do
      click_button 'Save'
    end
    assert_current_path(root_path(datepicker: Date.new(2100, 9, 27)))

     # Assert that the specific cell contains the expected text
     within "table" do
      cell_text = find("tr:nth-child(1) td:nth-child(3)").text
      assert_equal "08:30, G2, 09-27-2100", cell_text

      cell_text = find("tr:nth-child(2) td:nth-child(3)").text
      assert_equal "", cell_text
    end

  end

end