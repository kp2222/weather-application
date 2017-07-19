require_relative '../rails_helper'
require_relative '../open_weather_sample_response'

describe WeatherService do

  before do
    @service = WeatherService.new

    stub_request(:get, /openweathermap/).
      to_return(body: weather_api_sample_response)
  end


  it "should search for weather by City, Country" do
    @weather = @service.search("bangalore", "IN")

    expect(@weather.current_weather).to eql 'Drizzle'
  end

  it "should raise an error if the City in the response does not match the original parameter" do
    expect {

      @weather = @service.search("bangl", "IN")
      
    }.to raise_error(/Invalid city or country/)
  end

  it "raises error when http request fails" do
    stub_request(:get, /openweathermap/).
      to_return(status: [500, "Internal Server Error"])

    expect {
      @service.search("bangalore", "IN")
    }.to raise_error(/failed/)
  end
  
end
