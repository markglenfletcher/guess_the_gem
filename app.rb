require 'bundler'
Bundler.require

configure do
	Dir["#{File.dirname(__FILE__)}/models/*.rb"].each { |f| require f }
	Dir["#{File.dirname(__FILE__)}/controllers/*.rb"].each { |f| require f }
end

class GuessTheGem < Sinatra::Application
end