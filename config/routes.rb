Rails.application.routes.draw do
  root to: 'home#index'
  resources :properties, only: [:show, :new, :create]
  resources :property_types, only: [:new, :create]
  resources :property_locations, only: [:new, :create]
end
