class ToLive::PlayersController < ApplicationController
  before_action :set_to_live_player, only: [:show, :edit, :update, :destroy]
  access all: [:index, :show, :new, :edit, :create, :update, :destroy], user: :all

  # GET /to_live/players
  def index
    @to_live_players = ToLive::Player.all
  end

  # GET /to_live/players/1
  def show
  end

  # GET /to_live/players/new
  def new
    @to_live_player = ToLive::Player.new
  end

  # GET /to_live/players/1/edit
  def edit
  end

  # POST /to_live/players
  def create
    @to_live_player = ToLive::Player.new(to_live_player_params)

    if @to_live_player.save
      redirect_to to_live_lives_path, notice: 'Player was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /to_live/players/1
  def update
    if @to_live_player.update(to_live_player_params)
      redirect_to @to_live_player, notice: 'Player was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /to_live/players/1
  def destroy
    @to_live_player.destroy
    redirect_to to_live_players_url, notice: 'Player was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_to_live_player
      @to_live_player = ToLive::Player.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def to_live_player_params
      params.require(:to_live_player).permit(:name, :wins)
    end
end
