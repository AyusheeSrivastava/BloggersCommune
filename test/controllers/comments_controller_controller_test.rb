require 'test_helper'

class CommentsControllerControllerTest < ActionDispatch::IntegrationTest
  test "should get users_comment" do
    get comments_controller_users_comment_url
    assert_response :success
  end

end
