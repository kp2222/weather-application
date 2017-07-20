
class WeatherService
  include HTTParty

  base_uri 'api.openweathermap.org'

  def search (city, country)
    response = get(query(q: [city,country].join(",")))
    raise "open api request failed" unless response.success?
    body = JSON.parse(response.body)
    if same_city?(body,city)
      Weather.new(body)
    else
      raise "Invalid city or country. Did you mean? #{body["name"]},#{body["sys"]["country"]}"
    end
  end


  private

  def same_city?(response,city)
    response["name"].downcase == city.downcase 
  end

  def get(params)
    self.class.get("/data/2.5/weather", params)
  end

  def query(params)
    query = {query: {appid: Rails.configuration.open_weather.api_key}}
    query[:query].merge!(params)
    query
  end
end
