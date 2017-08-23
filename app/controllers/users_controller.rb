class UsersController < ApplicationController

  get '/' do #test textt
    @hikes = Hike.all
  # create login and sigup link.
    erb :index
  end

  get '/signup' do  
    erb :signup
  end

  post '/signup' do
    
  end

end
