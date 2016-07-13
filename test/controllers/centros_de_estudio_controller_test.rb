require 'test_helper'

class CentrosDeEstudioControllerTest < ActionController::TestCase
  test "should get inicio" do
    get :inicio
    assert_response :success
  end

end
