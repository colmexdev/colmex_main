class PrincipalController < ApplicationController
  def principal
    I18n.locale = params[:locale]
    gon.ev_big, gon.ev_small, gon.ev_tiny = construye_slider_eventos
  end

  def principios_eticos
 
  end
end
