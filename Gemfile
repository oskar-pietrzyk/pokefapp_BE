# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.1'

gem 'rails', '~> 6.1.4', '>= 6.1.4.1'

gem 'bootsnap', '>= 1.4.4', require: false
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'rack-cors', '~> 1.1', '>= 1.1.1'

# grape with swagger
gem 'grape', '~> 1.6', '>= 1.6.2'
gem 'grape-swagger', '~> 1.4', '>= 1.4.2'
gem 'grape-swagger-rails', '~> 0.3.1'
gem 'swagger-docs'

# jsonapi
gem 'grape-jsonapi-resources', '~> 0.0.7'
gem 'jsonapi-resources', '~> 0.10.7'

# authentication & authorization
gem 'devise', '~> 4.8', '>= 4.8.1'
gem 'doorkeeper', '~> 5.5', '>= 5.5.4'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'pry', '~> 0.13.1'
  gem 'pry-rails'
  gem 'rails-controller-testing'
  gem 'rspec-rails'
  gem 'shoulda-matchers'
end

group :development do
  gem 'listen', '~> 3.3'
  gem 'rubocop'
  gem 'rubocop-rails'
  gem 'rubocop-rspec'
  gem 'spring'
end

group :test do
  gem 'brakeman', require: false
  gem 'bundler-audit', require: false
  gem 'rspec_junit_formatter'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
