class CitiesController < ApplicationController
  # list all of the cities
  def index
    # if @current_user == nil
    #   @current_user == nil
    # end
    @cities = City.all
  end

  # show specific city and user/posts associate with it
  def show
    @city = City.find(params[:city_id])
  end
end
