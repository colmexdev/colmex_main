class PrincipalController < ApplicationController
  def principal
    cliente = TinyTds::Client.new username: 'agendaPRED', password: '@g3NDa#', host: '172.16.40.211', port: '49767'
    begin
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

  def principios_eticos
 
  end
end
