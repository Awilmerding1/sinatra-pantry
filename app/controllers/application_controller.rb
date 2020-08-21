class ApplicationController < Sinatra::Base

  configure do
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

  register Sinatra::Flash

  get '/' do
    erb :'home'
  end

  helpers do
      def current_user
        User.find_by(id: session[:user_id])
      end

      def redirect_if_not_logged_in
        if !current_user
          flash[:message] = "You must log in to see that page"
          redirect '/login'
        end
      end

      def check_owner(obj)
        obj.user == current_user
      end

  end



end
