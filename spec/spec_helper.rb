# # Set the environment to "test"
# ENV['RACK_ENV'] = 'test'

# # Bring in the contents of the `app.rb` file. The below is equivalent to: require_relative '../app.rb'
# require File.join(File.dirname(__FILE__), '..', 'app.rb')

# # Require all the testing gems
# require 'capybara'
# require 'capybara/rspec'
# require 'rspec'

# # Tell Capybara to talk to Application
# Capybara.app = Application
require 'database_connection'

# Make sure this connects to your test database
# (its name should end with '_test')
DatabaseConnection.connect('chitter_test')

require 'simplecov'
require 'simplecov-console'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

RSpec.configure do |config|
  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
