class TasksController < ApplicationController
  def index
    @tasks = current_user.tasks.unfinished
    #.unfinished_tasks
  end

  def create
    @task = Task.new(:title => params[:title])
    current_user.tasks << @task
    if @task.save

      redirect_to user_tasks_url(current_user)
    else
      @tasks = current_user.tasks.unfinished
      render 'index'
    end
  end

  def done
    a = current_user.tasks.where(:id => params[:id]).first
    a.done_date = Time.now
    a.save
    redirect_to '/'
  end
end
