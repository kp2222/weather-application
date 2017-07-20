require_relative "../rails_helper"
require_relative "../open_weather_sample_response"

describe WeatherController do

  describe "search" do

    it "should assign a weather object if the search is succesfull" do
      stub_request(:get, /openweathermap/).
        to_return(body: weather_api_sample_response)

      get :search, params: {city: "bangalore", country: "IN"}

      expect(assigns(:weather).location).to eql "Bangalore,IN"
    end

    it "should set a flash message when the location is invalid" do
      stub_request(:get, /openweathermap/).
        to_return(body: weather_api_sample_response)

      get :search, params: {city: "city", country: "IN"}

      expect(flash[:error]).to match(/Invalid city or country/)
    end

    it "should set a flash message when API call fails" do
      stub_request(:get, /openweathermap/).
        to_return(status: [500, "Internal Server Error"])

      get :search, params: {city: "city", country: "IN"}

      expect(flash[:error]).to match(/failed/)
    end
  end
  
end
