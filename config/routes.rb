Rails.application.routes.draw do
  resources :reviews
  resources :houses
  resources :reservations
  resources :hosts
  resources :guests

  get '/login', to: "auth#login", as: "login"
  post '/login', to: "auth#verify_first_name"

  get '/logout', to: "auth#logout", as: "logout"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
