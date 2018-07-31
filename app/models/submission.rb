class Submission < MailForm::Base
  attribute :name,        :validate => true
  attribute :description, :validate => true   
  attribute :nearby_restroom
  attribute :latitude,    :validate => true
  attribute :longitude,   :validate => true
  attribute :nickname,  :captcha  => true
  attribute :email     #:validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      :subject => "WaterSpotter: New Location Submission",
      :to => "driddlebarger@gmail.com",
      :from => "admin@waterspotterapp.com"
    }
  end
end