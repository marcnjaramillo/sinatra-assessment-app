class UsersController < ApplicationController

  get '/signup' do
    if !logged_in?
      erb :'users/create_user'
    else
      redirect to '/jobs'
    end
  end

  post '/signup' do
    if !logged_in?
      user = User.new(params)
      if user.save
        session[:user_id] = user.id
        redirect to '/jobs'
      else
        redirect to '/signup'
      end
    else
      redirect to '/jobs'
    end
  end

  get '/login' do
    if !logged_in?
      erb :'users/login'
    else
      redirect '/jobs'
    end
  end

  post '/login' do
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect "/jobs"
    else
      erb :'users/error'
    end
  end

  get '/logout' do
    if logged_in?
      session.clear
      redirect to '/login'
    else
      redirect to '/'
    end
  end

  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    erb :'users/show'
  end
end
