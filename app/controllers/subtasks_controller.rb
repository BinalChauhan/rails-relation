class SubtasksController < ApplicationController
  before_action :find_task, only: [:new,:create]
  def index

  end

  def new
    @project = Project.find(params[:project_id])
    @subtask = Subtask.new
    p @task
  end

  def create
    @project = Project.find_by(id: params[:subtask][:project_id])
    p @project
    @task = Task.find_by(id: params[:subtask][:task_id])
    @subtask = Subtask.create!(subtask_pera)
    p @task
    respond_to do |format|
      if @subtask.save
        format.js { redirect_to project_path(@project) }
      else
      render :new, status: :unprocessable_entity
      end
    end
  end

  def show

  end

  private
  def subtask_pera
    params.require(:subtask).permit(:title, :description, :task_id)
  end

  def find_task
    @task = Task.find_by(id: params[:task_id])
  end
end
