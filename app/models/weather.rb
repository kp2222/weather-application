class Weather
  include ActiveModel::Model

  def initialize(data)
    @data = data
  end

  def country
    @data['country']
  end

  def current_weather
    @data['weather'].first['main']
  end
  
  

  
  
end
