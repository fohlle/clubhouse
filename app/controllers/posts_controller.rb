class PostsController < ApplicationController
  before_action :authenticate_member!, except: [:index, :show]


  def index
    @posts = Post.all
    @post = Post.new
  end

  def new
    @post = current_member.posts.build
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = current_member.posts.build(post_params)

    if @post.save
      redirect_to posts_path
      flash[:notice] = "Post saved"
    else
      flash.now[:notice] = "Error fields missing"
      render :new
    end

  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to posts_path
      flash[:notice] = "Post updated"
    else
      flash.now[:notice] = "Error, try again"
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path

  end

  private

  def post_params
    params.require(:post).permit(:title,:body)
  end

end
