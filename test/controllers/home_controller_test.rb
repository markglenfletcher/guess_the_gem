require_relative '../test_helper'

class TestHomeController < Minitest::Unit::TestCase
	include Rack::Test::Methods

	def app
		GuessTheGem
	end
end