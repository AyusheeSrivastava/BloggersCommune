require 'test_helper'

class BlogControllerControllerTest < ActionDispatch::IntegrationTest
  test "should get create_blog" do
    get blog_controller_create_blog_url
    assert_response :success
  end

  test "should get edit_blog" do
    get blog_controller_edit_blog_url
    assert_response :success
  end

  test "should get view_blog" do
    get blog_controller_view_blog_url
    assert_response :success
  end

end
