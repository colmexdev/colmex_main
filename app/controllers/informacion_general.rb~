class InformacionGeneralController < ApplicationController

  def historia_75_años
  end

  def premios_y_distinciones
    @categorias = Categorium.all
    @premiados = Premiado.where("tipo_premio = ?", "Comunidad")
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
    @estatuto_organico = Documento.where("tipo = ? AND nombre LIKE ?","Estatuto","%Orgánico%").first
  end

  def autoridades
    @actas = Documento.where(:tipo => "Junta")
  end

  def profesores_emeritos
    @profesores = Emerito.all
  end

  def sobre_el_colegio
  end

  def transparencia
  end

  def licitaciones
    respond_to do |format|
      format.js
    end
  end

  def bienes
    @transparencias = Documento.where(:tipo => "Transparencia")
    respond_to do |format|
      format.js
    end
  end

  def asamblea
    respond_to do |format|
      format.js
    end
  end

  def operativas
    @operativas = Personal.where("seccion = ? AND nombre = ?", "Operativas", "Gabriela Said Reyes").union(Personal.where("seccion = ? AND nombre = ?", "Operativas", "Valentina Riquelme Molina")).union(Personal.where("seccion = ? AND nombre = ?", "Operativas", "Laura Valverde González")).union(Personal.where("seccion = ? AND nombre = ?", "Operativas", "Quetzalli Padilla Dulché")).union(Personal.where("seccion = ? AND nombre = ?", "Operativas", "José Luis Arciga Torres")).union(Personal.where("seccion = ? AND nombre = ?", "Operativas", "León Ruiz Chávez")).union(Personal.where("seccion = ? AND nombre = ?", "Operativas", "Ernesto Arturo Hernández Camarillo")).union(Personal.where("seccion = ? AND nombre = ?", "Operativas", "Alejandro Castro González"))
    respond_to do |format|
      format.js
    end
  end

  def junta
    @juntas = Personal.where(:seccion => "Junta")
    respond_to do |format|
      format.js
    end
  end

  def presidencia
    @presidencias = Personal.where(:seccion => "Presidencia")
    respond_to do |format|
      format.js
    end
  end

  def centros_de_estudio
    @centros = Personal.where(:seccion => "Centros")
    respond_to do |format|
      format.js
    end
  end

  def biblioteca
    @bibliotecas = Personal.where(:seccion => "Biblioteca")
    respond_to do |format|
      format.js
    end
  end

  def administracion
    @admins = Personal.where(:seccion => "Administración")
    respond_to do |format|
      format.js
    end
  end

  def comunidad
    @categorias = Categorium.all
    @premiados = Premiado.where("tipo_premio = ?", "Comunidad")
    respond_to do |format|
      format.js
    end
  end

  def colegio
    @premiados = Premiado.where("tipo_premio = ?", "Colegio")
    respond_to do |format|
      format.js
    end
  end 
end
