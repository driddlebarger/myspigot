Mengpaneel.configure do |config|
  config.token = ENV["MIXPANEL_TOKEN"] # or use ENV["MIXPANEL_TOKEN"] if you're into 12-factor. It's not set automatically though, you still have to put that line.
end