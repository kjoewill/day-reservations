require "test_helper"

class DaySchedulesControllerTest < ActionDispatch::IntegrationTest
  test "should get modify" do
    get day_schedules_modify_url
    assert_response :success
  end
end
