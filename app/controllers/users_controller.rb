class UsersController < ApplicationController

  get '/signup' do

    if current_user
      redirect '/items'
    end
    erb :'users/signup'
  end

  get '/login' do
    if current_user
      redirect '/items'
    end
      erb :'users/login'
  end

  post '/login' do
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect "/users/#{@user.id}"
    else
      flash[:message] = "Invalid Login"
      erb :'/users/login'
    end
  end

  post '/signup' do
    user = User.create(params)
    if user.valid?
      session[:user_id] = user.id
      redirect "/users/#{user.id}"
    else
      flash[:message] = user.errors.full_messages
      redirect '/signup'
    end
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
