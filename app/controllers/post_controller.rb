class PostController < ApplicationController

  def show
    @post = Post.find_by_id(params[:post_id])
  end

  def create
    # if the inputs are valid create a new record
    # else we redirect them back to that city page with error
    @city = City.find_by_id(params[:city_id])
    if post_params.permitted?
      author = current_user.first_name + " " + current_user.last_name
      @post = Post.create(user_id: current_user.id, author: author, city_id: @city.id, title: post_params[:title], content: post_params[:content])
      redirect_to post_path(@post)
    else
      # redirect to main city mage for now
      redirect_to cities_path
    end
  end

  private

  def post_params
    p = params.require(:post).permit(:title, :content)
  end

end
