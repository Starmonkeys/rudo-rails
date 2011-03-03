class TasksController < ApplicationController
  def index
    @tasks = Task.unfinished_tasks
  end

  def create
    @task = Task.new(:title => params[:title])
    if @task.save

      redirect_to '/'
    else
      @tasks = Task.unfinished_tasks
      render 'index'
    end
  end

  def done
    a = Task.find(params[:id])
    a.done_date = Time.now
    a.save
    redirect_to '/'
    # this is the same:
    # Task.find(params[:id]).update_attribute(:done_date, Time.now)
  end
end
