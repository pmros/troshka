require 'Qt4'

path = File.expand_path('./qt', File.dirname(__FILE__))
Dir["#{path}/**/*.rb"].each { |file| require_relative file }