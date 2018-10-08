class CitiesController < ApplicationController
  def view
    # if city param given
    if params[:city] != nil
      @name = params[:city]
      @w = WeatherService.get(@name)
      city = City.new({
        name: params[:city],
        landmark: params[:landmark],
        population: params[:population]
      })
      city.weather[:temperature] = ((9 / 5) * (@w[:temperature] - 273) + 32).round
      city.save
    end
    # elif no cities
    # else, view all cities in hash/model
  end

  def new_form
  end

  def create
    @name = params[:city]
    if @name != "" and @name != nil and not City.all.key?(@name.to_sym)
      @w = WeatherService.get(@name)
      city = City.new({
        name: params[:city],
        landmark: params[:landmark],
        population: params[:population]
      })
      city.weather[:temperature] = ((9 / 5) * (@w[:temperature] - 273) + 32).round
      city.save
    end
    redirect_to "/cities/view"
  end

  def update_form
  end

  def update
    @name = params[:city]
    if @name != "" and @name != nil and City.all.key?(@name.to_sym)
      City.all[@name.to_sym].update({
        city: params[:city],
        landmark: params[:landmark],
        population: params[:population]
      })
      City.all[@name.to_sym].save
    end
    redirect_to "/cities/view"
  end
end
