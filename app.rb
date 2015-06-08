require 'pathname'

APP_ROOT = Pathname.new(File.dirname(File.expand_path(__FILE__)))

#require the ActiveRecord db configuration
require APP_ROOT.join('db', 'config')


#require the app's models
require APP_ROOT.join('app', 'models', 'student')

# are other require statements needed to include all your models?

