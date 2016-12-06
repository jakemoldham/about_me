class ToLive::QuestionsController < ApplicationController
  before_action :set_to_live_question, only: [:show, :edit, :update, :destroy]
  access admin: :all, editor: :all
  layout 'vim'

  # GET /to_live/questions
  def index
    @to_live_questions = ToLive::Question.all
  end

  # GET /to_live/questions/1
  def show
    @answers = @to_live_question.answers.all
  end

  # GET /to_live/questions/new
  def new
    @to_live_question = ToLive::Question.new
    @to_live_question.answers.new
  end

  # GET /to_live/questions/1/edit
  def edit
  end

  # POST /to_live/questions
  def create
    @to_live_question = ToLive::Question.new(to_live_question_params)

    if @to_live_question.save
      redirect_to to_live_questions_path, notice: 'Question was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /to_live/questions/1
  def update
    if @to_live_question.update(to_live_question_params)
      redirect_to to_live_questions_path, notice: 'Question was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /to_live/questions/1
  def destroy
    @to_live_question.destroy
    redirect_to to_live_questions_url, notice: 'Question was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_to_live_question
      @to_live_question = ToLive::Question.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def to_live_question_params
      params.require(:to_live_question).permit(:title, :body, answers_attributes: [:id, :answer, :choose, :correct])
    end
end
