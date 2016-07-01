require 'test_helper'

class TipoCursosControllerTest < ActionController::TestCase
  setup do
    @tipo_curso = tipo_cursos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tipo_cursos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tipo_curso" do
    assert_difference('TipoCurso.count') do
      post :create, tipo_curso: { tipo: @tipo_curso.tipo }
    end

    assert_redirected_to tipo_curso_path(assigns(:tipo_curso))
  end

  test "should show tipo_curso" do
    get :show, id: @tipo_curso
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tipo_curso
    assert_response :success
  end

  test "should update tipo_curso" do
    patch :update, id: @tipo_curso, tipo_curso: { tipo: @tipo_curso.tipo }
    assert_redirected_to tipo_curso_path(assigns(:tipo_curso))
  end

  test "should destroy tipo_curso" do
    assert_difference('TipoCurso.count', -1) do
      delete :destroy, id: @tipo_curso
    end

    assert_redirected_to tipo_cursos_path
  end
end
