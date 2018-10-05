class LocationAddedMailer < Devise::Mailer
  helper :application

  default from: 'admin@waterspotterapp.com'


  def location_added(user, location)
    @user = user
    @location = location

    mail to: 'admin@waterspotterapp.com', subject: "WaterSpotter: New Location Added"
  end
end
