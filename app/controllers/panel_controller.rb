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
    @foto = []
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
        @fields = ["nombre","seccion","correo","telefono","extension","cargo","depto"]
        @foto = ["foto"]
      when "Categorías de Premios"
        @set = Categorium.all
      when "Premios y distinciones"
        @set = Premiado.all
        @fields = ["nombre","descripcion","tipo","tipo_premio","liga"]
      when "Documentos varios"
        @set = Documento.all
        @fields = ["nombre","nombre_eng","tipo","anio","liga"]
        @foto = ["archivo"]
      when "Descubres"
        @set = Descubre.all
        @fields = ["titulo","liga","contenido","fecha_publicacion","fecha_limite_pub","tags"]
        @foto = ["imagen"]
      when "Categorías de 'Descubre'"
        @set = Content.all
        @fields = ["tipo","tipo_eng"]
        @foto = ["icono"]
      when "Imágenes de slider"
        @set = Slider.all
        @fields = ["liga","fecha_expiración","posicion"]
        @foto = ["imagen","badge","badge_eng"]
      when "Cátedras y seminarios"
        @set = Catedra.all
        @fields = ["titulo","titulo_eng","descripcion","descripcion_eng","tipo","liga"]
      when "Frases en página principal"
        @set = Frase.all
        @fields = ["cita","cita_eng","autor"]
      when "Directorio académico"
        @set = Academico.all
        @fields = ["nombre","inicial","correo","adscripcion","lineas_investigacion","pagina"]
        @foto = ["foto"]
      when "Usuarios gestores"
        @set = User.all
        @fields = ["usuario","admin"]
    end
    respond_to do |format|
      format.js
    end
  end
end
