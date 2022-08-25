class CommentsController < ApplicationController

  before_action :set_commentable, only: [:new]
  @@commentable = ''

  def new
    if params[:task_id]
      @task = find_task
      @task.project_id
    else
      @project = find_project
    end
    @comment = @commentable.comments.new
  end

  def create
    @comment = @@commentable.comments.create!(comment_pera)
    @project = Project.find_by(id: params[:comment][:project_id])

    if @comment.save
      redirect_to project_path(@project)
    else
      render :new,status: :unprocessable_entity
    end
  end

  private

  def set_commentable
    if params[:task_id]
      task = Task.find_by(id: params[:task_id])
      type = params.keys[0].split('_').map(&:capitalize)
      resource = type[0]
      @commentable = resource.singularize.classify.constantize.find(task.id)
      @@commentable = @commentable
    else
      project = Project.find_by(id: params[:project_id])
      type = params.keys[0].split('_').map(&:capitalize)
      resource = type[0]
      @commentable = resource.singularize.classify.constantize.find(project.id)
      @@commentable = @commentable
    end
  end


  def find_task
    @task = Task.find_by(id: params[:task_id])
  end

  def find_project
    @project = Project.find_by(id: params[:project_id])
  end

  def comment_pera
    params.require(:comment).permit(:description)
  end

end
