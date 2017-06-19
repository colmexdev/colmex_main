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
    @fields = {}
    @foto = {}
    case params[:set]
		  when "Profesores eméritos"
        @set = Emerito.all
        @fields = {nombre: "Nombre",fecha_anexion: "Fecha de anexión",centro: "Centro",semblanza: "Semblanza",semblanza_eng: "Semblanza (Inglés)"}
        @foto = {foto: "Foto"}
      when "Programas docentes"
        @set = Curso.all
        @fields = {titulo: "Título",descripcion: "Descripción",fecha_inicio_conv: "Inicio de convocatoria",fecha_fin_conv: "Fin de convocatoria",fecha_inicio_clases: "Inicio de clases",fecha_fin_clases: "Fin de clases",liga: "Link",programa: "Programa docente",tipo_curso: "Tipo de curso",imparte: "Impartido por",traduccion_tit: "Título (Inglés)", traduccion_desc: "Descripción (Inglés)"}
        @foto = {foto: "Foto"}
      when "Directorio de Autoridades"
        @set = Personal.all
        @fields = {nombre: "Nombre",seccion: "Sección",correo: "Correo electrónico",telefono: "Teléfono",extension: "Extensión",depto: "Departamento",cargo: "Cargo"}
        @foto = {foto: "Foto"}
      when "Categorías de Premios"
        @set = Categorium.all
      when "Premios y distinciones"
        @set = Premiado.all
        @fields = {nombre: "Nombre", descripcion: "Descripción",tipo_premio: "Otorgado a",tipo: "Sección (comunidad)",liga: "Link"}
      when "Documentos varios"
        @set = Documento.all
        @fields = {nombre: "Título",nombre_eng: "Título (Inglés)",tipo: "Sección",anio: "Año",liga: "Link"}
        @foto = {archivo: "Archivo"}
      when "Descubres"
        @set = Descubre.all
        @fields = {titulo: "Título",liga: "Link",contenido: "Categoría",fecha_publicacion: "Fecha de despliegue",fecha_limite_pub: "Fecha de expiración",tags: "Etiquetas"}
        @foto = {imagen: "Imagen"}
      when "Categorías de 'Descubre'"
        @set = Content.all
        @fields = {tipo: "Tipo",tipo_eng: "Tipo (Inglés)"}
        @foto = {icono: "Ícono"}
      when "Imágenes de slider"
        @set = Slider.all
        @fields = {liga: "Link",fecha_expiracion: "Fecha de expiración",posicion: "Posición (badge)"}
        @foto = {imagen: "Imagen",badge: "Badge", badge_eng: "Badge (Inglés)"}
      when "Cátedras y seminarios"
        @set = Catedra.all
        @fields = {titulo: "Título",titulo_eng: "Título (Inglés)",descripcion: "Descripción",descripcion_eng: "Descripción (Inglés)",tipo: "Tipo",liga: "Link"}
      when "Frases en página principal"
        @set = Frase.all
        @fields = {cita: "Cita",cita_eng: "Cita (Inglés)",autor: "Autor"}
      when "Directorio académico"
        @set = Academico.all
        @fields = {nombre: "Nombre",inicial: "Inicial",correo: "Correo electrónico",adscripcion: "Centro de Estudios",lineas_investigacion: "Líneas de investigación",pagina: "Sitio personal"}
        @foto = {foto: "Foto"}
      when "Usuarios gestores"
        @set = User.all
        @fields = {usuario: "Usuario",admin: "Tipo"}
    end
    respond_to do |format|
      format.js
    end
  end
end
