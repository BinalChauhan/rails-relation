class PostsController < ApplicationController
  before_action :find_post , only: [:show, :edit, :update, :display]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_para)
    if @post.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    # @post = Post.find(params[:id])
  end

  def edit
    # @post = Post.find(params[:id])
  end

  def update
    # @post = Post.find(params[:id])
    if @post.update(post_para)
      redirect_to @post
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def display
    # @post = Post.find(params[:id])
  end

  private
  def post_para
    params.require(:post).permit(:title,:description,:date,:user_id,:company_id)
  end

  def find_post
    puts "before action called"
    @post = Post.find(params[:id])
  end

end
