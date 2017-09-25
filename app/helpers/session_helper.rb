module SessionHelper

  def login(user)
    # not positive if this should be called on :id or :user_id. It's :user_id in the library app but not sure why. Will look into.
    # Either is fine – it's a `potato` word.
    # Just make sure you reference it by `potato` everywhere.
    # As far as :id vs :user_id, I prefer :user_id because it's a variable for the entire session, and it is more explicit.
    session[:user_id] = user.id
    @current_user = user
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def logout
    @current_user = session[:user_id] = nil
    flash[:notice] = "You have successfully logged out."
    redirect_to cities_path
  end

  def has_login
    if current_user.nil?
      redirect_to cities_path
    end
  end
end
