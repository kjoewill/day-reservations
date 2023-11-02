require "application_system_test_case"

class UserStory1Test < ApplicationSystemTestCase

  test "viewing the home page" do

    visit root_path
    assert_selector "h1", text: "High Flights Soaring", wait: 5

    today = Date.today
    formatted_date = today.strftime('%m/%d/%Y')
    reservations_text = "Reservations for #{formatted_date}"
    assert_text reservations_text

    datepicker_value = find_field("datepicker").value
    datepicker_string = Date.parse(datepicker_value).strftime('%m/%d/%Y')
    assert_equal formatted_date, datepicker_string

    # Verify the header row of the schedule 
    assert_equal 'Time', find('table thead tr th:nth-child(1)').text
    assert_equal 'Glider-1 Reserve', find('table thead tr th:nth-child(2)').text
    assert_equal 'Glider-2 Reserve', find('table thead tr th:nth-child(3)').text
    assert_equal 'Glider-3 Reserve', find('table thead tr th:nth-child(4)').text
    assert_equal 'Glider-4 Reserve', find('table thead tr th:nth-child(5)').text

    #verify second row
    assert_equal '09:00', find('table tbody tr:nth-child(1) td:nth-child(1)').text
    assert_equal '', find('table tbody tr:nth-child(1) td:nth-child(2)').text
    assert_equal '', find('table tbody tr:nth-child(1) td:nth-child(3)').text
    assert_equal '', find('table tbody tr:nth-child(1) td:nth-child(4)').text
    assert_equal '', find('table tbody tr:nth-child(1) td:nth-child(5)').text

  end 

end