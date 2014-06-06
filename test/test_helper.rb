require 'minitest/autorun'
require 'mongoid'
require 'mongoid-minitest'

Mongoid.configure do |config|
  config.connect_to 'guess-the-gem-test'
end

class Minitest::Unit::TestCase
	include Mongoid::Matchers
end

class Tester
	include Mongoid::Document

	field :name, type: String
end