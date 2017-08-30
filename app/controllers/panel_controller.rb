class PanelController < ApplicationController
  before_action :select_set, only: [:principal, :subset_index, :index, :mostrar, :generar, :crear, :eliminar, :actualizar, :editar]
  before_action :get_object_fields, only: [:subset_index, :index, :crear, :actualizar, :eliminar, :mostrar]

  def principal
		grupos = @sets.map {|k,v| v[:model]}
    @groups = []
    grupos.each_with_index do |g,i|
      begin
        @groups << g.where("created_at >= ? OR updated_at >= ?", Date.today-30, Date.today-30).pluck(:nombre,:created_at,:updated_at).map {|x| {nombre: x[0], fecha_creacion: x[1].to_date, fecha_upd: x[2].to_date, tipo: @sets.keys[i].to_s}}
      rescue Exception => e
        #next
      end
      begin
        @groups << g.where("created_at >= ? OR updated_at >= ?", Date.today-30, Date.today-30).pluck(:titulo,:created_at,:updated_at).map {|x| {nombre: x[0], fecha_creacion: x[1].to_date, fecha_upd: x[2].to_date, tipo: @sets.keys[i].to_s}}
      rescue Exception => e
        #next
      end
      begin
        @groups << g.where("created_at >= ? OR updated_at >= ?", Date.today-30, Date.current-30).pluck(:cita,:created_at,:updated_at).map {|x| {nombre: x[0], fecha_creacion: x[1].to_date, fecha_upd: x[2].to_date, tipo: @sets.keys[i].to_s}}
      rescue Exception => e
        #next
      end
      begin
        @groups << g.where("created_at >= ? OR updated_at >= ?", Date.today-30, Date.current-30).pluck(:badge,:created_at,:updated_at).map {|x| {nombre: x[0], fecha_creacion: x[1].to_date, fecha_upd: x[2].to_date, tipo: @sets.keys[i].to_s}}
      rescue Exception => e
        #next
      end
    end
    @groups = @groups.reject{|g| g.empty?}.flatten
    respond_to do |format|
      format.js
      format.json {render json: {groups: @groups, last_time: (Date.today - 30)}}
    end
  end

  def panel
  end

  def index 
    @rpp = 15
    @count = @sets[params[:set].to_sym][:model].all.size
    @set = @sets[params[:set].to_sym][:model].where("").order(updated_at: :desc).limit(@rpp).offset(params[:offset].present? ? (params[:offset].to_i*@rpp) : 0)
    @pags = (@count == 0 ? 0 : ((@count / @rpp) + (@count % @rpp == 0 ? 0 : 1) ))
    respond_to do |format|
      format.js
      format.json {render json: {filas: @set} }
    end
  end

  def subset_index
    @set = @sets[params[:set].to_sym][:model].order(updated_at: :desc) 
  end

  def mostrar
		@obj = @sets[params[:set].to_sym][:model].find(params[:id].to_i)
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
        format.js { render :mostrar, params: {set: params[:set]}, notice: 'Objeto generado exitosamente.' }
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
		respond_to do |format|
      format.js { render :index, params: {set: params[:set]}, notice: 'Se ha eliminado el objeto exitosamente'}
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
      }, "Descubre": {
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

  def get_object_fields
    @fields = @sets[params[:set].to_sym][:fields]
    @imgs = @sets[params[:set].to_sym][:imgs]
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
    elsif params[:set] == "Descubre"
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
