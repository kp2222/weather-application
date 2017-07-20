class WeatherController < ApplicationController

  rescue_from RuntimeError, with: :notify_error

  def show
    @weather = WeatherService.new.search(session[:city], session[:country]) if session[:city]
  end

  def search
    @weather = WeatherService.new.search(params[:city], params[:country])
    if (@weather)
      session[:city] = params[:city]
      session[:country] = params[:country]
    end
    session[:city] if @weather
    render :show
  end

  private

  def notify_error(exception)
    logger.debug "exception raised: #{exception.message}"
    flash[:error] = exception.message
    render :show
  end
end
