class ToLiveQuestionsController < ApplicationController
  before_action :set_to_live_question, only: [:show, :edit, :update, :destroy]
  access all: [:index, :show, :new, :edit, :create, :update, :destroy], user: :all

  # GET /to_live_questions
  def index
    @to_live_questions = ToLiveQuestion.all
  end

  # GET /to_live_questions/1
  def show
  end

  # GET /to_live_questions/new
  def new
    @to_live_question = ToLiveQuestion.new
  end

  # GET /to_live_questions/1/edit
  def edit
  end

  # POST /to_live_questions
  def create
    @to_live_question = ToLiveQuestion.new(to_live_question_params)

    if @to_live_question.save
      redirect_to @to_live_question, notice: 'To live question was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /to_live_questions/1
  def update
    if @to_live_question.update(to_live_question_params)
      redirect_to @to_live_question, notice: 'To live question was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /to_live_questions/1
  def destroy
    @to_live_question.destroy
    redirect_to to_live_questions_url, notice: 'To live question was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_to_live_question
      @to_live_question = ToLiveQuestion.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def to_live_question_params
      params.require(:to_live_question).permit(:title, :body, :answer)
    end
end
