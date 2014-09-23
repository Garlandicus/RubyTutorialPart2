require 'rubygems'
require 'spork'
#uncomment the following line to use spork with the debugger
#require 'spork/ext/ruby-debug'

Spork.prefork do
  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  require 'rspec/autorun'

  #Requires supporting ruby files in spec/support/ and its subdirs
  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

  #Checks for pending migrations before tests are run. 
  #If you are not using ActiveRecord, you can remove this line
  ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

  RSpec.configure do |config|
    # ## Mock Framework
    # I don't really know what any of those are.

    #Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
    config.fixture_path = "#{::Rails.root}/spec/fixtures"

    #If you're not using ActiveRecord, or you don't like transactions, nix this line
    config.use_transactional_fixtures = true

    #If true, the base class of anon controllers will be inferred automatically.
    config.infer_base_class_for_anonymous_controllers = false

    #Run specs in random order to surface order dependencies
    config.order = "random"
    config.include Capybara::DSL
  end
end

Spork.each_run do
  # This code will be run each time you run your specs.

end
