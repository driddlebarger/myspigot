# Preview all emails at http://localhost:3000/rails/mailers/flag_location_mailer
class FlagLocationMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/flag_location_mailer/flag_location
  def flag_location
    FlagLocationMailer.flag_location
  end

end
