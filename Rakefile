require_relative "config/environment"
require 'rspec/core/rake_task'

# Require the files in APP_ROOT/lib
lib_files = Dir[APP_ROOT.join('lib', '*.rb')]

lib_files.each do |model_file|
  require model_file
end




task :default => :spec

desc "Run the spec suite"
RSpec::Core::RakeTask.new(:spec)


desc 'Start IRB with application environment loaded'
task "console" do
  exec "irb -r ./config/environment"
end


namespace :db do
  desc "Create the database"
  task :create do
    puts "Creating development database and test databases, if they don't exist ..."
    touch "db/database.sqlite3"
    touch "db/test-database.sqlite3"
  end


  desc "Drop the database"
  task :drop do
    puts "Dropping development and test databases..."
    rm_f "db/database.sqlite3"
    rm_f "db/test-database.sqlite3"
  end


  desc "Migrate the database"
  task :migrate do
    # Ensure that we see the output when running migrations
    ActiveRecord::Migration.verbose = ENV["VERBOSE"] ? ENV["VERBOSE"] == "true" : true

    # Tell ActiveRecord where to find the migration files and run them
    migrations_directory = "#{APP_ROOT}db/migrate"
    ActiveRecord::Migrator.migrations_paths << migrations_directory
    ActiveRecord::Migrator.migrate ActiveRecord::Migrator.migrations_paths


    # Run migrations for the test database
    system "bundle exec rake db:migrate AR_ENV=test" unless ENV['AR_ENV'] == 'test'
  end

  desc "rollback your migration--use STEPS=number to step back multiple times"
  task :rollback do
    number_of_steps = (ENV['STEPS'] || 1).to_i
    ActiveRecord::Migrator.rollback('db/migrate', number_of_steps)

    # Run the db:version rake task
    Rake::Task['db:version'].invoke if Rake::Task['db:version']
  end


  desc "populate the database with sample data"
  task :seed do
    require APP_ROOT.join('db', 'seeds.rb')
  end


  desc "Returns the current schema version number"
  task :version do
    puts "Current version: #{ActiveRecord::Migrator.current_version}"
  end
end
