class ItemsController < ApplicationController

  get '/items' do
    redirect_if_not_logged_in
    @items = Item.all
    erb :'items/index'
  end

  get '/items/new' do
    redirect_if_not_logged_in
    erb :'items/new'
  end

  post '/items' do
    redirect_if_not_logged_in
    item = Item.create(params)
    item.user_id = session[:user_id]
    item.save
    redirect "/items/#{item.id}"
  end

  get '/items/:id' do
    redirect_if_not_logged_in
    if @item = Item.find_by(params)
      erb :'items/show'
    else
      redirect '/items'
    end

  end

  get '/items/:id/edit' do
    redirect_if_not_logged_in
    @item = Item.find_by(params)
    if !check_owner(@item)
      redirect '/items'
    end
    erb :'items/edit'
  end

  patch '/items/:id' do
    redirect_if_not_logged_in
    @item = Item.find_by(id: params[:id])
    if check_owner(@item)
      @item.update(params[:item])
    end
      erb :'items/show'
  end

  delete '/items/:id' do
    redirect_if_not_logged_in
    item = Item.find_by(id: params[:id])
    if check_owner(item)
        item.delete
    end
      redirect '/items'
  end


end
