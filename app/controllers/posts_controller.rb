class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_url
    else
      render "posts/index"
    end
  end

  private

  def post_params
    params.require(:post).permit(:body)
  end
end
