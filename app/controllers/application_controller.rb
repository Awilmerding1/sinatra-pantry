class ApplicationController < Sinatra::Base

  configure do
    set :views, 'app/views'
  end

  get '/' do
    @name = "Annabel"
    erb :'home'
  end

  

end
