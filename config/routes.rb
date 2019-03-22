Rails.application.routes.draw do
  
  resources :sightings
  resources :animals
  
  root to: "animals#index"

end
