require './app.rb'

Mongoid.configure do |config|
	db = 'guess-the-gem'
	db = 'guess-the-gem-dev' if ENV['RACK_ENV'] == 'development'
	config.connect_to db
end

run GuessTheGem