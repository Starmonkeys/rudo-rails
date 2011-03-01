class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def create
    @task = Task.new(:title => params[:title])
    @task.save
    redirect_to '/'
  end
end
