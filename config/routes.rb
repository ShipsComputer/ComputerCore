Rails.application.routes.draw do
  resources :sensor_readings
  resources :sensor_types
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
      resources :sensor_readings, :only => [:new, :create]
    end
  end
end
