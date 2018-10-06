class CitiesController < ApplicationController
  def display
    @w = WeatherService.get(params[:city])
    if @w
      @temperature = ((9 / 5) * (@w[:temperature] - 273) + 32).ceil
      city = City.new(
	       name: params[:city],
	       description: @w[:description],
	       temperature: @temperature
      )
      city.save
  end

  def new_form
  end

  def create
  end

  def update_form
  end

  def update
  end
end
