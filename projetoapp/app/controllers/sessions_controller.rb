class SessionsController < Devise::SessionsController
  def create
    # try to authenticate as a User
    self.resource = warden.authenticate(auth_options)
    resource_name = self.resource_name
 
    if resource.nil?
      # try to authenticate as an AdminUser
      resource_name = :admin_user
      request.params[:admin_user] = params[:user]
 
      self.resource = warden.authenticate!(auth_options.merge(scope: :admin_user))
    end
 
    set_flash_message(:notice, :signed_in) if is_navigational_format?
    sign_in(resource_name, resource)
    respond_with resource, :location => after_sign_in_path_for(resource)
  end
end