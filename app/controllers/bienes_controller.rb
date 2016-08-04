class BienesController < ApplicationController
  def index
    @transparencias = Documento.where(:tipo => "Transparencia")
  end
end
