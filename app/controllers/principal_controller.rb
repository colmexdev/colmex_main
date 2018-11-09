class PrincipalController < ApplicationController
  def principal
    begin
      cliente = TinyTds::Client.new username: 'agendaPRED', password: '@g3NDa#', host: '172.16.40.220', port: '1433'
      @resultado = cliente.execute("USE Agenda")
      @resultado.do
      @resultado = cliente.execute("SELECT * FROM dbo.vw_DatosAgenda WHERE DATEADD(day, DATEDIFF(day,'19000101',PARSE(fechaFin AS DATE USING 'es-ES')), CAST(horaFin AS DATETIME2(1))) >= CAST(GETDATE() AS DATETIME2(1))  ORDER BY PARSE(fechaInicio AS DATE USING 'es-ES') ASC, horaInicio ASC")
      gon.ev_big, gon.ev_small, gon.ev_tiny = construye_slider_eventos(@resultado)
    rescue
      gon.ev_big, gon.ev_small, gon.ev_tiny = "", "" ,""
    end
    @sliders = Slider.where.not("liga LIKE ? ", "%youtu%").order("RAND()")
    @descubre = Descubre.where("fecha_publicacion <= ? AND fecha_limite_pub >= ?", Date.current(), Date.current()).order("RAND()")
    @frase = Frase.order("RAND()").first
    gon.descubres = @descubre.to_json
    gon.cant_sliders = @sliders.size
  end

  def resultados_busqueda
    @resultados = []
    condicion_limpia = quitar_acentos(params[:condicion]).downcase
    Descubre.where("fecha_publicacion <= ? AND fecha_limite_pub >= ?", Date.current(), Date.current()).each do |d|
      if (quitar_acentos(d.titulo.to_s.downcase).include?(condicion_limpia) or quitar_acentos(d.contenido.to_s.downcase).include?(condicion_limpia) or quitar_acentos(d.tags.to_s.downcase).gsub(/ *, */, " ").include?(condicion_limpia)) and not @resultados.include?(d)
        @resultados << d
      end
    end
    Curso.all.each do |c|
      if (quitar_acentos(c.titulo.to_s.downcase).include?(condicion_limpia) or quitar_acentos(c.descripcion.to_s.downcase).include?(condicion_limpia) or quitar_acentos(c.programa.to_s.downcase).include?(condicion_limpia) or (quitar_acentos(c.programa.to_s).downcase == "curso" and quitar_acentos(c.tipo_curso.to_s).downcase.include?(condicion_limpia)) or quitar_acentos(c.tags.to_s.downcase).gsub(/ *, */, " ").include?(condicion_limpia)) and not @resultados.include?(c)
        @resultados << c
      end
    end
  end

  def quitar_acentos(cadena)
    if cadena.to_s == ""
      return ""
    end
    nueva_cad = cadena.gsub(/[áÁ]/, "a")
    nueva_cad = nueva_cad.gsub(/[éÉ]/, "e")
    nueva_cad = nueva_cad.gsub(/[íÍ]/, "i")
    nueva_cad = nueva_cad.gsub(/[óÓ]/, "o")
    nueva_cad = nueva_cad.gsub(/[úÚüÜ]/, "u")
    return nueva_cad
  end

  def como_llegar
  end

  def principios_eticos
    is_editable("Principios éticos")
  end

  def sitemap
  end

  def aviso_de_privacidad
  end

  def proximamente
  end

  def get_eventos
    @datos = []
    @limit = params[:limit] || "1"
    @offset = params[:offset] || "0"
    @multi = false
    @where = ""
    if params.key?(:crono) && params[:crono] == "true"
      @where = @where + "DATEADD(day, DATEDIFF(day,'19000101',PARSE(fechaFin AS DATE USING 'es-ES')), CAST(horaFin AS DATETIME2(1))) >= CAST(GETDATE() AS DATETIME2(1))"
      @multi = true
    end
    if params.key?(:centro)
      @where = @where + (@multi ? " AND " : "") + "centroSiglas = UPPER('" + params[:centro] + "')"
      @multi = true
    end
    if params.key?(:categoria)
      @where = @where + (@multi ? " AND " : "") + "LOWER(Categoria) like '%" + params[:categoria].downcase + "%'"
      @multi = true
    end
    if params.key?(:tipo)
      @where = @where + (@multi ? " AND " : "") + "LOWER(tipoActividad) = LOWER('" + params[:tipo] + "')"
      @multi = true
    end
    if params.key?(:tipos)
      @where = @where + (@multi ? " AND " : "") + "LOWER(tipoActividad) LIKE '%" + params[:tipos] + "%'"
      @multi = true
    end
    if params.key?(:anio)
      @where = @where + (@multi ? " AND " : "") + "SUBSTRING(fechaInicio,7,4) = '" + params[:anio] + "'"
    end
    begin
      cliente = TinyTds::Client.new username: 'agendaPRED', password: '@g3NDa#', host: '172.16.40.220', port: '1433'
      @resultado = cliente.execute("USE Agenda")
      @resultado.do
      @resultado = cliente.execute("SELECT * FROM dbo.vw_DatosAgenda" + (@where.size > 0 ? (" WHERE " + @where) : "") + " ORDER BY PARSE(fechaInicio AS DATE USING 'es-ES') " + (params.key?(:ordercrono) && ["desc","asc"].include?(params[:ordercrono].downcase) ? params[:ordercrono] : "asc") + ", horaInicio " + (params.key?(:ordercrono) && ["desc","asc"].include?(params[:ordercrono].downcase) ? params[:ordercrono] : "asc") + " OFFSET " + (@offset.to_i*@limit.to_i).to_s + " ROWS " + (params.key?(:limit) ? ("FETCH NEXT " + @limit + " ROWS ONLY;") : ";"))
      @resultado.each do |r|
        @datos << r
      end
      @total = cliente.execute("SELECT * FROM dbo.vw_DatosAgenda" + (@where.size > 0 ? (" WHERE " + @where) : "") + ";").count
    rescue
      @datos = {}
      @total = 0
    end
    respond_to do |format|
      format.json {render json: {videos: @datos, total: @total, pages: (params.key?(:limit) ? (@total.fdiv(@limit.to_i).ceil) : 1), curr_page: @offset.to_i + 1, prev_page: (@offset.to_i - 1 < 0 || @offset.to_i >= @total.fdiv(@limit.to_i).ceil ? nil : @offset.to_i), next_page: (@offset.to_i + 1 >= @total.fdiv(@limit.to_i).ceil ? nil : @offset.to_i + 2), first_page: (@offset.to_i == 0), last_page: (@offset.to_i + 1 == @total.fdiv(@limit.to_i).ceil || (@total == 0 && @offset.to_i == 0))}}
    end
  end

  def cinta_eventos
    begin
      cliente = TinyTds::Client.new username: 'agendaPRED', password: '@g3NDa#', host: '172.16.40.220', port: '1433'
      @resultado = cliente.execute("USE Agenda")
      @resultado.do
      @resultado = cliente.execute("SELECT * FROM dbo.vw_DatosAgenda WHERE DATEADD(day, DATEDIFF(day,'19000101',PARSE(fechaFin AS DATE USING 'es-ES')), CAST(horaFin AS DATETIME2(1))) >= CAST(GETDATE() AS DATETIME2(1)) AND CentroSiglas = 'CEE' ORDER BY PARSE(fechaInicio AS DATE USING 'es-ES') ASC, horaInicio ASC")
      @ev_big, @ev_small, @ev_tiny = construye_slider_eventos(@resultado)
    rescue => e
      @ev_big, @ev_small, @ev_tiny = "", "" ,""
    end

    respond_to do |format|
      format.html
      format.json { render json: {ev_big: @ev_big, ev_med: @ev_small, ev_small: @ev_tiny}}
    end
  end

end
