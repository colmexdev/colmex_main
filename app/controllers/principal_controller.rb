class PrincipalController < ApplicationController
  def principal
  end

  def set
    locale = params[:id]
    redirect_to :back
  end
end
