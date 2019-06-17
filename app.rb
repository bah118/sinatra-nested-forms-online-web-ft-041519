require './environment'

module FormsLab
  class App < Sinatra::Base
    
    get '/' do
      erb :index
    end

    get '/pirates' do
			@pirates = Pirate.all
			
			erb :pirates
		end
		
		get '/new' do
			erb :new
		end
		
		# get 'pirates/:id' do
		# 	@pirate = Pirate.find(params[:id])
			
		# 	erb :'pirates/show'
		# end
		
		post '/pirates' do
			@pirate = Pirate.create(name: params[:pirate][:name], weight: params[:pirate][:weight], height: params[:pirate][:height])
		# 	binding.pry
			params[:pirate][:ships].each do |ship_data|
				ship = Ship.new(ship_data)
				ship.pirate = pirate
				ship.save
			end
		# 	binding.pry
			redirect to "/pirates/show"
		  # erb :pirates
		end

  end
end
