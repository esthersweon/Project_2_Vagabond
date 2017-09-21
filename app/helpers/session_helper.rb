module SessionHelper

  def login(user)
    #not possitive if this should be called on :id or :user_id. It's :user_id in the library app but not sure why. Will look into.
    session[:id] = user.id
    @current_user = user
  end

  def current_user
    @current_user ||= User.find_by_id(session[:id])
  end

  def logout
    @current_user = session[:id] = nil
  end

end
