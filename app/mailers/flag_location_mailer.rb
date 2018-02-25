class FlagLocationMailer < Devise::Mailer
  helper :application

  default from: 'driddlebarger@gmail.com'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.flag_location_mailer.flag_location.subject
  #
  def flag_location(user, location)
    @user = user
    @location = location

    mail to: "driddlebarger@gmail.com", subject: "WaterSpotter: Flagged Location"
  end
end
