require_relative '../test_helper'

class ClueTest < Minitest::Unit::TestCase
	def setup
   	@clue_attr = {
   		:type => 'version', :value => '0.0.1'
   	}
   	@clue = Clue.new(@clue_attr)
	end

	def test_generate_text
		refute_nil @clue.generate_text 
		assert_equal 'Gem has version: 0.0.1', @clue.generate_text
	end

	def test_generate_text_for_array
		@clue_attr = { :type => :dependencies, :value => ["pry","try","dry"] }
		@clue = Clue.new(@clue_attr)
		assert_equal 'Gem has dependencies: pry, try, dry', @clue.generate_text
	end

	def test_has_text_on_save
		@clue.save
		refute_nil @clue.text
	end
end