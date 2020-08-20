class UsersController < ApplicationController

  get '/signup' do
    erb :'users/signup'
  end

  get '/login' do
      erb :'users/login'
  end

  post '/login' do
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/users/#{user.id}"
    else
      redirect '/login'
    end
  end

  post '/signup' do
    user = User.create(params)
    session[:user_id] = user.id
    redirect "/users/#{user.id}"
  end

  get '/users/:id' do
    @user = User.find_by(params)
    @items = @user.items
    erb :'users/show'
  end

  get '/logout' do
    session.clear
    redirect '/login'
  end

end
