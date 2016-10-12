require 'test_helper'

class VimsControllerTest < ActionController::TestCase
  setup do
    @vim = vims(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vims)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vim" do
    assert_difference('Vim.count') do
      post :create, vim: { code: @vim.code, description: @vim.description, title: @vim.title }
    end

    assert_redirected_to vim_path(assigns(:vim))
  end

  test "should show vim" do
    get :show, id: @vim
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vim
    assert_response :success
  end

  test "should update vim" do
    patch :update, id: @vim, vim: { code: @vim.code, description: @vim.description, title: @vim.title }
    assert_redirected_to vim_path(assigns(:vim))
  end

  test "should destroy vim" do
    assert_difference('Vim.count', -1) do
      delete :destroy, id: @vim
    end

    assert_redirected_to vims_path
  end
end
