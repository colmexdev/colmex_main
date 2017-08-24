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
		@convocatorias = Curso.where("programa = ? AND fecha_fin_conv >= ?", "Licenciatura", Date.current()).union(Curso.where("programa = ? AND fecha_fin_conv >= ?", "Maestría", Date.current())).union(Curso.where("programa = ? AND fecha_fin_conv >= ?", "Doctorado", Date.current())).union(Curso.where("programa = ? AND fecha_fin_conv >= ?", "Curso", Date.current())).order(:titulo)
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
    #@electronicos = Curso.where("programa = ? AND tipo_curso = ?", "Curso", "En línea")
    @presenciales = Curso.where("programa = ? AND tipo_curso = ? and fecha_fin_conv >= ?", "Curso", "Presencial", Date.current())
  end

  def presenciales
    @presenciales = Curso.where("programa = ? AND tipo_curso = ? and fecha_fin_conv >= ?", "Curso", "Presencial", Date.current())
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
		@centros = Catedra.distinct.pluck(:tipo)
    @catedras = Catedra.where(("tipo = ? AND " + (params[:locale] == "en" ? "titulo_eng" : "titulo") + " != ''"), "Institucionales")
  end

  def catedras
    @catedras = Catedra.where(("tipo = ? AND " + (params[:locale] == "en" ? "titulo_eng" : "titulo") + " != ''"), params[:grupo])
    respond_to do |format|
      format.js
    end
  end

  def seminarios
    @seminarios = Catedra.where("tipo = ? AND titulo LIKE ?", "Seminario", "%Violencia y Paz%").union(Catedra.where("tipo = ? AND titulo LIKE ?", "Seminario", "%México-España%")).union(Catedra.where("tipo = ? AND titulo LIKE ?", "Seminario", "%Diálogos%")).union(Catedra.where("tipo = ? AND titulo LIKE ?", "Seminario", "%Intelectual%")).union(Catedra.where("tipo = ? AND titulo LIKE ?", "Seminario", "%Historiografía%")).union(Catedra.where("tipo = ? AND titulo LIKE ?", "Seminario", "%Historia Económica%")).union(Catedra.where("tipo = ? AND titulo LIKE ?", "Seminario", "%7 Tesis%")).union(Catedra.where("tipo = ? AND titulo LIKE ?", "Seminario", "%Historia Social%")).union(Catedra.where("tipo = ? AND titulo LIKE ?", "Seminario", "%Historia Internacional%")).union(Catedra.where("tipo = ? AND titulo LIKE ?", "Seminario", "%Formación Política%")).union(Catedra.where("tipo = ? AND titulo LIKE ?", "Seminario", "%Migración Internacional%"))
    respond_to do |format|
      format.js
    end
  end
end
