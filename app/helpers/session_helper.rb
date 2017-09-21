module SessionHelper


  def login(user)
    #not possitive if this should be called on :id or :user_id. It's :user_id in the library app but not sure why. Will look into.
    session[:user_id] = user.id
    @current_user = user
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def logout
    @current_user = session[:user_id] = nil
  end

  def has_login
    if current_user == nil
      redirect_to cities_path
    end

  end

end
