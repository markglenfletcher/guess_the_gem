class Clue
  include Mongoid::Document

  field :type, :type => String
  field :value, :type => Array
  field :text, :type => String

  validates_presence_of :type, :value, :text

  before_validation :generate_text

  def generate_text
    self.text = "Gem has #{type.to_s}: #{[value].flatten.join(', ')}"
  end
end