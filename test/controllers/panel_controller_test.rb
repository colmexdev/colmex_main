require 'test_helper'

class PanelControllerTest < ActionController::TestCase
  test "should get administrar" do
    get :administrar
    assert_response :success
  end

end
