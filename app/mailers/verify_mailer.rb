class VerifyMailer < ApplicationMailer
  helper :application

  default from: 'admin@waterspotterapp.com'


  def first_verify(location)
    @location = location
    
    mail to: @location.submitted_by, subject: "WaterSpotter: Your WaterSpot has been verified!"
  end
end