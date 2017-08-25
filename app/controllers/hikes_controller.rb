class HikesController < ApplicationController



  get '/hikes' do
    if logged_in?
      @hikes = Hike.all
      erb :'/hikes/hikes'
    else
      redirect '/login'
    end
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
      redirect '/hikes/new'
    end

      @hike = Hike.create(params[:hike])
      @hike.user_id = session[:user_id]
      @hike.save
      @hikes = Hike.all
      redirect :"/hikes/#{@hike.id}"
  end

  get '/hikes/:slug' do
    if logged_in?
      @hike = Hike.find_by_slug(params[:slug])
      binding.pry
      erb :'hikes/show_hike'
    else
      erb :'/users/login'
    end
  end

  get '/hikes/:id/edit' do
    if params[:id].to_i == session[:user_id]
      erb :'hikes/edit_hike'
    else
      redirect '/hikes'
    end
  end

  get '/hikes/:id/delete' do
    if params[:id].to_i == session[:user_id]
      erb :'hikes/edit_hike'
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
