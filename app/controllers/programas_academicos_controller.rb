class ProgramasAcademicosController < ApplicationController
  def inicio
    @licenciaturas = Curso.where(:programa => "Licenciatura").order(:titulo)
    @maestrias = Curso.where(:programa => "Maestría").order(:titulo)
    @doctorados = Curso.where(:programa => "Doctorado").order(:titulo)
  end

  def admisiones
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
    @presenciales = Curso.where("programa = ? AND tipo_curso = ?", "Curso", "Presencial")
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
end
