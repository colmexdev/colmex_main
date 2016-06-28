class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_locale

  helper_method :construir_slider_eventos

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
    cliente = TinyTds::Client.new username: 'agendaPRED', password: '@g3NDa#', host: '172.16.40.169', port: '49435'
    @resultado = cliente.execute("USE Agenda")
    @resultado.do
    @resultado = cliente.execute("SELECT * from dbo.vw_DatosAgenda")
  end

  def default_url_options(options={})
    { :locale => I18n.locale }
  end
end

