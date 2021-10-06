Rails.application.routes.draw do
  devise_for :property_owners
  root to: 'home#index'
  resources :properties, only: [:show, :new, :create] do
    get 'my_properties', on: :collection
  end
  resources :property_types, only: [:show, :new, :create]
  resources :property_locations, only: [:show, :new, :create]
end
