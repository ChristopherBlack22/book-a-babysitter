Rails.application.routes.draw do

  #get "login"

  resources :appointments
  resources :babysitters
  resources :children
  resources :parents
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
