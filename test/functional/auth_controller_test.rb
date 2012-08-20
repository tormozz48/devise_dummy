require 'test_helper'

class AuthControllerTest < ActionController::TestCase
  test "should get facebook" do
    get :facebook
    assert_response :success
  end

  test "should get twitter" do
    get :twitter
    assert_response :success
  end

  test "should get vlontakte" do
    get :vlontakte
    assert_response :success
  end

end
