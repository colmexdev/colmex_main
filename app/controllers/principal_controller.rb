class PrincipalController < ApplicationController
  def principal
    $idioma = I18n.locale
  end

  def set_language
    I18n.locale = params[:id]
    $idioma = params[:id]
    redirect_to :back
  end
end
