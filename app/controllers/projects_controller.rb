class ProjectsController < ApplicationController
  before_action :find_project, only: [:show, :edit,:update]

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_para)
    if @project.save
      redirect_to projects_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @project.update(project_para)
      redirect_to @project
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def project_para
    params.require(:project).permit(:name, :description, :start_date, developer_ids:[])
  end

  def find_project
    @project = Project.find(params[:id])
  end
end
