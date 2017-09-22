class PostController < ApplicationController

  def show
    @post = Post.find_by_id(params[:post_id])
  end

  def create
    @city = City.find_by_id(params[:city_id])
    fail
    @post = Post.new(:user_id current_user.id, :city_id @city.id, post_params)
    @post = Post.create(post_params)

    if @post.save
      @city.posts << @post
      redirect_to post_path(@post)
    else
      redirect_to root_path
    end
  end

  private

  def post_params
    p = params.require(:post).permit(:title, :content)
  end

end
