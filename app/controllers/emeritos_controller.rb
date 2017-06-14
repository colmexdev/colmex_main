class EmeritosController < ApplicationController
  before_action :set_emerito, only: [:show, :edit, :update, :destroy]

  # GET /emeritos
  # GET /emeritos.json
  def index
    @emeritos = Emerito.all
    respond_to do |format|
      format.js
    end
  end

  # GET /emeritos/1
  # GET /emeritos/1.json
  def show
  end

  # GET /emeritos/new
  def new
    @emerito = Emerito.new
  end

  # GET /emeritos/1/edit
  def edit
  end

  # POST /emeritos
  # POST /emeritos.json
  def create
    @emerito = Emerito.new(emerito_params)

    respond_to do |format|
      if @emerito.save
        format.html { redirect_to @emerito, notice: 'Emerito was successfully created.' }
        format.json { render :show, status: :created, location: @emerito }
      else
        format.html { render :new }
        format.json { render json: @emerito.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /emeritos/1
  # PATCH/PUT /emeritos/1.json
  def update
    respond_to do |format|
      if @emerito.update(emerito_params)
        format.html { redirect_to @emerito, notice: 'Emerito was successfully updated.' }
        format.json { render :show, status: :ok, location: @emerito }
      else
        format.html { render :edit }
        format.json { render json: @emerito.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /emeritos/1
  # DELETE /emeritos/1.json
  def destroy
    @emerito.destroy
    respond_to do |format|
      format.html { redirect_to emeritos_url, notice: 'Emerito was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_emerito
      @emerito = Emerito.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def emerito_params
      params.require(:emerito).permit(:nombre, :fecha_anexion, :centro, :semblanza, :foto, :semblanza_eng)
    end
end
