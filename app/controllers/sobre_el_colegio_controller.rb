class SobreElColegioController < ApplicationController

  def historia_75_años
  end

  def premios_y_distinciones
    @categorias = Categorium.all
  end

  def documentacion_institucional
  end

  def actas
    @actas = Documento.where(:tipo => "Junta")
    respond_to do |format|
      format.js
    end
  end

  def informes
    @informes = Documento.where(:tipo => "Informe")
    respond_to do |format|
      format.js
    end
  end

  def estatutos
    @estatutos = Documento.where(:tipo => "Estatuto")
    respond_to do |format|
      format.js
    end
  end

  def historia
    @estatuto_organico = Documento.where("tipo = ? AND nombre LIKE ?","Estatuto","%Orgánico%").first
  end

  def autoridades
    @actas = Documento.where(:tipo => "Junta")
  end

  def profesores_emeritos
    @profesores = Emerito.all
  end

  def transparencia

  end

  def informacion_general

  end

  def asamblea
    respond_to do |format|
      format.js
    end
  end

  def operativas
    respond_to do |format|
      format.js
    end
  end

  def junta
    respond_to do |format|
      format.js
    end
  end

  def presidencia
    respond_to do |format|
      format.js
    end
  end

  def centros_de_estudio
    respond_to do |format|
      format.js
    end
  end

  def administracion
    respond_to do |format|
      format.js
    end
  end
end
