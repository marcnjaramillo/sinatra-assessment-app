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
      redirect to '/jobs/new'
    else
      current_user.jobs.create(location: params["location"], type: params["type"], duration: params["duration"])
      redirect to "/jobs/#{@jobs.id}"
    end
  end

  get '/jobs/:id' do
    if logged_in?
      @job = Job.find_by_id(params[:id])
      erb :'jobs/show_job'
    else
      redirect to '/login'
    end
  end

  get '/jobs/:id/edit' do
    if logged_in?
      @job = Job.find_by_id(params[:id])
      if @job.user_id == current_user.id
       erb :'jobs/edit_job'
      else
        redirect to '/jobs'
      end
    else
      redirect to '/login'
    end
  end

  patch '/jobs/:id' do
    if params[:content] == ""
      redirect to "/jobs/#{params[:id]}/edit"
    else
      @job = Job.find_by_id(params[:id])
      @job.location = params[:location]
      @job.type = params[:type]
      @job.duration = params[:duration]
      @job.save
      redirect to "/jobs/#{@job.id}"
    end
  end

  delete '/jobs/:id/delete' do
    if logged_in?
      @job = Job.find_by_id(params[:id])
      if @job.user_id == current_user.id
        @job.delete
        redirect to '/jobs'
      else
        redirect to '/job'
      end
    else
      redirect to '/login'
    end
  end
end
