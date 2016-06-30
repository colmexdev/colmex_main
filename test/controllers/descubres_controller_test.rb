require 'test_helper'

class DescubresControllerTest < ActionController::TestCase
  setup do
    @descubre = descubres(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:descubres)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create descubre" do
    assert_difference('Descubre.count') do
      post :create, descubre: { contenido: @descubre.contenido, descripcion: @descubre.descripcion, liga: @descubre.liga, titulo: @descubre.titulo }
    end

    assert_redirected_to descubre_path(assigns(:descubre))
  end

  test "should show descubre" do
    get :show, id: @descubre
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @descubre
    assert_response :success
  end

  test "should update descubre" do
    patch :update, id: @descubre, descubre: { contenido: @descubre.contenido, descripcion: @descubre.descripcion, liga: @descubre.liga, titulo: @descubre.titulo }
    assert_redirected_to descubre_path(assigns(:descubre))
  end

  test "should destroy descubre" do
    assert_difference('Descubre.count', -1) do
      delete :destroy, id: @descubre
    end

    assert_redirected_to descubres_path
  end
end
