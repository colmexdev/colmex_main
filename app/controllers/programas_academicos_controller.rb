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
    @cursos = Curso.where(:programa => "Curso")
  end

  def presenciales
    respond_to do |format|
      format.js
    end
  end

  def electronicos
    respond_to do |format|
      format.js
    end
  end
end
