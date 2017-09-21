class SessionController < ApplicationController

  def new
    @user = User.new
  end

  def create
    #we need to add either an email or username and password_digest to the user schema. Also make sure to change the user model to match schema when update is made.
    user_params = params.require(:user).permit(:email, :password)
    @user = user.confirm(user_params)
    if @user
      login(@user)
      redirect_to @user
    else
      #redirects may need to change based on page layouts
      redirect_to login_path
    end
  end

  def destroy
    logout
    redirect_to root_path
  end

end
