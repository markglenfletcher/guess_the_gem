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

	def teardown
		@jem.destroy
	end

	def test_jem_sample
		@jem.save
		refute_nil Jem.sample
		assert_equal 1, Jem.sample.count
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

	def test_random_clues_amount
		@jem.generate_clues
		assert_equal 3, @jem.random_clues(3).count
		assert_equal 6, @jem.random_clues(6).count
		assert_equal 6, @jem.random_clues(7).count
	end

	def test_letter_list_contains_all_letters_in_name
		['e','g','m','s','t'].each do |letter|
			assert_includes @jem.letter_list, letter
		end
	end

	def test_letter_list_contains_other_letters
		letters = @jem.letter_list
		['e','g','m','s','t'].each { |letter| letters.delete(letter) }
		refute_empty letters
	end

	def test_letter_list_contains_five_other_letters
		letters = @jem.letter_list
		['e','g','m','s','t'].each { |letter| letters.delete(letter) }
		assert_equal 5, letters.count
	end

	def test_letter_list_length
		assert_equal 10, @jem.letter_list.count
	end

	def test_random_letters_excludes_letters
		refute_equal 'a', @jem.random_letters(1, ['a'])
	end

	def test_random_letters_length
		assert_equal 26, @jem.random_letters(26, []).count
	end

	def test_random_letters_are_unique
		assert_equal 26, @jem.random_letters(26, []).uniq.count
	end
end