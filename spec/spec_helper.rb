#$:.push(File.expand_path(File.dirname(__FILE__) + '/../lib'))
require 'mocha'
Dir["lib/**/*.rb"].sort.each { |file| require(File.dirname(__FILE__) + "/../"+ file) }

