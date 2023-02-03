# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

gem 'bcrypt', '~> 3.1.7'
gem 'bootsnap', require: false
gem 'dotenv'
gem 'jwt'
gem 'puma', '~> 5.0'
gem 'rails', '~> 7.0.4'
gem 'sqlite3', '~> 1.4'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem 'awesome_print'
  gem 'dotenv-rails'
  gem 'factory_bot_rails'
  gem 'pry'
  gem 'pry-byebug'
  gem 'rspec-rails'
  gem 'rubocop', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec'
end

group :test do
  gem 'faker'
  gem 'json_spec'
  gem 'mocha', '~> 1.13'
  gem 'rack-test'
  gem 'rails-controller-testing'
  gem 'shoulda', '~> 4.0'
  gem 'shoulda-matchers', '~> 4.0'
  gem 'simplecov', '0.17.1'
  gem 'webmock'
end

gem "database_cleaner-active_record", "~> 2.0", :group => :test
