class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    render :show
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to sub_post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end
  
  def new
    @post = Post.new
    render :new
  end
  

  def edit
    @post = Post.find(params[:id])
    render :edit
  end
  
  private
  def post_params
    params.require(:post).permit(:title, :url, :content, sub_ids: [])
  end
end
