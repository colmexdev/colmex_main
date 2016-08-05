class ProgramasAcademicosController < ApplicationController
  def inicio
    @licenciaturas = Curso.where(:programa => "Licenciatura")
    @maestrias = Curso.where(:programa => "Maestría")
    @doctorados = Curso.where(:programa => "Doctorado")
  end

  def admisiones
  end

  def maestrias
    @maestrias = Curso.where(:programa => "Maestría")  
  end

  def licenciaturas
    @licenciaturas = Curso.where(:programa => "Licenciatura")
  end

  def doctorados
    @doctorados = Curso.where(:programa => "Doctorado")
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
