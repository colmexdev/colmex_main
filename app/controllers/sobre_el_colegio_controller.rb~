class SobreElColegioController < ApplicationController
  def inicio
  end

  def premios_y_distinciones
    @categorias = Categorium.all
  end

  def documentacion_institucional
    @estatutos = Documento.where(:tipo => "Estatuto")
    @actas = Documento.where(:tipo => "Junta")
    @informes = Documento.where(:tipo => "Informe")
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
  end

  def autoridades
 
  end

  def profesores_emeritos
    @profesores = Emerito.all
    @centros = ['CEAA', 'CEDUA', 'CEE', 'CEH', 'CEI', 'CELL', 'CES']
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

  def administracion
    respond_to do |format|
      format.js
    end
  end
end
