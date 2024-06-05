class BlogPostsController < ApplicationController
  def index
    @posts = BlogPost.all
  end

  def show
    @post = BlogPost.find_by(id: params[:id])
    redirect_to root_url unless @post
  end

  def new
    @post = BlogPost.new
  end

  def create
    @post = BlogPost.new(post_params)
    if @post.save
      redirect_to blog_post_path(@post) 
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:blog_post).permit(:title, :body)
  end
end
