# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

gem 'sinatra'

gem 'activerecord', '~> 5.2.3'
gem 'sinatra-activerecord', '~> 2.0.1'
gem 'pg'
gem 'sendgrid-ruby'

gem 'sprockets', '~> 3.7'
gem 'sprockets-helpers', '~> 1.4.0'
gem 'sass', '~> 3.4', '>= 3.4.22'
gem 'uglifier', '~> 4.2.0'
gem 'sinatra-flash', '~> 0.3.0'
gem 'coffee-script', '~> 2.4.0'
gem 'carrierwave', require: ["carrierwave", "carrierwave/orm/activerecord"]
gem 'rake'
gem 'require_all'
gem 'bcrypt'
gem 'puma'
gem 'i18n', '~> 1.8.0'
gem 'cloudinary'

gem 'sinatra-contrib', require: ["sinatra/reloader", "sinatra/required_params", "sinatra/respond_with", "sinatra/content_for"]


group :development, :test do
  gem 'pry'
end

group :test do
  gem 'rspec'
  gem 'rack-test'
  gem 'database_cleaner-active_record', "~> 1.8.0"
  
end

