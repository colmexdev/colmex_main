class PrincipalController < ApplicationController
  def principal
  end

  def set_language
    I18n.locale = params[:id]
    #redirect_to :back
  end
end
