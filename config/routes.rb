Rails.application.routes.draw do
  devise_for :users
  # Defines the root path route ("/")
  # As a visitor I can visit the home page
  root to: "pages#home"
  resources :flats

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # As a visitor I can browse through flats
  resources :flats, only: %i[index show] do
    # As a user I can create a rating of a flat
    resources :bookings, only: %i[new create]
    resources :ratings, only: :create
  end
end
