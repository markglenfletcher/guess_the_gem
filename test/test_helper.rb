ENV['RACK_ENV'] = 'test'

require 'minitest/autorun'
require 'rack/test'

require_relative '../app.rb'

Mongoid.configure do |config|
  config.connect_to 'guess-the-gem-test'
end

class Minitest::Unit::TestCase
	include Mongoid::Matchers
end