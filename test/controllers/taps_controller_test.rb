require 'test_helper'

class TapsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
