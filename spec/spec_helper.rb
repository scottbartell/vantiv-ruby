require 'vantiv-ruby'
require 'capybara/rspec'
require 'dotenv'
Dotenv.load
Dir["#{Vantiv.root}/spec/support/**/*.rb"].each {|f| require f}

Vantiv.configure do |config|
  config.license_id = ENV["LICENSE_ID"]
  config.acceptor_id = ENV["ACCEPTOR_ID"]
  config.application_id = ENV["APP_ID"]
  config.order_source = "ecommerce"

  config.default_report_group = '1'
end

Capybara.configure do |config|
  config.run_server = false
  config.default_driver = :selenium
end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end
