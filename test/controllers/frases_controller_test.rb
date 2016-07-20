require 'test_helper'

class FrasesControllerTest < ActionController::TestCase
  setup do
    @frase = frases(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:frases)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create frase" do
    assert_difference('Frase.count') do
      post :create, frase: { autor: @frase.autor, cita: @frase.cita }
    end

    assert_redirected_to frase_path(assigns(:frase))
  end

  test "should show frase" do
    get :show, id: @frase
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @frase
    assert_response :success
  end

  test "should update frase" do
    patch :update, id: @frase, frase: { autor: @frase.autor, cita: @frase.cita }
    assert_redirected_to frase_path(assigns(:frase))
  end

  test "should destroy frase" do
    assert_difference('Frase.count', -1) do
      delete :destroy, id: @frase
    end

    assert_redirected_to frases_path
  end
end
