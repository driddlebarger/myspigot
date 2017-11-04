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
      :subject => "New Location Submission",
      :to => "your_email@example.org",
      :from => "your_email@example.org"
    }
  end
end