class SubmissionsController < ApplicationController
  def new
    @submission = Submission.new
  end

  def create
    @submission = Submission.new(params[:submission])
    @submission.request = request
    if @submission.deliver
      flash.now[:notice] = 'Thanks for your location submission!'
    else
      flash.now[:error] = 'Cannot send message.'
      render :new
    end
  end
end