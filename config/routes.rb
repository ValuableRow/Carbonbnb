Rails.application.routes.draw do
  devise_for :users
  # Defines the root path route ("/")
  # As a visitor I can visit the home page
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # As a visitor I can browse through flats
  resources :flats, only: [:index, :show]
end
