class InformacionGeneralController < ApplicationController

  def historia_75_años
  end

  def premios_y_distinciones
    @categorias = Categorium.all
    @premiados = Premiado.where("tipo_premio = ?", "Comunidad")
  end

  def documentacion_institucional
    @actas = Documento.where(:tipo => "Junta")
 		@estatutos = Documento.where(:tipo => "Estatuto").first

  end

  def informacion_para_estudiantes
    @reglamento = Documento.where(:tipo => "Reglamento")
    respond_to do |format|
      format.js
    end
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
    #respond_to do |format|
    #  format.js
    #end
  end

  def asamblea
    respond_to do |format|
      format.js
    end
  end

  def operativas
    @operativas = Personal.where("seccion = ? AND nombre = ?", "Operativas", "Elizabeth Serratos Armendariz").union(Personal.where("seccion = ? AND nombre = ?", "Operativas", "Quetzalli Padilla Dulché")).union(Personal.where("seccion = ? AND nombre = ?", "Operativas", "León Ruiz Chávez")).union(Personal.where("seccion = ? AND nombre = ?", "Operativas", "Alejandra Tapia Silva")).union(Personal.where("seccion = ? AND nombre = ?", "Operativas", "Lizeth Mora Castillo"))
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
		@asociados = Personal.where(:seccion => "Asociado")
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

  def unidades_de_apoyo
    @bibliotecas = Personal.where("seccion = ? AND nombre = ?","Unidades de apoyo", "Micaela Chávez Villa").union(Personal.where("seccion = ? AND nombre = ?","Unidades de apoyo", "Gabriela Said Reyes")).union(Personal.where("seccion = ? AND nombre = ?","Unidades de apoyo", "José Luis Arciga Torres"))
    respond_to do |format|
      format.js
    end
  end

  def administracion
    @admins = Personal.where("seccion = ? AND nombre = ?", "Administración", "Álvaro Baillet Gallardo").union(Personal.where("seccion = ? AND nombre = ?", "Administración", "Laura Valverde González")).union(Personal.where("seccion = ? AND nombre = ?", "Administración", "Víctor Fernando Ruiz Aguilar")).union(Personal.where("seccion = ? AND nombre = ?", "Administración", "Gerardo Gutiérrez Cortez")).union(Personal.where("seccion = ? AND nombre = ?", "Administración", "Adrián Rubio Rangel")).union(Personal.where("seccion = ? AND nombre = ?", "Administración", "Raúl Cabrera Soto")).union(Personal.where("seccion = ? AND nombre = ?", "Administración", "Luis Manuel Olivares Estrada")).union(Personal.where("seccion = ? AND nombre = ?", "Administración", "Felipe Alejandro Castro González"))
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

  def directorio_academico
    @academicos = Academico.order(nombre: :desc).all
		gon.academicos = @academicos.to_json
		gon.academicos_size = @academicos.size
  end 
end
