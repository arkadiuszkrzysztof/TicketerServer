require 'test_helper'

class SchedulesControllerTest < ActionController::TestCase
  test "should get show" do
    get :show
    assert_response :success
  end

end
