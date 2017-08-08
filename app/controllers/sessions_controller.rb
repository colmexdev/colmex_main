class SessionsController < Devise::SessionsController
  prepend_before_action :allow_params_authentication!, only: []

  def new
    super
  end

  def create
		settings = { :host => 'dc1colmex.colmex.mx', :base => 'DC=colmex,DC=mx', :port => 636, :encryption => :simple_tls, :auth => { :method => :simple, :username => params[:admin][:usuario], :password => params[:admin][:password] } }
    ActiveDirectory::Base.setup(settings)
    #set_flash_message!(:notice, :signed_in)
    if ActiveDirectory::User.find(:first, :cn => '*')
      logger.debug "Exito"
      params[:admin][:usuario] = ENV["usr"]
      params[:admin][:password] = ENV["pwd"]
    end
    self.resource = warden.authenticate!(auth_options)
    sign_in(resource_name, resource)
    yield resource if block_given?
    respond_with resource, location: after_sign_in_path_for(resource)
  end

  def destroy
    super
  end

end
