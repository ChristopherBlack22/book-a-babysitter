Rails.application.routes.draw do

  root "static#home"
  get "signup", to: "parents#new"
  post "signup", to: "parents#create"
  
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  resources :babysitters
  resources :bookings
  resources :children
  resources :parents do 
    resources :bookings, only: [:index, :show, :new]
    resources :children, only: [:index, :show, :new]
  end 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
