class PrincipalController < ApplicationController
  def principal
    I18n.locale = params[:locale]
    gon.ev_big, gon.ev_small = construye_slider_eventos
  end

  def sobre

  end

  def centros

  end

  def programas

  end
end
