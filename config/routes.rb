Rails.application.routes.draw do
  resources :environmental_readings
  resources :environmental_reading_types
  resources :weather_readings
  resources :coordinates
  resources :sensor_arrays
  resources :crafts
  resources :query

  root "pages#show", page: "home"
  get "/pages/:page" => "pages#show"

  namespace :api do
    namespace :v1, defaults: { format: :json } do
      resources :coordinates, :only => [:new, :create]
      resources :environmental_readings, :only => [:new, :create]
    end
  end
end
