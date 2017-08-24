class HikesController < ApplicationController



  get '/hikes' do
    erb :hikes
  end

  get '/hikes/:id' do 
    @hike = Hike.find_by(params[:id])
    erb :'hikes/show_hike'
  end 

end
