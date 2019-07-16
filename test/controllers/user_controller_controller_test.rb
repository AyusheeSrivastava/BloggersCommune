require 'test_helper'

class UserControllerControllerTest < ActionDispatch::IntegrationTest
  test "should get welcome_method" do
    get user_controller_welcome_method_url
    assert_response :success
  end

end
