class Weather
  include ActiveModel::Model
  attr_accessor :location, :main, :icon, :main_description, :current_temparature, :temparature_max, :temparature_min, :humidity

  
  
end
