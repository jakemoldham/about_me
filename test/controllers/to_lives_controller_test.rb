require 'test_helper'

class ToLivesControllerTest < ActionController::TestCase
  setup do
    @to_life = to_lives(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:to_lives)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create to_life" do
    assert_difference('ToLive.count') do
      post :create, to_life: { player: @to_life.player, stage: @to_life.stage, wins: @to_life.wins }
    end

    assert_redirected_to to_life_path(assigns(:to_life))
  end

  test "should show to_life" do
    get :show, id: @to_life
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @to_life
    assert_response :success
  end

  test "should update to_life" do
    patch :update, id: @to_life, to_life: { player: @to_life.player, stage: @to_life.stage, wins: @to_life.wins }
    assert_redirected_to to_life_path(assigns(:to_life))
  end

  test "should destroy to_life" do
    assert_difference('ToLive.count', -1) do
      delete :destroy, id: @to_life
    end

    assert_redirected_to to_lives_path
  end
end
