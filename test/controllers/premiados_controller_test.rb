require 'test_helper'

class PremiadosControllerTest < ActionController::TestCase
  setup do
    @premiado = premiados(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:premiados)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create premiado" do
    assert_difference('Premiado.count') do
      post :create, premiado: { descripcion: @premiado.descripcion, nombre: @premiado.nombre, tipo: @premiado.tipo }
    end

    assert_redirected_to premiado_path(assigns(:premiado))
  end

  test "should show premiado" do
    get :show, id: @premiado
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @premiado
    assert_response :success
  end

  test "should update premiado" do
    patch :update, id: @premiado, premiado: { descripcion: @premiado.descripcion, nombre: @premiado.nombre, tipo: @premiado.tipo }
    assert_redirected_to premiado_path(assigns(:premiado))
  end

  test "should destroy premiado" do
    assert_difference('Premiado.count', -1) do
      delete :destroy, id: @premiado
    end

    assert_redirected_to premiados_path
  end
end
