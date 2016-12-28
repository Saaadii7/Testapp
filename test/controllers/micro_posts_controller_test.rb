require 'test_helper'

class MicroPostsControllerTest < ActionDispatch::IntegrationTest
  test "should get Index" do
    get micro_posts_Index_url
    assert_response :success
  end

  test "should get New" do
    get micro_posts_New_url
    assert_response :success
  end

  test "should get Edit" do
    get micro_posts_Edit_url
    assert_response :success
  end

  test "should get Show" do
    get micro_posts_Show_url
    assert_response :success
  end

end
