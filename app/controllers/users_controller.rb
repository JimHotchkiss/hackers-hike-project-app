class UsersController < ApplicationController

  get '/' do
    @hikes = Hike.all
    erb :'/users/index'
  end

  get '/hikes' do
    if logged_in?
      @hikes = Hike.all
      erb :'/hikes/hikes'
    else
      redirect '/login'
    end
  end

  get '/signup' do
    if logged_in?
      redirect '/hikes'
    else
      @user = User.new
      erb :'/users/signup'
    end
  end

  post '/signup' do
    @user = User.new(params)
    if @user.save
      session[:user_id] = @user.id
      redirect '/hikes'
    else
      erb :'/users/signup'
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
      session[:user_id] = @user.id
      redirect '/hikes'
    else
      redirect '/login'
    end
  end

  get '/logout' do
    session.clear
    redirect '/'
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
