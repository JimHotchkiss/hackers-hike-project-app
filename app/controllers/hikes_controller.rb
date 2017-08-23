class HikesController < ApplicationController

  get '/' do #test textt
    @hikes = Hike.all
    erb :index
  end

end