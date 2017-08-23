class UsersController < ApplicationController

  get '/' do
    @hikes = Hike.all
    erb :'/users/index'
  end

  get '/hikes' do
      @hikes = Hike.all
      erb :'/hikes/hikes'
  end

  get '/signup' do
    if logged_in?
      erb :'/hikes/hikes'
    else
      erb :'/users/signup'
    end
  end

  post '/signup' do
    if params[:username] == "" || params[:email] == "" || params[:password] == ""
      redirect '/users/signup'
    else
      @user = User.create(username: params[:username], email: params[:email], password: params[:password])
      session[:user_id] = params[:id]
      redirect '/hikes'
    end
  end

  get '/login' do
    if logged_in?
      redirect '/hikes'
    else
      erb :'/users/login'
    end
  end

  post '/login' do

    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = params[:id]
      redirect '/hikes'
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
