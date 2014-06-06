require 'minitest/autorun'
require 'mongoid'
require 'mongoid-minitest'

Dir["#{File.dirname(__FILE__)}/../models/*.rb"].each { |f| require f }

Mongoid.configure do |config|
  config.connect_to 'guess-the-gem-test'
end

class Minitest::Unit::TestCase
	include Mongoid::Matchers
end