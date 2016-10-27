class ToLivesController < ApplicationController
  before_action :set_to_life, only: [:show, :edit, :update, :destroy]
  access all: [:index, :show, :new, :edit, :create, :update, :destroy], user: :all

  # GET /to_lives
  def index
    @to_lives = ToLive.all
  end

  # GET /to_lives/1
  def show
  end

  # GET /to_lives/new
  def new
    @to_life = ToLive.new
  end

  # GET /to_lives/1/edit
  def edit
  end

  # POST /to_lives
  def create
    @to_life = ToLive.new(to_life_params)

    if @to_life.save
      redirect_to @to_life, notice: 'To live was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /to_lives/1
  def update
    if @to_life.update(to_life_params)
      redirect_to @to_life, notice: 'To live was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /to_lives/1
  def destroy
    @to_life.destroy
    redirect_to to_lives_url, notice: 'To live was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_to_life
      @to_life = ToLive.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def to_life_params
      params.require(:to_life).permit(:player, :stage, :wins)
    end
end
