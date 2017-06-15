class PanelController < ApplicationController
  def principal
    respond_to do |format|
      format.js
    end
  end

  def panel
  end

  def index
    @set = ""
		if params[:set] == "Eméritos"
      @set = Emerito.all
    end
    respond_to do |format|
      format.js
    end
  end
end
