source 'https://rubygems.org'
ruby "2.4.0"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails', '~> 5.0.2'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0.4'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'jbuilder', '~> 2.5'
gem 'bootstrap', '~> 4.0.0.beta'
gem 'font-awesome-rails'
gem 'devise'
gem 'leaflet-rails'
gem 'active_model_serializers', '~> 0.8.3', require: true
gem 'will_paginate'
gem 'api-pagination'
gem 'mail_form'
gem 'activeadmin'
gem 'kaminari'
gem 'omniauth-facebook'
gem 'omniauth-oauth2', '~> 1.3.1'
gem 'acts_as_votable', '~> 0.11.1'
gem 'gibbon'
gem 'premailer-rails'
gem 'figaro'


group :development, :test do
  gem 'byebug', platform: :mri
  gem 'sqlite3'
  gem 'thin'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :production do
  gem 'pg'
  gem 'mengpaneel'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
