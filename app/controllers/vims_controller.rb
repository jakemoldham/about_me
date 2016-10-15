class VimsController < ApplicationController
  access all: [:index], admin: :all
  before_action :set_vim, only: [:show, :edit, :update, :destroy]
  layout "vim"

  # GET /vims
  # GET /vims.json
  def index
    @vims = Vim.all
  end

  # GET /vims/1
  # GET /vims/1.json
  def show
  end

  # GET /vims/new
  def new
    @vim = Vim.new
  end

  # GET /vims/1/edit
  def edit
  end

  # POST /vims
  # POST /vims.json
  def create
    @vim = Vim.new(vim_params)

    respond_to do |format|
      if @vim.save
        format.html { redirect_to @vim, notice: 'Vim was successfully created.' }
        format.json { render :show, status: :created, location: @vim }
      else
        format.html { render :new }
        format.json { render json: @vim.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vims/1
  # PATCH/PUT /vims/1.json
  def update
    respond_to do |format|
      if @vim.update(vim_params)
        format.html { redirect_to @vim, notice: 'Vim was successfully updated.' }
        format.json { render :show, status: :ok, location: @vim }
      else
        format.html { render :edit }
        format.json { render json: @vim.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vims/1
  # DELETE /vims/1.json
  def destroy
    @vim.destroy
    respond_to do |format|
      format.html { redirect_to vims_url, notice: 'Vim was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vim
      @vim = Vim.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vim_params
      params.require(:vim).permit(:title, :code, :description)
    end
end
