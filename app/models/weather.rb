class Weather
  include ActiveModel::Model

  def initialize(data)
    @data = data
  end

  def country
    @data['country']
  end

  def location
    [@data["name"], @data["sys"]["country"]].join(",")
  end

  def current_weather
    @data['weather'].first['main']
  end

  def temparature_max
    @data['main']['temp']
  end

  def temparature_min
    @data['main']['temp_min']
  end

  def humidity
    @data['main']['humidity']
  end
  
  
end
