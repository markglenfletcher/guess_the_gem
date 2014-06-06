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

	before_validation :generate_clues

	def generate_clues
		clues.destroy_all
		clue_types = fields.keys.map { |key| ['_id','name'].include?(key) ? nil : key }.compact
		clue_types.each do |type|
			clues.new(:type => type, :value => [send(type)])
		end
	end
end