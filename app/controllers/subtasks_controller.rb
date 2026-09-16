class SubtasksController < ApplicationController
  def index
    @task = Task.find_task(params[:task_id])
    @subtasks = Subtask.view_subtasks(params[:task_id])
  end

  def new
    @task = Task.find_task(params[:task_id])
    @subtask = Subtask.new
  end

  def create
    @task = Task.find_task(params[:task_id])

    @subtask = Subtask.create_subtask(
      params[:task_id],
      subtask_params
    )

    if @subtask.persisted?
      redirect_to task_subtasks_path(@task)
    else
      render :new
    end
  end

  private

  def subtask_params
    params.require(:subtask).permit(:name, :description)
  end
end
