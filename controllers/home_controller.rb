class GuessTheGem < Sinatra::Application
	get '/' do
		@jems = Jem.sample(3)
		haml :index
	end

	before '/jems/:id/clues' do
		halt "Invalid ID" unless Jem.where(:id => params[:id]).count > 0
	end

	get '/jems/:id/clues' do
		@jem = Jem.find(params[:id])
		@clues = @jem.clues
		haml :clues
	end

	not_found do
		haml :not_found
	end
end