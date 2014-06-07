require './app.rb'

ENV['RACK_ENV'] = 'development'

Mongoid.configure do |config|
	config.connect_to 'guess-the-gem-development' if ENV['RACK_ENV'] = 'development'
	config.connect_to 'guess-the-gem' if ENV['RACK_ENV'] = 'production'	
end

run GuessTheGem