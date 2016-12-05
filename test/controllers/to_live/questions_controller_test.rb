require 'test_helper'

class ToLive::QuestionsControllerTest < ActionController::TestCase
  setup do
    @to_live_question = to_live_questions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:to_live_questions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create to_live_question" do
    assert_difference('ToLive::Question.count') do
      post :create, to_live_question: { answer: @to_live_question.answer, body: @to_live_question.body, stage_id: @to_live_question.stage_id, title: @to_live_question.title, true_false: @to_live_question.true_false }
    end

    assert_redirected_to to_live_question_path(assigns(:to_live_question))
  end

  test "should show to_live_question" do
    get :show, id: @to_live_question
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @to_live_question
    assert_response :success
  end

  test "should update to_live_question" do
    patch :update, id: @to_live_question, to_live_question: { answer: @to_live_question.answer, body: @to_live_question.body, stage_id: @to_live_question.stage_id, title: @to_live_question.title, true_false: @to_live_question.true_false }
    assert_redirected_to to_live_question_path(assigns(:to_live_question))
  end

  test "should destroy to_live_question" do
    assert_difference('ToLive::Question.count', -1) do
      delete :destroy, id: @to_live_question
    end

    assert_redirected_to to_live_questions_path
  end
end
