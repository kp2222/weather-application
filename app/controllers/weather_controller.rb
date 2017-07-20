class WeatherController < ApplicationController

  rescue_from RuntimeError, with: :notify_error

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

  def search
    @weather = WeatherService.new.search(params[:city], params[:country])
    render :show
  end

  private

  def notify_error(exception)
    flash[:error] = exception.message
  end
end
