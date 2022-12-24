require "test_helper"

class GeneralControllerTest < ActionDispatch::IntegrationTest
  test "should get home_page" do
    get general_home_page_url
    assert_response :success
  end

  test "should get profile" do
    get general_profile_url
    assert_response :success
  end
end
