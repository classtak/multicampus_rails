require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get lotto" do
    get :lotto
    assert_response :success
  end

end
