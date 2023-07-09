require "test_helper"

class LayoutsTest < ActionDispatch::IntegrationTest

  test 'Home Page has correct header' do
    get root_path
    assert_select 'h1', "High Flights Soaring", 1
  end

end
