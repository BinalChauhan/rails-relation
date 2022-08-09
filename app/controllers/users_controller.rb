class UsersController < ApplicationController
  before_action :find_user , only: [:show, :edit, :update, :display]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_para)
    if @user.save
      redirect_to users_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_para)
      redirect_to @user
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  def user_para
    params.require(:user).permit(:fname,:lname,:email)
  end

  def find_user
    puts "before action called"
    @user = User.find(params[:id])
  end

end
