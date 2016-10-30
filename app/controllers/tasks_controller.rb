class TasksController < ApplicationController
  before_action :find_task, only: [:show, :edit, :update, :completed]
  skip_before_action :require_login, only: [:home]
  def index
    @tasks = Task.where(user_id: current_user)
  end

  def show
    if @task.user_id != current_user.id
      flash[:notice] = "You cant see tasks that are not yours"
      redirect_to tasks_path
    end
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create!(task_params)
    @task.user_id = current_user.id
    if @task.save
      redirect_to tasks_path
    else
      render :new
    end
  end

  def edit
    if @task.user_id != current_user.id
      flash[:notice] = "You cant edit tasks that's not yours"
      redirect_to tasks_path
    end
  end

  def update
    if @task.update(task_params)
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

  def home; end

  private
  def find_task
    @task = Task.find(params[:id])
  end
  def task_params
    params.require(:task).permit(:title, :description, :completed, :completed_at)
  end
end
