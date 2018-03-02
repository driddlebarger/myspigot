class SubmissionsController < ApplicationController
before_action :authenticate_user!

  def new
    @submission = Submission.new
  end

  def create

    @submission = Submission.new(params[:submission])
    @submission.request = request
    if @submission.deliver
        $tracker.track(@location, 'Add Location (Submitted)', {
        'User' => current_user.email,
        })
    	flash.now[:error] = nil
    	redirect_to root_path, notice: "Thanks for your submission!"
      current_user.increment!(:count, 1)
    else
    	flash.now[:error] = 'Submission could not be completed.'
    	render :new
    end
  end
end