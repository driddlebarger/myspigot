class SubmissionMailer < Devise::Mailer
  helper :application

  default from: 'admin@waterspotterapp.com'


  def submission(user, location)
    @user = user
    @location = location

    mail to: @user.email, subject: "WaterSpotter: New Location Added!"
  end
end
