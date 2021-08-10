class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end
  def show
    @task = Task.find(params[:id])
  end
  def new
    @task = Task.new
  end
  def create
    @task = Task.new(params.require(:task).permit(:title, :details))
    if @task.save
      # Do something
      redirect_to task_path(@task)
    else
      render(:new)
    end
  end
  def edit
    @task = Task.find(params[:id])
    # raise
  end
  def update
    @task = Task.find(params[:id])
    # raise
    if @task.update(params.require(:task).permit(:title, :details, :completed))
      # Do something
      redirect_to task_path(@task)
    else
      render(:edit)
    end
  end
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end
end
