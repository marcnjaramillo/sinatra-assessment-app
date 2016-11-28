class JobsController < ApplicationController
  get '/jobs' do
    if logged_in?
      @jobs = Job.all
      erb :'jobs/details'
    else
      redirect to '/login'
    end
  end

  get '/jobs/new' do
    if logged_in?
      erb :'jobs/create_job'
    else
      redirect to '/login'
    end
  end

  post '/jobs' do
    if params[:location] || params[:type] || params[:duration] == ""
    else
      current_user.jobs.create(location: params["location"], type: params["type"], duration: params["duration"])
      session[:id] = @user.id
      redirect to "/jobs/#{@jobs.id}"
    end
  end
end
