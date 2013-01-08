require 'test_helper'

class RsvpControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get confirm" do
    get :confirm
    assert_response :success
  end

end
