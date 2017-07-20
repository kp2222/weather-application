class WeatherController < ApplicationController

  rescue_from RuntimeError, with: :notify_error

  def show
    @weather = session[:weather] if session[:weather]
  end

  def search
    @weather = WeatherService.new.search(params[:city], params[:country])
    session[:weather] = @weather if @weather
    render :show
  end

  private

  def notify_error(exception)
    logger.debug "exception raised: #{exception.message}"
    flash[:error] = exception.message
    render :show
  end
end
