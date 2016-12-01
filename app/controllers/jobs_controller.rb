class JobsController < ApplicationController
  get '/jobs' do
    if logged_in?
      @jobs = current_user.jobs.all
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
    if params[:location] == "" || params[:nature] == "" || params[:duration] == ""
      redirect to '/jobs/create_job'
    else
      @user = current_user
      @job = Job.create(location: params[:location], nature: params[:nature], duration: params[:duration], user_id: @user.id)
      redirect to "/jobs/#{@job.id}"
    end
  end

  get '/jobs/:id' do
    if logged_in?
      @job = Job.find(params[:id])
      erb :'jobs/show_job'
    else
      redirect to '/login'
    end
  end

  get '/jobs/:id/edit' do
    if logged_in?
      @job = Job.find(params[:id])
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
    if params[:location] == "" || params[:nature] == "" || params[:duration] == ""
      redirect to "/jobs/#{params[:id]}/edit"
    else
      @job.location = params[:location]
      @job.nature = params[:nature]
      @job.duration = params[:duration]
      @job.save
      redirect to "/jobs/#{@job.id}"
    end
  end

  delete '/jobs/:id/delete' do
    if logged_in?
      @job = Job.find(params[:id])
      if @job.user_id == current_user.id
        @job.destroy
        redirect to '/jobs'
      else
        redirect to '/login'
      end
    end
  end
end
