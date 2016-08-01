class SobreElColegioController < ApplicationController
  def inicio
  end

  def historia_75_años
  end

  def premios_y_distinciones
    @categorias = Categorium.all
  end

  def documentacion_institucional
    @actas = Documento.where(:tipo => "Junta")
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
