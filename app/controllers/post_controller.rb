class PostController < ApplicationController

  def show
    @post = Post.find_by_id(params[:post_id])
  end

end
