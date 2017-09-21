module SessionHelper
  def has_login
    if current_user == nil
      redirect_to cities_path
    end
  end

end
