Rails.application.routes.draw do
  resources :vessel_coordinates
  resources :sensor_arrays
  resources :vessels
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
