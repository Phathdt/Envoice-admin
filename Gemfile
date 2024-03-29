source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'

## Base libs
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'rails', '~> 5.2.2'

## Fronend
gem 'bootstrap-toggle-rails'
gem 'coffee-rails', '~> 4.2'
gem 'font-awesome-sass', '~> 5.2.0'
gem 'sass-rails', '~> 5.0'
gem 'slim-rails'
gem 'uglifier', '>= 1.3.0'
gem 'client_side_validations'

## Authenicate
gem 'devise_token_auth'
gem 'devise-async'
gem 'devise_invitable', '~> 1.7.0'

## Nem core
gem 'nem-ruby'

## Helper gems
gem 'aasm'
gem 'active_storage_validations'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'devise-i18n'
gem 'figaro'
gem 'js-routes'
gem 'kaminari'
gem 'rails-i18n'
gem 'ransack'
gem 'sidekiq'
gem 'rack-cors', :require => 'rack/cors'
gem 'mini_magick', '~> 4.8'
gem 'rb-readline'

group :development, :test do
  gem 'byebug'
  gem 'pry-nav'
  gem 'pry-rails'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'rails-erd', require: false
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :production do
  gem "aws-sdk-s3", require: false
end
