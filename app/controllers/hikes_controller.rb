class HikesController < ApplicationController



  get '/hikes' do
    erb :hikes
  end

  get '/hikes/:id' do 
    erb :'hikes/show_hike'
  end 

end
