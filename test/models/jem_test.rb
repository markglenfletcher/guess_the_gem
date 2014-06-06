require_relative '../test_helper'

class JemTest < Minitest::Unit::TestCase
	def setup
		@jem_attr = {
			:name => 'Test Gem', 
   		:downloads => 20,
   		:version => "0.1.1",
   		:platform => 'ruby',
   		:authors => ["Marky Fletcher"],
   		:info => "Gem for the test stuff",
   		:dependencies => ["pry","try","dry"]
   	}
   	@jem = Jem.new(@jem_attr)
	end

	def test_jem_available
		assert_equal true, @jem.valid?
	end

	def test_jem_defaults
		default_jem = Jem.new()
		assert_equal 0, default_jem.downloads
		assert_equal "0.0.1", default_jem.version
		assert_equal 'ruby', default_jem.platform
	end

	def test_responds_to_clues
		assert_equal true, @jem.respond_to?(:clues)
	end

	def test_clues_generated_on_save
		assert_equal 0, @jem.clues.count
		@jem.save
		assert_equal 6, @jem.clues.count
	end
end