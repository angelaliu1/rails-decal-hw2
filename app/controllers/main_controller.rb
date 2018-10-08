require_relative "../services/weather_service"

class MainController < ApplicationController

  def index
    # Uncomment and pass a parameter to the get function
    if params[:city]
      city = City.new(
	       name: params[:city],
      )
      city.save
      #@temperature = ((9 / 5) * (city.[:temperature] - 273) + 32).ceil
    end
  end

end
