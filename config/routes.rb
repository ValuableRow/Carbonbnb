Rails.application.routes.draw do
  devise_for :users
  # Defines the root path route ("/")
  # As a visitor I can visit the home page
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # As a visitor I can browse through flats

  resources :flats, only: %i[index show new create] do
    resources :bookings, only: %i[new create]
  end
  # As a user I can create a rating of a flat
  resources :bookings, only: [] do
    resources :ratings, only: :create
  end

  resources :users, only: [:show] do
    resources :bookings, only: [:index, :show]
  end
  
end
