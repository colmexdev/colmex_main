class PanelController < ApplicationController

  def principal
    respond_to do |format|
      format.js
    end
  end

  def panel
  end

  def index
    @set = ""
    @fields = []
    @foto = ""
    case params[:set]
		  when "Profesores eméritos"
        @set = Emerito.all
        @fields = ["nombre","fecha_anexion","centro","semblanza","semblanza_eng"]
        @foto = ["foto"]
      when "Programas docentes"
        @set = Curso.all
        @fields = ["titulo","descripcion","fecha_inicio_conv","fecha_fin_conv","fecha_inicio_clases","fecha_fin_clases","liga","tipo_curso","programa","imparte","traduccion_desc","traduccion_tit"]
        @foto = ["foto"]
      when "Directorio de Autoridades"
        @set = Personal.all
      when "Categorías de Premios"
        @set = Categorium.all
      when "Premios y distinciones"
        @set = Premiado.all
      when "Documentos varios"
        @set = Documento.all
      when "Descubres"
        @set = Descubre.all
      when "Categorías de 'Descubre'"
        @set = Content.all
      when "Imágenes de slider"
        @set = Slider.all
      when "Cátedras y seminarios"
        @set = Catedra.all
      when "Frases en página principal"
        @set = Frase.all
      when "Directorio académico"
        @set = Academico.all
      when "Usuarios gestores"
        @set = User.all
    end
    respond_to do |format|
      format.js
    end
  end
end
