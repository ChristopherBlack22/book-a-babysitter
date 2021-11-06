Rails.application.routes.draw do

  root "static#home"

  get "/home", to: "static#home"

  get "signup", to: "parents#new"
  post "signup", to: "parents#create"
  
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  #match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  get "/auth/:provider/callback", to: "sessions#omniauth"

  get "babysitters/stats", to: "babysitters#stats"

  resources :babysitters
  resources :bookings
  resources :children do
    resources :bookings
  end
  resources :parents do 
    resources :bookings, only: [:index, :show, :new]
    resources :children, only: [:index, :show, :new]
  end 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
