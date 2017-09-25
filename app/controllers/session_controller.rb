class SessionController < ApplicationController

  def new
    @user = User.new
  end

  def create
    # user_params should be its own private method
    user_params = params.require(:user).permit(:email, :password)
    @user = User.confirm(user_params) # This is not good – @user is being set to true/false on this line, not User obj
    
    if @user
      login(@user)
      flash[:notice] = "Hello "+  @user.first_name + "!"
      redirect_to @user
    else
      flash[:error] = "Invalid Credential"
      redirect_to cities_path
    end
  end

  def destroy
    logout
    redirect_to root_path
  end
end
