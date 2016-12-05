require 'test_helper'

class ToLive::PlayersControllerTest < ActionController::TestCase
  setup do
    @to_live_player = to_live_players(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:to_live_players)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create to_live_player" do
    assert_difference('ToLive::Player.count') do
      post :create, to_live_player: { name: @to_live_player.name, wins: @to_live_player.wins }
    end

    assert_redirected_to to_live_player_path(assigns(:to_live_player))
  end

  test "should show to_live_player" do
    get :show, id: @to_live_player
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @to_live_player
    assert_response :success
  end

  test "should update to_live_player" do
    patch :update, id: @to_live_player, to_live_player: { name: @to_live_player.name, wins: @to_live_player.wins }
    assert_redirected_to to_live_player_path(assigns(:to_live_player))
  end

  test "should destroy to_live_player" do
    assert_difference('ToLive::Player.count', -1) do
      delete :destroy, id: @to_live_player
    end

    assert_redirected_to to_live_players_path
  end
end
