class UserController < ApplicationController

  # before_action :has_login, only: [:show, :update, :edit]

  # create user acc after user submit their info to form
  def create
    @user = User.create(user_params)
    if @user.save
      login(@user)
      redirect_to user_path(@user)
    else
      redirect_to new_user_path
    end
  end

  # Option to edit their user profile
  # def edit
  #   @user = User.find_by_id(params[:user_id])
  # end

  # Update attributes from form submit
  def update
    user = User.find_by_id(params[:user_id])
    user.update_attributes(user_params)
    redirect_to user_path(user)
  end

  # show page for showing individual profile with given id
  def show
    # find and display current user in session
    @user = User.find(session[:user_id])
  end

  private
  def user_params
    p = params.require(:user).permit(:first_name, :last_name, :email, :current_city, :password)
  end

end
