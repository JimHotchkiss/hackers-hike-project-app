class UsersController < ApplicationController

  get '/' do #test textt
    @hikes = Hike.all
  # create login and sigup link.
    erb :index
  end

  get '/signup' do
    if logged_in?
      erb :'hikes' # this should maybe be on the hiker_controller?
    else
      erb :signup
    end
  end

  post '/signup' do
    if params[:username] == "" || params[:email] == "" || params[:password] == ""
      redirect '/signup'
    else
      @user = User.create(username: params[:username], email: params[:email], password: params[:password])
      session[:user_id] = params[:id]
      @hikes = Hike.all
      erb :hikes
    end
  end

  get '/login' do
    if logged_in?
      erb :hikes
    else
      erb :login
    end
  end

  post '/login' do

    @user = User.find_by(username: params[:username])
    binding.pry
    if @user && @user.authenticate(params[:password])
      session[:user_id] = params[:id]
      erb :hikes
    else
      redirect '/login'
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
