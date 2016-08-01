class ProgramasAcademicosController < ApplicationController
  def inicio
    @licenciaturas = Curso.where(:programa => "Licenciatura").pluck([:titulo, :traduccion_tit, :liga])
    @maestrias = Curso.where(:programa => "Maestría").pluck([:titulo, :traduccion_tit, :liga])
    @doctorados = Curso.where(:programa => "Doctorado").pluck([:titulo, :traduccion_tit, :liga])
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
end
