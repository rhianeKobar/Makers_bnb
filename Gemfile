# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

ruby '2.7.2'

group :development do
	gem "sinatra"
	gem "sinatra-contrib"
	gem "pg"
	gem 'bcrypt'
end

group :test do
	gem "rubocop"
	gem "simplecov"
  gem 'simplecov-console', require: false
	gem "capybara"
	gem "rspec"
	gem 'thin'
end
