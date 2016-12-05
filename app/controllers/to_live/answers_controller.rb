class ToLive::AnswersController < ApplicationController
  before_action :set_to_live_answer, only: [:show, :edit, :update, :destroy]
  access all: [:index, :show, :new, :edit, :create, :update, :destroy], user: :all

  # GET /to_live/answers
  def index
    @to_live_answers = ToLive::Answer.all
  end

  # GET /to_live/answers/1
  def show
  end

  # GET /to_live/answers/new
  def new
    @to_live_answer = ToLive::Answer.new
  end

  # GET /to_live/answers/1/edit
  def edit
  end

  # POST /to_live/answers
  def create
    @to_live_answer = ToLive::Answer.new(to_live_answer_params)

    if @to_live_answer.save
      redirect_to @to_live_answer, notice: 'Answer was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /to_live/answers/1
  def update
    if @to_live_answer.update(to_live_answer_params)
      redirect_to @to_live_answer, notice: 'Answer was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /to_live/answers/1
  def destroy
    @to_live_answer.destroy
    redirect_to to_live_answers_url, notice: 'Answer was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_to_live_answer
      @to_live_answer = ToLive::Answer.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def to_live_answer_params
      params.require(:to_live_answer).permit(:question_id, :answer, :choose, :correct)
    end
end
