require_relative "../rails_helper"
require_relative "../open_weather_sample_response"

describe Weather do

  before do
    @weather = Weather.new(JSON.parse(weather_api_sample_response))
  end

  it "should have a location" do
    expect(@weather.location).to eql "Bangalore,IN"
  end

  it "should have a main description" do
    expect(@weather.current_weather).to eql "Drizzle"
  end

  it "should have temparature max" do
    expect(@weather.temparature_max).to eql 295.15
  end

  it "should have temparature min" do
    expect(@weather.temparature_min).to eql 295.15
  end

  it "should have humidity" do
    expect(@weather.humidity).to eql 94
  end
  
end
