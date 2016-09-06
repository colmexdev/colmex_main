require 'test_helper'

class CatedrasControllerTest < ActionController::TestCase
  setup do
    @catedra = catedras(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:catedras)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create catedra" do
    assert_difference('Catedra.count') do
      post :create, catedra: { descripcion: @catedra.descripcion, liga: @catedra.liga, tipo: @catedra.tipo, titulo: @catedra.titulo }
    end

    assert_redirected_to catedra_path(assigns(:catedra))
  end

  test "should show catedra" do
    get :show, id: @catedra
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @catedra
    assert_response :success
  end

  test "should update catedra" do
    patch :update, id: @catedra, catedra: { descripcion: @catedra.descripcion, liga: @catedra.liga, tipo: @catedra.tipo, titulo: @catedra.titulo }
    assert_redirected_to catedra_path(assigns(:catedra))
  end

  test "should destroy catedra" do
    assert_difference('Catedra.count', -1) do
      delete :destroy, id: @catedra
    end

    assert_redirected_to catedras_path
  end
end
