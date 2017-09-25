class UserController < ApplicationController
  def create
    if User.find_by_email(user_params[:email])
      flash[:error] = "User already exists, use a different email."
      redirect_to cities_path
    else
      @user = User.new(user_params) # User.create essentially calls both `@user = User.new` and `@user.save`
      if @user.save
        login(@user)
        flash[:notice] = "Welcome "+  @user.first_name + "!"
        redirect_to user_path(@user)
      else
        flash[:error] = "Invalid info"
        redirect_to new_user_path
      end
    end
  end

  def update
    @user = User.find_by_id(session[:user_id])
    @user.update_attributes(user_params)
    if !@user.valid?
      hash_msg = @user.errors.messages
      flash[:error] = "Sorry, " + hash_msg.to_s.gsub(/=>/,' ').gsub(/'/,'no').gsub!(/[^0-9A-Za-z. ,]/, ' ')
    end
    redirect_to user_path(@user) 
    # This ^ should be in an else block – we do NOT want to redirect to user_path 
    # if update failed. we want to stay on edit page
  end

  def show
    @user = User.find(session[:user_id])
    # Wouldn't @user = current_user work as well?
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :current_city, :password, :image)
  end

end
