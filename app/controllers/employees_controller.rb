class EmployeesController < ApplicationController
  before_action :find_employee ,only: [:show, :edit, :update]

  def index
    @employees = Employee.all
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_pera)
    if @employee.save
      redirect_to employees_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @employee.update(employee_pera)
      redirect_to @employee
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def employee_pera
    params.require(:employee).permit(:firstname, :lastname, :position)
  end

  def find_employee
    @employee = Employee.find(params[:id])
  end
end
