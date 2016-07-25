class PrincipalController < ApplicationController
  def principal
    begin
      cliente = TinyTds::Client.new username: 'agendaPRED', password: '@g3NDa#', host: '172.16.40.169', port: '49435'
      @resultado = cliente.execute("USE Agenda")
      @resultado.do
      @resultado = cliente.execute("SELECT * from dbo.vw_DatosAgenda")
      gon.ev_big, gon.ev_small, gon.ev_tiny = construye_slider_eventos(@resultado)
    rescue
      gon.ev_big, gon.ev_small, gon.ev_tiny = "", "" ,""
    end
    @sliders = Slider.where("fecha_expiracion > ? ", Date.current()).order("RAND()")
    @descubre = Descubre.where("fecha_publicacion <= ? AND fecha_limite_pub > ?", Date.current(), Date.current()).order("RAND()")
    @frase = Frase.order("RAND()").first
  end

  def resultados_busqueda
    @resultados = []
    descubres = Descubre.where("tags IS NOT NULL")
    descubres.each do |d|
      if d.tags.lowercase.split(/ *, */).include?(params[:condicion].downcase)
        @resultados << d
      end
    end
    cursos = Curso.where("tags IS NOT NULL")
    cursos.each do |c|
      if c.tags.lowercase.split(/ *, */).include?(params[:condicion].downcase)
        @resultados << c
      end
    end
    #@descubre = Descubre.where("LOWER(tags) LIKE ?", params[:condicion])
    #@cursos = Curso.where("LOWER(tags) LIKE ?", params[:condicion])
  end

  def principios_eticos
 
  end
end
