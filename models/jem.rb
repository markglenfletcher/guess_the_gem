class Jem
	include Mongoid::Document
	embeds_many :clues

	field :name, :type => String
	field :downloads, :type => Integer, :default => 0
	field :version, :type => String, :default => '0.0.1'
	field :platform, :type => String, :default => 'ruby'
	field :authors, :type => Array
	field :info, :type => String
	field :dependencies, :type => Array

	validates_presence_of :name, :downloads, :version, :platform, :authors, :info
	validates_uniqueness_of :name, :case_sensitive => true

	before_validation :generate_clues

	def generate_clues
		clues.destroy_all
		clue_types = fields.keys.map { |key| ['_id','name'].include?(key) ? nil : key }.compact
		clue_types.each do |type|
			clues.new(:type => type, :value => [send(type)])
		end
	end

	def random_clues(amount=3)
		clues.sample(amount)
	end

	def letter_list
		name_letters = name.each_char.map{ |char| char.downcase unless char.blank? }.uniq.compact
		name_letters << random_letters(name_letters)
		name_letters.flatten
	end

	def random_letters(amount=5, excluding)
		('a'..'z').to_a.map { |letter| letter unless excluding.include?(letter) }.compact.sample(amount)
	end

	class << self
		def sample(amount=1)
			Jem.all.to_a.sample(amount)
		end
	end
end