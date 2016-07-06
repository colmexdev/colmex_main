class PrincipalController < ApplicationController
  def principal
    I18n.locale = params[:locale]
  end

  def sobre

  end
end
