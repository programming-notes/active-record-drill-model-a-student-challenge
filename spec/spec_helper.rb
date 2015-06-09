ENV['AR_ENV'] = 'test'

require_relative '../config/environment'

require 'database_cleaner'


RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:all) do
    if ActiveRecord::Migrator.current_version == 0
      raise RuntimeError, "Be sure to run 'rake db:migrate' before running these specs."
    end
  end

  config.before(:each) { DatabaseCleaner.start }
  config.after(:each)  { DatabaseCleaner.clean }
end
