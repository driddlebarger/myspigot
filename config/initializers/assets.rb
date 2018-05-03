# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
Rails.application.config.assets.precompile += %w( landing.css, animate.css, light-blue.css, normalize.css, style.css, responsive.css, bootstrap.min.js, jquery-1.12.0.min.js, jquery.sticky.js, smooth-scroll.js, waypoints.min.js, wow.min.js, email.css )
