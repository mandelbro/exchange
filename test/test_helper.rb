ENV['RAILS_ENV'] = 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/rails'
begin; require 'turn/autorun'; rescue LoadError; end

# To add Capybara feature tests add `gem 'minitest-rails-capybara'`
# to the test group in the Gemfile and uncomment the following:
require 'minitest/rails/capybara'

# Uncomment for awesome colorful output
require 'minitest/pride'

# Require devise test helpers
class ActionController::TestCase
  include Devise::TestHelpers
end

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

Turn.config.format = :pretty

def sign_in
  visit new_user_session_path
  fill_in "Email", with: "rewt@test.com"
  fill_in "Password", with: "password"
  page.find("form").click_on "Sign in"
end
