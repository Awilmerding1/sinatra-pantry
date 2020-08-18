class ApplicationController < Sinatra::Base

  configure do
    set :views, 'app/views'
  end

  get '/' do
    @name = "Annabel"
    erb :'home'
  end

  get '/items' do
    @items = ["Sugar", "Flour", "Capri Sun"]
    erb :index
  end

  post '/items' do
    @item = Item.new(name: params[:name], quantity: params[:quantity])
    erb :show
  end

  get '/items/new' do
    erb :new
  end

  get '/items/:id' do
    if params[:id] == "1"
      @item = "Sugar"
    else
      @item = "Flour"
    end
    "#{@item}"
  end


end
