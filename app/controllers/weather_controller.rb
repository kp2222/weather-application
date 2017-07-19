class WeatherController < ApplicationController

  def show
    @weather = Weather.new(location: 'kerala',
                           main: 'Drizzle',
                           main_description: 'light intensity drizzle',
                           icon: '09d',
                           current_temparature:  280,
                           temparature_max: 280,
                           temparature_min: 280,
                           humidity: 81)
  end
end
