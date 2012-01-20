# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'rspec'
require 'capybara'
require 'capybara/rspec'

include Capybara::DSL
Capybara.javascript_driver = :selenium

#Capybara.app_host ='http://www.google.com/ncr'
Capybara.app_host ='http://50.16.204.251/index.php?r=user/user/login'
# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.

RSpec.configure do |config|
  # == Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr
  config.mock_with :rspec

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  #  config.fixture_path = "#{::Rails.root}/spec/fixtures"
end
