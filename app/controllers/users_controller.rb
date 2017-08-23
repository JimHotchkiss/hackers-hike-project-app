class UsersController < ApplicationController

  get '/' do #test textt
    @hikes = Hike.all
  # create login and sigup link.
    erb :index
  end

  get '/signup' do
    @hikes = Hike.all
    if logged_in?
      erb :'hikes' # this should maybe be on the hiker_controller?
    else 
      erb :signup
    end 
  end

  post '/signup' do
    binding.pry
    if logged_in?
      erb :hikes
    else 
    @user = User.create(username: params[:username], email: [:email], password: [:password])
    redirect '/hikes'
  end 

  end

  helpers do

    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end 

  end

end
