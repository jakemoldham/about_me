require 'test_helper'

class ToLive::StagesControllerTest < ActionController::TestCase
  setup do
    @to_live_stage = to_live_stages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:to_live_stages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create to_live_stage" do
    assert_difference('ToLive::Stage.count') do
      post :create, to_live_stage: { description: @to_live_stage.description, title: @to_live_stage.title }
    end

    assert_redirected_to to_live_stage_path(assigns(:to_live_stage))
  end

  test "should show to_live_stage" do
    get :show, id: @to_live_stage
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @to_live_stage
    assert_response :success
  end

  test "should update to_live_stage" do
    patch :update, id: @to_live_stage, to_live_stage: { description: @to_live_stage.description, title: @to_live_stage.title }
    assert_redirected_to to_live_stage_path(assigns(:to_live_stage))
  end

  test "should destroy to_live_stage" do
    assert_difference('ToLive::Stage.count', -1) do
      delete :destroy, id: @to_live_stage
    end

    assert_redirected_to to_live_stages_path
  end
end
