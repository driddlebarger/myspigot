class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def auth_user
    redirect_to new_user_registration_url unless user_signed_in?
    flash[:notice] = "Please sign in to continue."
  end

  protected

  def configure_permitted_parameters
    attributes = [:email, :password, :password_confirmation, :terms]
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
  end

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || stored_location_for(resource) || '/submit'
  end


end
