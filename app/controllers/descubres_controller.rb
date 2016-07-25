class DescubresController < ApplicationController
  before_action :set_descubre, only: [:show, :edit, :update, :destroy]

  # GET /descubres
  # GET /descubres.json
  def index
    @descubres = Descubre.all
  end

  # GET /descubres/1
  # GET /descubres/1.json
  def show
  end

  # GET /descubres/new
  def new
    @descubre = Descubre.new
  end

  # GET /descubres/1/edit
  def edit
  end

  # POST /descubres
  # POST /descubres.json
  def create
    @descubre = Descubre.new(descubre_params)
    respond_to do |format|
      if @descubre.save
        format.html { redirect_to @descubre, notice: 'Nueva entrada de Descubre creada exitosamente.' }
        format.json { render :show, status: :created, location: @descubre }
      else
        format.html { render :new }
        format.json { render json: @descubre.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /descubres/1
  # PATCH/PUT /descubres/1.json
  def update
    params[:tags] = params[:tags].to_s.downcase.split(",")
    respond_to do |format|
      if @descubre.update(descubre_params)
        format.html { redirect_to @descubre, notice: 'Entrada de Descubre editada con éxito.' }
        format.json { render :show, status: :ok, location: @descubre }
      else
        format.html { render :edit }
        format.json { render json: @descubre.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /descubres/1
  # DELETE /descubres/1.json
  def destroy
    @descubre.destroy
    respond_to do |format|
      format.html { redirect_to descubres_url, notice: 'Descubre was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_descubre
      @descubre = Descubre.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def descubre_params
      params.require(:descubre).permit(:titulo, :liga, :contenido, :fecha_publicacion, :fecha_limite_pub, :imagen, :tags)
    end
end
