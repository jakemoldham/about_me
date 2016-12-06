class ToLive::StagesController < ApplicationController
  before_action :set_to_live_stage, only: [:show, :edit, :update, :destroy]
  # access all: [:index, :show, :new, :edit, :create, :update, :destroy], user: :all
  access all: [:index], user: [:lives, :game], admin: :all, editor: :all
  layout'vim'

  # GET /to_live/stages
  def index
    @to_live_stages = ToLive::Stage.all
    if params[:new_players]
      params[:new_players].each do |np|
        ToLive::Player.find_or_create_by(name: np.upcase)
      end
    end
    if params[:commit] == "Let's Play!"
      redirect_to to_live_lives_path(stage: "one")
    end
  end

  # GET /to_live/lives
  def lives
    if session[:stages].nil?
      session[:stages] = 1 
    else
      session[:stages] += 1 
    end
    @stage = ToLive::Stage.set_stage(session[:stages])
    session[:arr] = ToLive::Stage.rand_questions if params[:stage] == "one" 
    if session[:arr].empty?
      redirect_to to_live_game_path(out_of_questions: "yep")
    end
    q_id = session[:arr].pop
    @question = ToLive::Question.find_by(id: q_id) 
    @player = ToLive::Stage.set_player(session[:arr])
    @win_player = ToLive::Stage.set_win_player(@player)
  end

  def game
    session[:stages] = 0
    session[:arr] = ToLive::Stage.rand_questions
    ToLive::Player.delete_all
    if params[:out_of_questions].present?
      redirect_to to_live_stages_path, notice: "Congrats You Both Win The Game!"
    else
      redirect_to to_live_stages_path
    end
  end

  # GET /to_live/stages/1
  def show
  end

  # GET /to_live/stages/new
  def new
    @to_live_stage = ToLive::Stage.new
  end

  # GET /to_live/stages/1/edit
  def edit
    @questions = @to_live_stage.questions.all
  end

  # POST /to_live/stages
  def create
    @to_live_stage = ToLive::Stage.new(to_live_stage_params)

    if @to_live_stage.save
      redirect_to @to_live_stage, notice: 'Stage was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /to_live/stages/1
  def update
    if @to_live_stage.update(to_live_stage_params)
      redirect_to @to_live_stage, notice: 'Stage was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /to_live/stages/1
  def destroy
    @to_live_stage.destroy
    redirect_to to_live_stages_url, notice: 'Stage was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_to_live_stage
      @to_live_stage = ToLive::Stage.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def to_live_stage_params
      params.require(:to_live_stage).permit(:title, :description)
    end
end
