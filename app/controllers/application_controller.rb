class ApplicationController < ActionController::Base
  include Mengpaneel::Controller

  protect_from_forgery with: :exception

  #before_action :store_user_location!, if: :storable_location?

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :setup_mixpanel

  #def store_user_location!
  #  store_location_for(:user, request.fullpath)
  #end

  # specific to add location -- redirect to sign up path
  def auth_user
    redirect_to new_user_registration_url unless user_signed_in?
  end


  protected

  def configure_permitted_parameters
    attributes = [:email, :password, :password_confirmation, :terms]
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
  end

  #def after_sign_in_path_for(resource) --> moved to registration controller
  #  home_path
  #end

  #def after_sign_in_path_for(resource)
  #  stored_location_for(resource) || root_path
  #end

  private

    def setup_mixpanel
    return unless user_signed_in?

    # For technical reasons, you need to do setup from a `mengpaneel.setup` block.
    # I'll go into those reasons later.
    mengpaneel.setup do
      mixpanel.identify(current_user.id)

      mixpanel.people.set(
        "ID"              => current_user.id,
        "$email"          => current_user.email,
        "$created"        => current_user.created_at,
        "$last_login"     => current_user.current_sign_in_at
      )
    end
  end

  #def storable_location?
  #  request.get? && is_navigational_format? && !devise_controller? && !request.xhr? 
  #end


end
