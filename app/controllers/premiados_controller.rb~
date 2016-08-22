class PremiadosController < ApplicationController
  before_action :set_premiado, only: [:show, :edit, :update, :destroy]

  # GET /premiados
  # GET /premiados.json
  def index
    @premiados = Premiado.all
  end

  # GET /premiados/1
  # GET /premiados/1.json
  def show
  end

  # GET /premiados/new
  def new
    @premiado = Premiado.new
  end

  # GET /premiados/1/edit
  def edit
  end

  # POST /premiados
  # POST /premiados.json
  def create
    @premiado = Premiado.new(premiado_params)

    respond_to do |format|
      if @premiado.save
        format.html { redirect_to @premiado, notice: 'Premiado was successfully created.' }
        format.json { render :show, status: :created, location: @premiado }
      else
        format.html { render :new }
        format.json { render json: @premiado.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /premiados/1
  # PATCH/PUT /premiados/1.json
  def update
    respond_to do |format|
      if @premiado.update(premiado_params)
        format.html { redirect_to @premiado, notice: 'Premiado was successfully updated.' }
        format.json { render :show, status: :ok, location: @premiado }
      else
        format.html { render :edit }
        format.json { render json: @premiado.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /premiados/1
  # DELETE /premiados/1.json
  def destroy
    @premiado.destroy
    respond_to do |format|
      format.html { redirect_to premiados_url, notice: 'Premiado was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_premiado
      @premiado = Premiado.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def premiado_params
      params.require(:premiado).permit(:nombre, :descripcion, :tipo)
    end
end
