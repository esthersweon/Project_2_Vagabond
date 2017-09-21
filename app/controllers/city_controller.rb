class CityController < ApplicationController
  # list all of the cities
  def index
    @cities = City.all
  end

  # show specific city and user/posts associate with it
  def show

  end
end
