class OpenHousesController < ApplicationController
  def open_houses
    res = OpenHouse.find_by_city(city: params[:city], state: params[:state])
    render json: res
  end
end
