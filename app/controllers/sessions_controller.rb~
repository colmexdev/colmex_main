class SessionsController < Devise::SessionsController

  def new
    super
  end

  def create
		settings = { :host => 'dc1colmex.colmex.mx', :base => 'DC=colmex,DC=mx', :port => 636, :encryption => :simple_tls, :auth => { :method => :simple, :username => params[:admin][:usuario], :password => params[:admin][:password] } }
    ActiveDirectory::Base.setup(settings)
    self.resource = warden.authenticate!(auth_options)
    logger.debug self.resource
    set_flash_message!(:notice, :signed_in)
    logger.debug sign_in(resource_name, resource)
    if ActiveDirectory::User.find(:first, :cn => '*')
      logger.debug "Exito"
      if block_given?
        yield resource
      end
      respond_with resource, location: after_sign_in_path_for(resource)
    else
      logger.debug "Fallo"
      redirect_to new_admin_session_path
    end
  end

  def destroy
    super
  end

end
