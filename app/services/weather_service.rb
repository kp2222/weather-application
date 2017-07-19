
class WeatherService
  include HTTParty

  base_uri 'api.openweathermap.org'

  def search (city, country)
    response = get(query(q: [city,country].join(",")))
    if response.success?
      Weather.new(JSON.parse(response.body))
    else
      raise "open api request failed"
    end
  end


  private

  def get(params)
    self.class.get("/data/2.5/weather", params)
  end

  def query(params)
    query = {query: {appid: Rails.configuration.open_weather.api_key}}
    query[:query].merge!(params)
    query
  end
end
