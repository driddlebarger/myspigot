class SubmissionsController < ApplicationController
before_action :auth_user

  def new
    @submission = Submission.new
  end

  def create
    @submission = Submission.new(params[:submission])
    @submission.request = request
    if @submission.deliver
          #Mixpanel tracking
          mixpanel.track("Add Location (Submitted)", "User"          => current_user.email,
                                                     "User ID"       => current_user.id)
    	flash.now[:error] = nil
      #Send email to current_user IF it submits okay
      SubmissionMailer.submission(current_user, @submission).deliver_now
    	redirect_to home_path, notice: "New WaterSpot added!"
      #Count how many submissions each user makes
      current_user.increment!(:count, 1)
    else
    	flash.now[:error] = 'There was an error. Your submission could not be completed.'
    	render :new
    end
  end
end