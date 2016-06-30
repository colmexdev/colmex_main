require 'test_helper'

class EmeritosControllerTest < ActionController::TestCase
  setup do
    @emerito = emeritos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:emeritos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create emerito" do
    assert_difference('Emerito.count') do
      post :create, emerito: { centro: @emerito.centro, fecha_anexion: @emerito.fecha_anexion, nombre: @emerito.nombre, semblanza: @emerito.semblanza }
    end

    assert_redirected_to emerito_path(assigns(:emerito))
  end

  test "should show emerito" do
    get :show, id: @emerito
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @emerito
    assert_response :success
  end

  test "should update emerito" do
    patch :update, id: @emerito, emerito: { centro: @emerito.centro, fecha_anexion: @emerito.fecha_anexion, nombre: @emerito.nombre, semblanza: @emerito.semblanza }
    assert_redirected_to emerito_path(assigns(:emerito))
  end

  test "should destroy emerito" do
    assert_difference('Emerito.count', -1) do
      delete :destroy, id: @emerito
    end

    assert_redirected_to emeritos_path
  end
end
