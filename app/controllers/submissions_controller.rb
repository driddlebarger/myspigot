class SubmissionsController < ApplicationController
  def new
    @submission = Submission.new
  end

  def create
    @submission = Submission.new(params[:submission])
    @submission.request = request
    if @contact.deliver
    	flash.now[:error] = nil
    	redirect_to root_path, notice: "Thanks for your submission!"
    else
    	flash.now[:error] = 'Submission could not be completed.'
    	render :new
    end
  end
end