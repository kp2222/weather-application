
class WeatherService
  include HTTParty

  base_uri 'api.openweathermap.org'

  def _search(city, country)
    response = get(query(q: [city,country].join(",")))
    body = JSON.parse(response.body)
    if same_city?(body,city)
      Weather.new(body)
    else
      raise "Invalid city or country. Did you mean? #{body["name"]},#{body["sys"]["country"]}"
    end
  end

  def search(city, country)
    Rails.cache.fetch("#{city},#{country}/weather", expires_in: 10.minutes) do
      _search(city,country)
    end
  end


  private

  def same_city?(response,city)
    response["name"].downcase == city.downcase 
  end

  def get(params)
    response = self.class.get("/data/2.5/weather", params)
    raise "open api request failed" unless response.success?
    response
  end

  def query(params)
    query = {query: {appid: Rails.configuration.open_weather.api_key}}
    query[:query].merge!(params)
    query
  end
end
