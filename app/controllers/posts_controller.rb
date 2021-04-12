class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]
  def index
    @posts = Post.order(id: :asc)
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.create!
    redirect_to post
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update!(post_params)
    redirect_to post
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy!
    redirect_to root_path
  end

  private


  def post_params
    params.require(:post).permit(:title, :content)
  end
end
