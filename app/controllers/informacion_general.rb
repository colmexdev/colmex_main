class InformacionGeneralController < ApplicationController

  def historia_75_años
    is_editable("El Colegio de México en sus 75 años: 1940 - 2015")
  end

  def premios_y_distinciones
    is_editable("Premios y distinciones")
    @categorias = Categorium.where("nombre != ?","Intro")
    @premiados = Premiado.where("tipo_premio = ?", "Comunidad")
  end

  def documentacion_institucional
    @actas = Documento.where(:tipo => "Junta")
 		@estatutos = Documento.where(:tipo => "Estatuto").first
    @anios = Documento.where(:tipo => "Junta").order(anio: :desc).group(:anio).pluck(:anio)
  end

  def informacion_para_estudiantes
    @reglamento = Documento.where(:tipo => "Reglamento")
    respond_to do |format|
      format.js
    end
  end

  def actas
    @actas = Documento.where(:tipo => "Junta")
    @anios = Documento.where(:tipo => "Junta").order(anio: :desc).group(:anio).pluck(:anio)
    respond_to do |format|
      format.js
    end
  end

  def informes
    @informes = Documento.where(:tipo => "Informe")
    respond_to do |format|
      format.js
    end
  end

  def estatutos
    @estatutos = Documento.where(:tipo => "Estatuto")
    respond_to do |format|
      format.js
    end
  end

  def historia
    is_editable("La Historia de El Colegio de México")
    @estatuto_organico = Documento.where("tipo = ? AND nombre LIKE ?","Estatuto","%Orgánico%").first
  end

  def autoridades
    is_editable("Autoridades")
    @actas = Documento.where(:tipo => "Junta")
  end

  def profesores_emeritos
    @profesores = Emerito.all
  end

  def sobre_el_colegio
    is_editable("Sobre El Colegio de México")
  end

  def transparencia
    is_editable("Unidad de Transparencia")
    @docs = Documento.where('tipo = ?','Unidad de Transparencia')
  end

  def licitaciones
    respond_to do |format|
      format.js
    end
  end

  def bienes
    is_editable("Relación de bienes")
    @transparencias = Documento.where(:tipo => "Transparencia")
  end

  def asamblea
    respond_to do |format|
      format.js
    end
  end

  def operativas
    is_editable("Autoridades (operativas)")
    @operativas = Personal.where("seccion = ? AND lower(depto) = ?", "Operativas", "oficina de vinculación institucional").union(Personal.where("seccion = ? AND lower(depto) = ?", "Operativas", "oficina de intercambio académico")).union(Personal.where("seccion = ? AND lower(depto) = ?", "Operativas", "oficina de promoción de programas académicos y pnpc")).union(Personal.where("seccion = ? AND lower(depto) = ?", "Operativas", "oficina de planeación académica y transparencia")).union(Personal.where("seccion = ? AND lower(depto) = ?", "Operativas", "oficina de comunicación digital")).union(Personal.where("seccion = ? AND lower(depto) = ?", "Operativas", "oficina de apoyo a proyectos institucionales"))
    respond_to do |format|
      format.js
    end
  end

  def junta
    is_editable("Autoridades (junta)")
    @juntas = Personal.where(:seccion => "Junta")
    respond_to do |format|
      format.js
    end
  end

  def presidencia
    is_editable("Autoridades (presidencia)")
    @presidencias = Personal.where("seccion = ? and lower(cargo) like ?", "Presidencia", "president_").union(Personal.where("seccion = ? and lower(cargo) like ?", "Presidencia", "secretari_ general")).union(Personal.where("seccion = ? and lower(cargo) like ?", "Presidencia", "coordinador_ general academic_")).union(Personal.where("seccion = ? and lower(cargo) like ?", "Presidencia", "secretari_ academic_")).union(Personal.where("seccion = ? and lower(cargo) like ?", "Presidencia", "secretari_ administrativ_"))
    #@profs_centros = Personal.find(47).union(Personal.find(48)).union(Personal.find(46))
		@profs_centros = Personal.where(seccion: "Asociado a Centro")
		#@profs_centros = Personal.where("seccion = ? AND nombre = ?", "Asociado","Luis Óscar Gómez Rodríguez †").union(Personal.where("seccion = ? AND nombre = ?", "Asociado","Ma. Guadalupe González González")).union(Personal.where("seccion = ? AND nombre = ?", "Asociado","María Eugenia Zavala"))
    @asociados = Personal.where(seccion: "Asociado a proyecto")
    respond_to do |format|
      format.js
    end
  end

  def centros_de_estudio
    is_editable("Autoridades (centros)")
    @centros = Personal.where(:seccion => "Centros")
    respond_to do |format|
      format.js
    end
  end

  def unidades_de_apoyo
    is_editable("Autoridades (apoyo)")
    @bibliotecas = Personal.where("seccion = ? AND lower(depto) = ?","Unidades de apoyo", "biblioteca “daniel cosío villegas”").union(Personal.where("seccion = ? AND lower(depto) = ?","Unidades de apoyo", "dirección de publicaciones")).union(Personal.where("seccion = ? AND lower(depto) = ?", "Unidades de apoyo", "coordinación de educación digital")).union(Personal.where("seccion = ? AND lower(depto) = ?","Unidades de apoyo", "coordinación de servicios de cómputo")).union(Personal.where("seccion = ? AND lower(depto) = ?","Unidades de apoyo", "coordinación de eventos especiales"))
    respond_to do |format|
      format.js
    end
  end

  def administracion
    is_editable("Autoridades (administración)")
    @admins = Personal.where("seccion = ? AND lower(cargo) like ?", "Administración", "secretari_ administrativ_").union(Personal.where("seccion = ? AND lower(cargo) = ?", "Administración", "dirección de asuntos escolares")).union(Personal.where("seccion = ? AND lower(cargo) like ?", "Administración", "director% de finanzas")).union(Personal.where("seccion = ? AND lower(cargo) like ?", "Administración", "director% de presupuesto y proyectos especiales")).union(Personal.where("seccion = ? AND lower(cargo) like ?", "Administración", "director% de recursos humanos")).union(Personal.where("seccion = ? AND lower(cargo) like ?", "Administración", "director% de servicios generales")).union(Personal.where("seccion = ? AND lower(cargo) = ?", "Administración", "jurídico")).union(Personal.where("seccion = ? AND lower(cargo) like ?", "Administración", "contralor% intern_"))
    respond_to do |format|
      format.js
    end
  end

  def consejo
    is_editable("Autoridades (consejo)")
    @consejo = Personal.where("seccion = ?","Consejo")
    @deptos = (params[:locale] == "es" ? ["Centro de Estudios de Asia y África","Centro de Estudios Demográficos, Urbanos y Ambientales","Centro de Estudios Económicos","Centro de Estudios Históricos","Centro de Estudios Internacionales","Centro de Estudios Lingüísticos y Literarios","Centro de Estudios Sociológicos","Biblioteca “Daniel Cosío Villegas”","Coordinación de Servicios de Cómputo","Publicaciones","Presidencia"] : ["Centro de Estudios de Asia y África","Centro de Estudios Demográficos, Urbanos y Ambientales","Centro de Estudios Económicos","Centro de Estudios Históricos","Centro de Estudios Internacionales","Centro de Estudios Lingüísticos y Literarios","Centro de Estudios Sociológicos","Library “Daniel Cosío Villegas”","Office of Computer Services","Department of Publications","Presidency"])
    @totals = [3,3,3,3,3,3,3,3,1,1,5]
  end

  def comision
    is_editable("Autoridades (comisión)")
    @coms = Personal.where("seccion = ?", "Comision")
  end

  def comunidad
    @categorias = Categorium.where("nombre != ?","Intro")
    @premiados = Premiado.where("tipo_premio = ?", "Comunidad")
    respond_to do |format|
      format.js
    end
  end

  def colegio
    @premiados = Premiado.where("tipo_premio = ?", "Colegio")
    respond_to do |format|
      format.js
    end
  end

  def marco_normativo
    is_editable("Marco normativo")
    @docs = Documento.where("tipo = ?", "Marco normativo")
  end

  include ActionView::Helpers::OutputSafetyHelper

  def directorio_academico_async
		settings = { :host => 'dc1colmex.colmex.mx', :base => 'DC=colmex,DC=mx', :port => 636, :encryption => :simple_tls, :auth => { :method => :simple, :username => "etenorio@colmex.mx", :password => "RickStarrx1" } }

		ActiveDirectory::Base.setup(settings)
		@ac_json = llenarLineas('/home/webuser/xml-autori-ene2017.xml')
		gon.academicos = @ac_json.to_json
		#gon.academicos_size = @ac_json.size
		respond_to do |format|
      format.html
      format.json {render json: {html: construir_docentes(@ac_json),acs: @ac_json.to_json}}
    end
  end

  def directorio_academico_drive
    where = (params.key?(:conds) ? build_query(params[:conds],params[:locale]) : "")
    limite = 15.0
    @profs = Teacher.where(where).offset(params.key?(:offset) ? params[:offset].to_i*limite : 0).limit(limite)
    @pags = (Teacher.where(where).count/limite).ceil
    @total = Teacher.where(where).count
    respond_to do |format|
      format.html
      format.js
    end
  end

  def build_query(params,locale)
    multi = false
    where = ""
    if params.key?(:nombre)
      where = "lower(nombre) like '%" + params[:nombre].downcase + "%'"
      multi = true
    end
    if params.key?(:centro)
      where = where + (multi ? " AND " : "") + "upper(centro) = '" + params[:centro].upcase + "'"
      multi = true
    end
    if params.key?(:linea)
      where = where + (multi ? " AND " : "") + "lower(temas_" + (locale == "es" ? "esp" : "ing") + ") like '%" + params[:linea].downcase + "%'"
    end
    if params.key?(:inic)
      where = "nombre like '" + params[:inic] + "%'"
    end
    return where
  end

  def recuperar_docentes
		settings = { :host => 'dc1colmex.colmex.mx', :base => 'DC=colmex,DC=mx', :port => 636, :encryption => :simple_tls, :auth => { :method => :simple, :username => "etenorio@colmex.mx", :password => "RickStarrx1" } }

		ActiveDirectory::Base.setup(settings)
		@ac_json = llenarLineas('/home/webuser/xml-autori-ene2017.xml')
		#gon.academicos = @ac_json.to_json
		respond_to do |format|
			format.html
      format.json {render json: {docs: @ac_json,html: construir_docentes(@ac_json)}}
    end
  end

  def directorio_institucional
		settings = {
				:host => 'dc1colmex.colmex.mx',
				:base => 'DC=colmex,DC=mx',
				:port => 636,
				:encryption => :simple_tls,
				:auth => {
				  :method => :simple,
				  :username => "etenorio@colmex.mx",
				  :password => "RickStarrx1"
				}
		}

		ActiveDirectory::Base.setup(settings)
		@miembros, @centros, @roles = [], [].to_set, [].to_set
		ActiveDirectory::User.find(:all, :cn => '*').collect.each do |u|
			if !u.get_attr(:department).nil? && u.get_attr(:dn).scan(/OU=(.*?),/).join(" ") != "" && !u.get_attr(:sn).nil? && !u.get_attr(:mail).nil?
        centro = u.get_attr(:department).split(" ")[0].gsub(/([.-]|\/)+/," ").split(" ")[0].upcase.gsub(/JUBILAD((O|A)S?)/,"JUBILADO").gsub(/[Íí]/,"I").gsub(/[óÓ]/,"O").gsub(/^C$/,"CSC").gsub(/^BIB$/,"BIBLIOTECA").gsub(/^PRES$/,"PRESIDENCIA")
        rol = asignarRol(u.get_attr(:dn).scan(/OU=(.*?),/).join(" "))
			  @centros <<  [centro, centro]
				@roles << [rol, rol]
			  @miembros << {:nombre => u.get_attr(:cn), :inicial => (!u.get_attr(:sn).nil? ? u.get_attr(:sn)[0] : ""), :correo => u.get_attr(:mail), :centro => centro, :ext => (u.get_attr(:telephoneNumber) || ""), :roles => rol}
      end
    end
    @centros = @centros.to_a.sort { |a,b| a[0] <=> b[0] }
		@roles = @roles.to_a.sort { |a,b| a[0] <=> b[0] }
		gon.miembros = @miembros.to_json
  end

end
