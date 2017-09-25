class CitiesController < ApplicationController
  # clean all comments before submission
  def index
    @cities = City.all
  end

  def show
    @city = City.find(params[:city_id])
    @at_city_page = true
  end
end
