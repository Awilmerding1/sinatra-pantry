class ItemsController < ApplicationController

  get '/items' do
    @items = Item.all
    erb :'items/index'
  end

  get '/items/new' do
    erb :'items/new'
  end

  post '/items' do
    item = Item.create(params)
    item.user_id = session[:user_id]
    item.save
    redirect "/items/#{item.id}"
  end

  get '/items/:id' do
    if @item = Item.find_by(params)
      erb :'items/show'
    else
      redirect '/items'
    end

  end

  get '/items/:id/edit' do
    @item = Item.find_by(params)
    if @item.user_id != session[:user_id]
      redirect '/items'
    end
    erb :'items/edit'
  end

  patch '/items/:id' do
    @item = Item.find_by(id: params[:id])
    if @item.user_id == session[:user_id]
      @item.update(params[:item])
    end
      erb :'items/show'
  end

  delete '/items/:id' do
      item = Item.find_by(id: params[:id])
      item.delete
      redirect '/items'
  end


end
