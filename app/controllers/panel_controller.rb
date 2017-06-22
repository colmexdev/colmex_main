class PanelController < ApplicationController
  before_action :select_set, only: [:index, :mostrar, :generar, :crear]

  def principal
    respond_to do |format|
      format.js
    end
  end

  def panel
  end

  def index 
    @set = @sets[params[:set].to_sym][:model].all
    @fields = @sets[params[:set].to_sym][:fields]
    @foto = @sets[params[:set].to_sym][:imgs]
    respond_to do |format|
      format.js
    end
  end

  def mostrar
    @obj = @sets[params[:set].to_sym][:model].find(params[:id])
    @fields = @sets[params[:set].to_sym][:fields]
    @imgs = @sets[params[:set].to_sym][:imgs]
    respond_to do |format|
      format.js
    end
  end

  def generar
    @obj = @sets[params[:set].to_sym][:model].new
    respond_to do |format|
      format.js
    end
  end

  def crear
    @obj = @sets[params[:set].to_sym][:model].new(obj_params)
    respond_to do |format|
      if @obj.save
        logger.info @obj
        format.js { render :mostrar }
        #format.html { redirect_to @, notice: 'Admin was successfully created.' }
        #format.json { render :show, status: :created, location: @admin }
      else
        logger.debug @obj
        format.js { render :generar }
        #format.html { render :new }
        format.json { render json: @obj.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def select_set
    @sets = {
      "Profesores eméritos": {
        model: Emerito, 
        fields: {nombre: "Nombre",fecha_anexion: "Fecha de anexión",centro: "Centro",semblanza: "Semblanza",semblanza_eng: "Semblanza (Inglés)"}, 
        imgs: {foto: "Foto"}
      }, "Programas docentes": {
        model: Curso,
        fields: {titulo: "Título",descripcion: "Descripción",fecha_inicio_conv: "Inicio de convocatoria",fecha_fin_conv: "Fin de convocatoria",fecha_inicio_clases: "Inicio de clases",fecha_fin_clases: "Fin de clases",liga: "Link",programa: "Programa docente",tipo_curso: "Tipo de curso",imparte: "Impartido por",traduccion_tit: "Título (Inglés)", traduccion_desc: "Descripción (Inglés)"},
        imgs: {foto: "Foto"}
      }, "Directorio de Autoridades": {
        model: Personal,
        fields: {nombre: "Nombre",seccion: "Sección",correo: "Correo electrónico",telefono: "Teléfono",extension: "Extensión",depto: "Departamento",cargo: "Cargo"},
        imgs: {foto: "Foto"}
      }, "Categorías de Premios": {
        model: Categorium,
        fields: {nombre: "Nombre", nombre_eng: "Nombre (Inglés)", t: ""},
        imgs: {}
      }, "Premios y distinciones": {
        model: Premiado,
        fields: {nombre: "Nombre", descripcion: "Descripción",tipo_premio: "Otorgado a",tipo: "Sección (comunidad)",liga: "Link"},
        imgs: {}
      }, "Documentos varios": {
        model: Documento,
        fields: {nombre: "Título",nombre_eng: "Título (Inglés)",tipo: "Sección",anio: "Año",liga: "Link"},
        imgs: {archivo: "Archivo"}
      }, "Descubres": {
        model: Descubre,
        fields: {titulo: "Título",liga: "Link",contenido: "Categoría",fecha_publicacion: "Fecha de despliegue",fecha_limite_pub: "Fecha de expiración",tags: "Etiquetas"},
        imgs: {imagen: "Imagen"}
      }, "Categorías de 'Descubre'": {
        model: Content,
        fields: {tipo: "Tipo",tipo_eng: "Tipo (Inglés)"},
        imgs: {icono: "Ícono"}
      }, "Imágenes de slider": {
        model: Slider,
        fields: {liga: "Link",fecha_expiracion: "Fecha de expiración",posicion: "Posición (badge)"},
        imgs: {imagen: "Imagen",badge: "Badge", badge_eng: "Badge (Inglés)"}
      }, "Cátedras y seminarios": {
        model: Catedra,
        fields: {titulo: "Título",titulo_eng: "Título (Inglés)",descripcion: "Descripción",descripcion_eng: "Descripción (Inglés)",tipo: "Tipo",liga: "Link"},
        imgs: {}
      }, "Frases en página principal": {
        model: Frase,
        fields: {cita: "Cita",cita_eng: "Cita (Inglés)",autor: "Autor"},
        imgs: {}
      }, "Directorio académico": {
        model: Academico,
        fields: {nombre: "Nombre",inicial: "Inicial",correo: "Correo electrónico",adscripcion: "Centro de Estudios",lineas_investigacion: "Líneas de investigación",pagina: "Sitio personal"},
        imgs: {foto: "Foto"}
      }, "Usuarios gestores": {
        model: Admin,
        fields: {usuario: "Usuario",admin: "Tipo"},
        imgs: {}
      }
    }
  end

  def obj_params
    if params[:set] == "Profesores eméritos"
      params.require(:emerito).permit(:nombre, :fecha_anexion, :centro, :semblanza, :foto, :semblanza_eng)
    elsif params[:set] == "Programas docentes"
      params.require(:curso).permit(:titulo, :descripcion, :fecha_inicio_conv, :fecha_fin_conv, :fecha_inicio_clases, :liga, :programa, :tipo_curso, :traduccion_tit, :traduccion_desc, :tags, :fecha_fin_clases, :tipo_curso_linea, :foto, :imparte)
    end
  end
end
