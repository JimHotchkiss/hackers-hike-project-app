require 'rack-flash'
class HikesController < ApplicationController
  enable :sessions
  use Rack::Flash

  get '/hikes' do
    if logged_in?
      @hikes = Hike.all
      erb :'/hikes/hikes'
    else
      redirect '/login'
    end
  end

  get '/user/hikes' do
    @hikes = current_user.hikes
    erb :'/hikes/user_hikes'
  end

  get '/hikes/new' do
    if logged_in?
      erb :'/hikes/new'
    else
      erb :'/users/login'
    end
  end

  post '/hikes/new' do
    if params[:hike][:name] == "" || params[:hike][:location] == "" || params[:hike][:description] == ""

      flash[:message] = "Please, do not leave form incomplete."

      redirect '/hikes/new'
    end

      @hike = Hike.create(params[:hike])
      @hike.user_id = session[:user_id]
      @hike.save
      @hikes = Hike.all

      redirect :"/hikes/#{@hike.slug}"
  end

  get '/hikes/:slug' do
    if logged_in?
      @hike = Hike.find_by_slug(params[:slug])
      erb :'hikes/show_hike'
    else
      erb :'/users/login'
    end
  end

  get '/hikes/:slug/edit' do
    @hike = Hike.find_by_slug(params[:slug])
    if @hike.user_id == session[:user_id]
      erb :'hikes/edit_hike'
    else
      flash[:message] = "Sorry. You are not authorized to edit this hike."
      redirect "/hikes/#{@hike.slug}"
    end
  end

  patch '/hikes/:slug/edit' do
    @hike = Hike.find_by_slug(params[:slug])
    if params[:hike][:name] == "" || params[:hike][:location] == "" || params[:hike][:description] == ""

      flash[:message] = "Please, do not leave form incomplete."

      redirect "/hikes/#{@hike.slug}"
    else
    @hike.name = params[:hike][:name]
    @hike.location = params[:hike][:location]
    @hike.description = params[:hike][:description]
    @hike.difficulty_id = params[:hike][:difficulty_id]
    @hike.save
    @hikes = Hike.all
      redirect "/hikes/#{@hike.slug}"
    end
  end

  get '/hikes/:slug/delete' do
    @hike = Hike.find_by_slug(params[:slug])
    if params[:id].to_i == session[:user_id]
      erb :'hikes/edit_hike'
    else
      redirect '/hikes'
    end
  end

  delete '/hikes/:slug/delete' do
    @hike = Hike.find_by_slug(params[:slug])
    if @hike.user_id == session[:user_id]
      @hike.delete
      redirect '/hikes'
    else
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
