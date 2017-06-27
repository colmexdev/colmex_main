class PanelController < ApplicationController
  before_action :select_set, only: [:index, :mostrar, :generar, :crear, :eliminar, :actualizar, :editar]

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
        @fields = @sets[params[:set].to_sym][:fields]
        @imgs = @sets[params[:set].to_sym][:imgs]
        logger.debug @obj.as_json
        format.json { render :crear, params: {set: params[:set]}, notice: 'Objeto generado exitosamente.' }
      else
        format.js { render :generar }
        format.json { render json: @obj.errors, status: :unprocessable_entity }
      end
    end
  end

  def editar
    @obj = @sets[params[:set].to_sym][:model].find(params[:id])
  end

  def actualizar
    @obj = @sets[params[:set].to_sym][:model].find(params[:id])
    respond_to do |format|
      if @obj.update(obj_params)
        @fields = @sets[params[:set].to_sym][:fields]
        @imgs = @sets[params[:set].to_sym][:imgs]
        format.js { render :mostrar, params: {set: params[:set]}, notice: 'Objeto generado exitosamente.' }
      else
        format.js { render :editar }
        format.json { render json: @obj.errors, status: :unprocessable_entity }
      end
    end
  end

  def eliminar
		@sets[params[:set].to_sym][:model].find(params[:id]).destroy
    @set = @sets[params[:set].to_sym][:model].all
    @fields = @sets[params[:set].to_sym][:fields]
    @foto = @sets[params[:set].to_sym][:imgs]
		respond_to do |format|
      format.js { render :index, params: {set: params[:set]}, notice: 'Se ha eliminado el objeto exitosamente'}
		  #format.html { redirect_to admins_url, notice: 'Admin was successfully destroyed.' }
		  format.json { head :no_content }
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
        fields: {nombre: "Nombre", nombre_eng: "Nombre (Inglés)"},
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
    elsif params[:set] == "Directorio de Autoridades"
      params.require(:personal).permit(:nombre, :seccion, :correo, :telefono, :extension, :cargo, :depto, :foto, :cargo_eng, :depto_eng)
    elsif params[:set] == "Categorías de Premios"
      params.require(:categorium).permit(:nombre,:nombre_eng)
    elsif params[:set] == "Premios y distinciones"
      params.require(:premiado).permit(:nombre, :descripcion, :tipo, :tipo_premio, :liga)
    elsif params[:set] == "Documentos varios"
      params.require(:documento).permit(:nombre, :tipo, :anio, :archivo, :nombre_eng)
    elsif params[:set] == "Descubres"
      params.require(:descubre).permit(:titulo, :liga, :contenido, :fecha_publicacion, :fecha_limite_pub, :imagen, :tags)
    elsif params[:set] == "Categorías de 'Descubre'"
      params.require(:content).permit(:tipo, :icono, :tipo_eng)
    elsif params[:set] == "Imágenes de slider"
      params.require(:slider).permit(:liga, :imagen, :badge, :posicion, :fecha_expiracion, :badge_eng)
    elsif params[:set] == "Cátedras y seminarios"
      params.require(:catedra).permit(:titulo, :titulo_eng, :descripcion_eng, :descripcion, :liga, :tipo)
    elsif params[:set] == "Frases en página principal"
      params.require(:frase).permit(:cita, :autor, :cita_eng)
    elsif params[:set] == "Directorio académico"
      params.require(:academico).permit(:nombre, :adscripcion, :lineas_investigacion, :correo, :pagina, :foto, :inicial)
    elsif params[:set] == "Usuarios gestores"
      params.require(:admin).permit(:usuario, :password, :password_confirmation, :admin)
    end
  end
end
