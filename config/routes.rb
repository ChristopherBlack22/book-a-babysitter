Rails.application.routes.draw do

  root "static#home"
  get "signup", to: "parents#new"
  post "signup", to: "parents#create"

  resources :appointments
  resources :babysitters
  resources :children
  resources :parents
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
