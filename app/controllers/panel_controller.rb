class PanelController < ApplicationController
  def principal
    respond_to do |format|
      format.js
    end
  end

  def panel
  end
end
