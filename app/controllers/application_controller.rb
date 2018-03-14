class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :store_user_location!, if: :storable_location?

  before_action :configure_permitted_parameters, if: :devise_controller?


  def store_user_location!
    store_location_for(:user, request.fullpath)
  end

  # specific to add location -- redirect to sign up path
  def auth_user
    redirect_to new_user_registration_url unless user_signed_in?
  end


  protected

  def configure_permitted_parameters
    attributes = [:email, :password, :password_confirmation, :terms]
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
  end

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || root_path
  end

  private

  def storable_location?
    request.get? && is_navigational_format? && !devise_controller? && !request.xhr? 
  end


end
