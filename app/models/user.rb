class User < ApplicationRecord

  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

  #after_create :add_to_list

  acts_as_voter

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.uid = auth.uid
      user.provider = auth.provider
      user.password = Devise.friendly_token[0,20]
      # If you are using confirmable and the provider(s) you use validate emails, 
      # uncomment the line below to skip the confirmation emails.
      user.skip_confirmation!
    end
  end

  def password_match?
     self.errors[:password] << I18n.t('errors.messages.blank') if password.blank?
     self.errors[:password_confirmation] << I18n.t('errors.messages.blank') if password_confirmation.blank?
     self.errors[:password_confirmation] << I18n.translate("errors.messages.confirmation", attribute: "password") if password != password_confirmation
     password == password_confirmation && !password.blank?
  end

  # new function to set the password without knowing the current 
  # password used in our confirmation controller. 
  def attempt_set_password(params)
    p = {}
    p[:password] = params[:password]
    p[:password_confirmation] = params[:password_confirmation]
    update_attributes(p)
  end

  # new function to return whether a password has been set
  def has_no_password?
    self.encrypted_password.blank?
  end

  # Devise::Models:unless_confirmed` method doesn't exist in Devise 2.0.0 anymore. 
  # Instead you should use `pending_any_confirmation`.  
  def only_if_unconfirmed
    pending_any_confirmation {yield}
  end

  def password_required?
  # Password is required if it is being set, but not for new records
    if !persisted? 
      false
    else
      !password.nil? || !password_confirmation.nil?
    end
  end

  def add_to_list
    list_id = "a604ecccdd"
    @gb = Gibbon::Request.new 
    subscribe = @gb.lists(list_id).members.create(body: { email_address: self.email, status: "subscribed", double_optin: false })
  end



end
