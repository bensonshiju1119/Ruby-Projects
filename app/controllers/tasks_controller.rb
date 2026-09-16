class TasksController < ApplicationController
  def index
  @tasks = Task.view_tasks
  end

  def new
  @task = Task.new
  end

  def create 
    @task = Task.create_task(task_params)

    if @task.persisted?
      redirect_to tasks_path
    else
      render :new
    end
  end

  def show 
    @task = Task.find_task(params[:id])
  end

  def edit
    @task = Task.find_task(params[id])
  end

  def update
    @task = Task.update_task(params[id], task_params)

    if @task.errors.empty?
      redirect_to task_path(task)
    else 
      render :edit
    end
  end  

  def destroy
    Task.delete_task(params[:id])
    redirect_to tasks_path
  end

  def search
    @tasks = Task.search_task(params[:keyword])
    render :index
  end

  private

  def task_params
    params.require(:task).permit(
      :name,
      :description,
      :due_date,
      :category,
      :priority
    )
  end
end

