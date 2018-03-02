require 'mixpanel-ruby'

if Rails.env == "development"
  $tracker = Mixpanel::Tracker.new('15053396e356fe89af9c2b17b2633a3a')
end

if Rails.env == "production"
  $tracker = Mixpanel::Tracker.new(ENV['MIXPANEL_PROD_TOKEN'])
end