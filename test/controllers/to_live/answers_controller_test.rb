require 'test_helper'

class ToLive::AnswersControllerTest < ActionController::TestCase
  setup do
    @to_live_answer = to_live_answers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:to_live_answers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create to_live_answer" do
    assert_difference('ToLive::Answer.count') do
      post :create, to_live_answer: { answer: @to_live_answer.answer, choose: @to_live_answer.choose, correct: @to_live_answer.correct, question_id: @to_live_answer.question_id }
    end

    assert_redirected_to to_live_answer_path(assigns(:to_live_answer))
  end

  test "should show to_live_answer" do
    get :show, id: @to_live_answer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @to_live_answer
    assert_response :success
  end

  test "should update to_live_answer" do
    patch :update, id: @to_live_answer, to_live_answer: { answer: @to_live_answer.answer, choose: @to_live_answer.choose, correct: @to_live_answer.correct, question_id: @to_live_answer.question_id }
    assert_redirected_to to_live_answer_path(assigns(:to_live_answer))
  end

  test "should destroy to_live_answer" do
    assert_difference('ToLive::Answer.count', -1) do
      delete :destroy, id: @to_live_answer
    end

    assert_redirected_to to_live_answers_path
  end
end
