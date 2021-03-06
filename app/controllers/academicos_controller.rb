class AcademicosController < ApplicationController
  before_action :set_academico, only: [:show, :edit, :update, :destroy]

  # GET /academicos
  # GET /academicos.json
  def index
    @academicos = Academico.all
  end

  # GET /academicos/1
  # GET /academicos/1.json
  def show
  end

  # GET /academicos/new
  def new
    @academico = Academico.new
  end

  # GET /academicos/1/edit
  def edit
  end

  # POST /academicos
  # POST /academicos.json
  def create
    @academico = Academico.new(academico_params)

    respond_to do |format|
      if @academico.save
        format.html { redirect_to @academico, notice: 'Academico was successfully created.' }
        format.json { render :show, status: :created, location: @academico }
      else
        format.html { render :new }
        format.json { render json: @academico.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /academicos/1
  # PATCH/PUT /academicos/1.json
  def update
    respond_to do |format|
      if @academico.update(academico_params)
        format.html { redirect_to @academico, notice: 'Academico was successfully updated.' }
        format.json { render :show, status: :ok, location: @academico }
      else
        format.html { render :edit }
        format.json { render json: @academico.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /academicos/1
  # DELETE /academicos/1.json
  def destroy
    @academico.destroy
    respond_to do |format|
      format.html { redirect_to academicos_url, notice: 'Academico was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_academico
      @academico = Academico.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def academico_params
      params.require(:academico).permit(:nombre, :adscripcion, :lineas_investigacion, :correo, :pagina, :foto, :inicial)
    end
end
