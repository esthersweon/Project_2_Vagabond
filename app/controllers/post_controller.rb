class PostController < ApplicationController

  def show
    @post = Post.find_by_id(params[:post_id])
    @current_user = current_user
  end

  def create
    # if the inputs are valid create a new record
    # else we redirect them back to that city page with error
    @city = City.find_by_id(params[:city_id])
    if post_params.permitted?
      author = current_user.first_name + " " + current_user.last_name
      @post = Post.create(user_id: current_user.id, author: author, city_id: @city.id, title: post_params[:title], content: post_params[:content])
      if !@post.id.nil?
        redirect_to post_path(@post)
      else
        flash[:error] = "Title must be between 1 to 200 characters and post must not be empty."
        redirect_to city_path(@city)
      end
    else
      # redirect to main city mage for now
      redirect_to cities_path
    end
  end

  def edit
    @post = Post.find_by_id(params[:post_id])
  end

  # update post from form
  def update
    @post = Post.find_by_id(params[:post_id])
    @post.update_attributes(post_params)
    if !@post.valid?
      flash[:error] = "Title must be between 1 to 200 characters and post must not be empty."
    end
    redirect_to post_path(@post)
  end

  # delete post
  def destroy
    post = Post.find_by_id(params[:post_id])
    post.destroy
    redirect_to user_path(current_user)

  end

  private

  def post_params
    p = params.require(:post).permit(:title, :content)
  end

end
