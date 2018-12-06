require 'test_helper'

class NolControllerTest < ActionController::TestCase
  test "should get main" do
    get :main
    assert_response :success
  end

end
