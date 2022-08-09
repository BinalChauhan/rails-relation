class CompaniesController < ApplicationController
  before_action :find_Company , only: [:show, :edit, :update, :display]

  def index
    @companies = Company.all
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_para)
    if @company.save
      redirect_to companies_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @company.update(company_para)
      redirect_to @company
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  def company_para
    params.require(:company).permit(:comapny_name)
  end

  def find_Company
    puts "before action called"
    @company = Company.find(params[:id])
  end
end
