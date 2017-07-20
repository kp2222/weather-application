Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  match 'weather', to: 'weather#show', via: [:get]
  match 'weather/search', to: 'weather#search', via: [:get]
end
