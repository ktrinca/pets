ENV['RAILS_ENV'] = 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/rails'
require 'minitest/matchers'
require 'minitest/rails/capybara'
require 'valid_attribute'
require 'simplecov'
#simplecov
SimpleCov.start 'rails'

# To add Capybara feature tests add `gem "minitest-rails-capybara"`
# to the test group in the Gemfile and uncomment the following:
# require "minitest/rails/capybara"

# Uncomment for awesome colorful output
require 'minitest/pride'

class ActiveSupport::TestCase
  include Capybara::DSL
  
  class << self
    alias :context :describe
  end
  
  
  ActiveRecord::Migration.check_pending!
  #Adds matchers
  include ValidAttribute::Method

  #Adds FactoryGirl
  include FactoryGirl::Syntax::Methods

  #Database cleaner
  DatabaseCleaner.strategy = :truncation

  before :each do
    DatabaseCleaner.start
  end

  after :each do
    DatabaseCleaner.clean
  end

  

end
