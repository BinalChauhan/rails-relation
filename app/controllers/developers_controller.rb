class DevelopersController < ApplicationController
  before_action :find_developer, only: [:show, :edit, :update]

  def index
    @developers = Developer.all
  end

  def new
    @developer = Developer.new
  end

  def create
    @developer = Developer.new(developer_pera)
    if @developer.save
      redirect_to developers_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @developer.update(developer_pera)
      redirect_to @developer
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def developer_pera
    params.require(:developer).permit(:name, :email,:skill_level, :categories, :experience, :language, project_ids: [])
  end

  def find_developer
    @developer = Developer.find(params[:id])
  end
end
