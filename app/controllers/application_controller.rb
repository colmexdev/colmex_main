class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_locale
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :check_editable, if: !:devise_controller?
  include PrincipalHelper
  include SobreElColegioHelper

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options={})
    { :locale => I18n.locale }
  end

  def get_pars_pics(ref)
    @sitio = Sitio.where("ref = ?",ref).first
    @pars = Parrafo.where("sitio_id = ?", @sitio.id)
    @pics = Foto.where("sitio_id = ?", @sitio.id)
  end

  def filter_pars_pics
    @pars.each do |p|
      p.texto = (p.texto.nil? ? "" : p.texto.gsub(/<p>/,"<div>").gsub(/<\/p>/,"</div>").gsub(/<\/div><div>/,"<br>"))
      p.texto_ingles = (p.texto_ingles.nil? ? "" : p.texto_ingles.gsub(/<p>/,"<div>").gsub(/<\/p>/,"</div>").gsub(/<\/div><div>/,"<br>").gsub(/(<br>)(<br>)+/,"<br>"))
    end
    @pics.each do |p|
      p.caption = (p.caption.nil? ? "" : p.caption.gsub(/<p>/,"<div>").gsub(/<\/p>/,"</div>").gsub(/<\/div><div>/,"<br>"))
      p.caption_ingles = (p.caption_ingles.nil? ? "" : p.caption_ingles.gsub(/<p>/,"<div>").gsub(/<\/p>/,"</div>").gsub(/<\/div><div>/,"<br>").gsub(/(<br>)(<br>)+/,"<br>"))
    end
  end

  protected
  def check_editable
    if request.original_fullpath.include?("editable")
      store_location_for(:admin, request.original_fullpath )
    end
  end

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || panel_path
  end

  def after_sign_out_path_for(resource_or_scope)
    new_admin_session_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:usuario, :password, :password_confirmation, :admin])
  end
end

