class HikesController < ApplicationController



  get '/hikes' do
    erb :hikes
  end

  get '/hikes/new' do  
    if logged_in? 
      erb :'/hikes/new'
    else 
      erb :'/users/login'
    end
  end 

  get '/hikes/:id' do
    if logged_in?
      @hike = Hike.find_by(params[:id])
      erb :'hikes/show_hike'
    else
      erb :'/users/login'
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
