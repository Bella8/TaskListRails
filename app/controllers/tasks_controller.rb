class TasksController < ApplicationController
  def index
    @new_task = Task.all

  end

  def show

  @new_task = Task.find(params[:id])

  end

  def new
    @new_task = Task.new
  end

  def create
    @new_task = Task.new(task_params)

    if @new_task.save
      redirect_to tasks_path
    else
      render :new

    end
  end

  def edit
    @params = params
    @new_task = Task.find(params[:id])
  end

  def update
    @new_task = Task.find(params[:id])
    if @new_task.update(task_params)
          redirect_to tasks_path
    else
      render :edit
    end
  end

  def destroy
    Task.find(params[:id]).destroy
    redirect_to tasks_path
  end


  private
  def task_params
  #strong params.  if it's not in the strong param its not going go to the
  # its not been saved.
    params.require(:task).permit(:title, :description, :completion_status, :completed_a)
  end
end
