open_weather = Rails.application.config_for :open_weather

Rails.application.configure do
  config.open_weather = ActiveSupport::OrderedOptions.new
  config.open_weather.api_key = open_weather["api_key"]
end
