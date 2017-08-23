
class ApplicationController < Sinatra::Base

  configure do
		set :views, 'app/views' #this allows me to set my 'views' path
		enable :sessions
		set :session_secret, "security_password"
	end


end
