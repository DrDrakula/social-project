Rails.application.routes.draw do

  post '/login', to: "sessions#login"
  delete '/logout', to: "sessions#destroy"
  get 'users/:id', to: "users#show", as: "profile"

  resources :posts
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
