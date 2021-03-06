require 'rspec'
require 'provision'
require 'capybara/poltergeist'
require 'capybara/rspec'


Capybara.javascript_driver = :poltergeist

#include ActionDispatch::TestProcess


RSpec.configure do |config|

  config.expect_with :rspec do |expectations|

    expectations.include_chain_clauses_in_custom_matcher_descriptions = true

    config.include Capybara::DSL
  end


  config.mock_with :rspec do |mocks|

    mocks.verify_partial_doubles = true
  end

  Capybara.register_driver :chrome do |app|
    Capybara::Selenium::Driver.new(app, :browser => :chrome)
  end

  Capybara.javascript_driver = :chrome


 end
