class TasksController < ApplicationController

  def index
    @task = Task.new
    @tasks = current_user.tasks.unfinished
  end

  def create
    @task = Task.new(params[:task])
    current_user.tasks << @task
    if @task.save
      if request.xhr?
        render :json => { :title => @task.title }
      else
        redirect_to user_tasks_url(current_user)
      end
    else
      if request.xhr?
        render :json => @task.errors, :status => :unprocessable_entity
      else
        @tasks = current_user.tasks.unfinished
        render 'index'
      end
    end
  end

  def done
    a = current_user.tasks.where(:id => params[:id]).first
    a.done_date = Time.now
    a.save
    redirect_to '/'
  end
end
