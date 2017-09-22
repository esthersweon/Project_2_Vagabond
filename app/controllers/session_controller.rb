class SessionController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user_params = params.require(:user).permit(:email, :password)
    @user = User.confirm(user_params)
    if @user
      login(@user)
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
