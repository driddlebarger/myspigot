class PagesController < ApplicationController

  before_action :authenticate_user!, only: [:home]

  def home
  end

  def index
  	if user_signed_in?
      redirect_to home_path
    else

  	render :layout => 'landing'
  
  	end
  end

end

