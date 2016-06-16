require 'test_helper'

class PrincipalControllerTest < ActionController::TestCase
  test "should get principal" do
    get :principal
    assert_response :success
  end

end
