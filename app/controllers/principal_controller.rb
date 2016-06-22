class PrincipalController < ApplicationController
  def principal
  end

  def set_language
    locale = params[:id]
    redirect_to :back
  end
end
