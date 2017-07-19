require_relative '../rails_helper'
require_relative '../open_weather_sample_response'

describe WeatherService do

  before do
    @service = WeatherService.new
    stub_request(:get, /openweathermap/).
      to_return(body: weather_api_sample_response)
  end


  it "should search for weather by City, Country" do

    @weather = @service.search("city", "country")

    @weather.current_weather.should == 'Drizzle'
  end
  
end
