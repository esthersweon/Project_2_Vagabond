class UserController < ApplicationController

  def new
    @user = User.new
  end

  # create user acc after user submit their info to form
  def create
    @user = User.create(user_params)
    if @user.save
      redirect_to @user
    else
      redirect_to new_user_path
    end
  end

  # show page for showing individual profile with given id
  def show
    @user = User.find(params[:user_id])
  end

  private
  def user_params
    p = params.require(:user).permit(:first_name, :last_name, :password)
  end

end
