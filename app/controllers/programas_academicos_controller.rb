class ProgramasAcademicosController < ApplicationController
  def inicio
    @licenciaturas = Curso.where(:programa => "Licenciatura").order(:titulo)
    @maestrias = Curso.where(:programa => "Maestría").order(:titulo)
    @doctorados = Curso.where(:programa => "Doctorado").order(:titulo)
  end

  def admisiones
    @licenciaturas = Curso.where(:programa => "Licenciatura").order(:titulo)
    @maestrias = Curso.where(:programa => "Maestría").order(:titulo)
    @doctorados = Curso.where(:programa => "Doctorado").order(:titulo)
  end

  def programas
    @licenciaturas = Curso.where(:programa => "Licenciatura").order(:titulo)
    @maestrias = Curso.where(:programa => "Maestría").order(:titulo)
    @doctorados = Curso.where(:programa => "Doctorado").order(:titulo)
    respond_to do |format|
      format.js
    end
  end

  def convocatorias
		@convocatorias = Curso.where(:programa => "Convocatoria").order(:titulo)
    respond_to do |format|
      format.js
    end
  end

  def proceso
    respond_to do |format|
      format.js
    end
  end

  def calendario_escolar
  end

  def maestrias
    @maestrias = Curso.where(:programa => "Maestría").order(:titulo)
  end

  def licenciaturas
    @licenciaturas = Curso.where(:programa => "Licenciatura").order(:titulo)
  end

  def doctorados
    @doctorados = Curso.where(:programa => "Doctorado").order(:titulo)
  end

  def cursos
    @electornicos = Curso.where("programa = ? AND tipo_curso = ?", "Curso", "En línea")
  end

  def presenciales
    @presenciales = Curso.where("programa = ? AND tipo_curso = ?", "Curso", "Presencial")
    respond_to do |format|
      format.js
    end
  end

  def electronicos
    @electronicos = Curso.where("programa = ? AND tipo_curso = ?", "Curso", "En línea")
    respond_to do |format|
      format.js
    end
  end

  def catedras_y_seminarios
    @catedras = Catedra.where("tipo = ?", "Cátedra")
  end

  def catedras
    @catedras = Catedra.where("tipo = ?", "Cátedra")
    respond_to do |format|
      format.js
    end
  end

  def seminarios
    @seminarios = Catedra.where("tipo = ?", "Seminario")
    respond_to do |format|
      format.js
    end
  end
end
