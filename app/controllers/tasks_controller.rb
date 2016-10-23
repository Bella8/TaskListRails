class TasksController < ApplicationController
  before_action :find_task, only: [:show, :edit, :update, :completed]

# obtains all takks and shows it at index
  def index
    @tasks_all = Task.all
  end

#shows one task by id in show
  def show;end

#write new task
  def new
    @task = Task.new
  end

#creates the new task
  def create
    @new_task_create = Task.new(task_params) #task_params is a method
    if @new_task_create.save
      redirect_to tasks_path
    else
      render :new
    end
  end

  def edit;end

  def update
    if @task.update(task_params) #task_params is a method
      redirect_to tasks_path
    else
      render :edit
    end
  end

  def destroy
    Task.find(params[:id]).destroy
    redirect_to tasks_path
  end

  def completed
    if @task.completed_at == nil
       @task.completed_at = Date.today
       @task.save
       redirect_to tasks_path
    else
      redirect_to tasks_path
    end
  end

  private
  def find_task
    @task = Task.find(params[:id])
  end
  def task_params
    params.require(:task).permit(:title, :description, :completed, :completed_at)
  end
end
