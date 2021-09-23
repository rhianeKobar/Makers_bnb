ENV['ENVIRONMENT'] = 'test'

# require File.join(File.dirname(__FILE__), '..', 'app.rb')      ### Why do we need this when the other does it jsut as well
require_relative './../app.rb'
require 'capybara'
require 'rspec'
require 'capybara/rspec'
require 'pg'
require 'simplecov'
require 'simplecov-console' 
require_relative 'setup_test_database'
require_relative '../db/queries/pg_connect.rb'


DB.connect

Capybara.app = BNB

RSpec.configure do |config|
  config.before(:each) do
    setup_test_database
  end
end

#simplecov setup
SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
])
SimpleCov.start

RSpec.configure do |config|

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

end
