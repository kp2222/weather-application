require_relative "../rails_helper"
require_relative "../open_weather_sample_response"

describe WeatherController do

  before do
    stub_request(:get, /openweathermap/).
      to_return(body: weather_api_sample_response)

  end
  
  describe "search" do

    it "should assign a weather object if the search is succesfull" do
      get :search, params: {city: "bangalore", country: "IN"}

      expect(assigns(:weather).location).to eql "Bangalore,IN"
    end

    it "should set a flash message when the location is invalid" do
      get :search, params: {city: "city", country: "IN"}

      expect(flash[:error]).to match(/Invalid city or country/)
    end

    it "should set a flash message when API call fails" do
      stub_request(:get, /openweathermap/).
        to_return(status: [500, "Internal Server Error"])

      get :search, params: {city: "city", country: "IN"}

      expect(flash[:error]).to match(/failed/)
    end

    it "should save the search params in session" do
      get :search, params: {city: "bangalore", country: "IN"}

      expect(session[:city]).to eql "bangalore"
    end
  end

  describe "show" do

    it "should render success" do
      get :show

      expect(response).to be_success
    end

    it "should use the weather from session if available" do
      get :search, params: {city: "bangalore", country: "IN"}
      get :show

      expect(assigns(:weather).location).to eql "Bangalore,IN"
    end
    
  end
  
end
