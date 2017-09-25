class PostController < ApplicationController

  def show
    @post = Post.find_by_id(params[:post_id])
    @current_user = current_user
  end

  def create
    @city = City.find_by_id(params[:city_id])

    if post_params.permitted?
      author = current_user.first_name + " " + current_user.last_name

      # IMPORTANT:
      # You should not need to write all these params out
      # You should include user_id and city_id in your post_params method at the bottom of this file,
      # and create hidden fields for user_id and city_id in your create post form.
      @post = Post.create(user_id: current_user.id, author: author, city_id: @city.id, title: post_params[:title], content: post_params[:content])
      if @post.id
        redirect_to post_path(@post)
      else
        flash[:error] = "Title must be between 1 to 200 characters and post must not be empty."
        redirect_to city_path(@city)
      end
    else
      redirect_to cities_path
    end
  end

  def edit
    @post = Post.find_by_id(params[:post_id])
    if current_user.id != @post.user_id
      redirect_to post_path(@post)
    end
  end

  def update
    @post = Post.find_by_id(params[:post_id])
    @post.update_attributes(post_params)
    if !@post.valid?
      flash[:error] = "Title must be between 1 to 200 characters and post must not be empty."
    end
    redirect_to post_path(@post)
  end

  def destroy
    post = Post.find_by_id(params[:post_id])
    post.destroy
    redirect_to user_path(current_user)
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

end
