class TasksController < ApplicationController
  before_action :find_project
  before_action :find_task, only: [:show, :destroy]

  def index
  end

  def new
    @task = @project.tasks.build
  end

  def create
    @task = @project.tasks.new(task_pera)
    if @task.save
      redirect_to project_tasks_path(@project)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def destroy
    @task.destroy
    redirect_to project_tasks_path,status: :see_other
  end

  private

  def find_project
    @project = Project.find(params[:project_id])
  end

  def find_task
    @task = @project.tasks.find(params[:id])
  end

  def task_pera
    params.require(:task).permit(:title, :estimated_hour, :project_id, :task_id)
  end
end
