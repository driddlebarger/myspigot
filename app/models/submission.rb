class Submission < MailForm::Base
  attribute :name,        :validate => true
  attribute :description, :validate => true   
  #attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :latitude
  attribute :longitude
  attribute :nickname,  :captcha  => true

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      :subject => "Waterfinder: New Location Submission",
      :to => "driddlebarger@gmail.com",
      :from => "davidriddlebarger@yahoo.com"
    }
  end
end