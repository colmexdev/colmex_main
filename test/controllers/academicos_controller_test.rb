require 'test_helper'

class AcademicosControllerTest < ActionController::TestCase
  setup do
    @academico = academicos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:academicos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create academico" do
    assert_difference('Academico.count') do
      post :create, academico: { adscripcion: @academico.adscripcion, correo: @academico.correo, lineas_investigacion: @academico.lineas_investigacion, nombre: @academico.nombre, pagina: @academico.pagina }
    end

    assert_redirected_to academico_path(assigns(:academico))
  end

  test "should show academico" do
    get :show, id: @academico
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @academico
    assert_response :success
  end

  test "should update academico" do
    patch :update, id: @academico, academico: { adscripcion: @academico.adscripcion, correo: @academico.correo, lineas_investigacion: @academico.lineas_investigacion, nombre: @academico.nombre, pagina: @academico.pagina }
    assert_redirected_to academico_path(assigns(:academico))
  end

  test "should destroy academico" do
    assert_difference('Academico.count', -1) do
      delete :destroy, id: @academico
    end

    assert_redirected_to academicos_path
  end
end
