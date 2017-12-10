class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    attributes = [:email, :password, :password_confirmation, :terms]
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
  end

end
