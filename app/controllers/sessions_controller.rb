class SessionsController < Devise::SessionsController

  def new
    super
  end

  def create
    self.resource = warden.authenticate!(auth_options)
    set_flash_message!(:notice, :signed_in)
    sign_in(resource_name, resource)
		settings = { :host => 'dc1colmex.colmex.mx', :base => 'DC=colmex,DC=mx', :port => 636, :encryption => :simple_tls, :auth => { :method => :simple, :username => "etenorio@colmex.mx", :password => "RickStarrx1" } }
    ActiveDirectory::Base.setup(settings)
    if ActiveDirectory::User.find(:first, :cn => '*')
      yield resource unless !block_given?
      respond_with resource, location: after_sign_in_path_for(resource)
    else
      redirect_to new_admin_session_path
    end
  end

  def destroy
    super
  end

end
