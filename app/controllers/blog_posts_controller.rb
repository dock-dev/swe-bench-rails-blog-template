class BlogPostsController < ApplicationController
  def index
    @blog_posts = BlogPost.all
  end

  def show
    @blog_post = BlogPost.find_by(id: params[:id])
    if @blog_post.nil?
      redirect_to root_url
    end
  end

  def new 
    @blog_post = BlogPost.new
  end

  def create
    @blog_post = BlogPost.new(blog_post_params)

    if @blog_post.save
      redirect_to blog_post_path(@blog_post)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @blog_post = BlogPost.find_by(id: params[:id])
    redirect_to root_path unless @blog_post
  end

  def update  
    @blog_post = BlogPost.find_by(id: params[:id])

    if @blog_post
      if @blog_post.update(blog_post_params)
        redirect_to blog_post_path(@blog_post)
      else
        render :edit, status: :unprocessable_entity
      end
    else
      redirect_to root_path
    end
  end

  private

  def blog_post_params
    params.require(:blog_post).permit(:title, :body)  
  end
end