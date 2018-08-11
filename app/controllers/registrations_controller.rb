class RegistrationsController < Devise::RegistrationsController

  #/// START MIXPANEL code

  def create
  	super
      # We need to make sure signing up actually succeeded.
      if resource.save
        # Technical reasons again, will get into those later.
        mengpaneel.before_setup do
          mixpanel.alias(resource.id)
      	end

      	@user = current_user
      	mixpanel.track("Sign Up", "ID"          => @user.id,
                                  "Email"       => @user.email)
	  
      ab_finished('main_header_copy', reset: false)
    end

  end

  #/// END MIXPANEL code

  protected

  def after_sign_up_path_for(resource)
    home_path # Or :prefix_to_your_route
  end

end