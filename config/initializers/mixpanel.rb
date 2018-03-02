require 'mixpanel-ruby'

$tracker = Mixpanel::Tracker.new('15053396e356fe89af9c2b17b2633a3a')

if Rails.env.development? 
  #silence local SSL errors
  Mixpanel.config_http do |http|
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  end
end