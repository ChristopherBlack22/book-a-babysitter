Rails.application.routes.draw do

  root "static#home"

  get "/home", to: "static#home"

  get "signup", to: "parents#new"
  post "signup", to: "parents#create"
  
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  get "/auth/:provider/callback", to: "sessions#omniauth"

  get "babysitters/stats", to: "babysitters#stats"

  resources :babysitters, only: [:new, :create]
  resources :bookings
  resources :children, except: [:edit, :update] do
    resources :bookings
  end
  resources :parents, only: [:new, :create] do 
    resources :children, only: [:index, :new, :create]
  end 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
