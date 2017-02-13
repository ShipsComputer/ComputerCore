Rails.application.routes.draw do
  resources :weather_readings
  resources :coordinates
  resources :sensor_arrays
  resources :crafts
  resources :query

  root "pages#show", page: "home"
  get "/pages/:page" => "pages#show"
end
