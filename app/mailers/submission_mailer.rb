class SubmissionMailer < Devise::Mailer
  helper :application

  default from: 'admin@waterspotterapp.com'


  def submission(user, submission)
    @user = user
    @submission = submission

    mail to: @user.email, subject: "WaterSpotter: New Location Added!"
  end
end
