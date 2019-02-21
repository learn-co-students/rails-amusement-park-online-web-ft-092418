Rails.application.routes.draw do
  root 'application#welcome'
  resources :users
  resources :attractions

  post '/attractions/ride', to: 'attractions#ride'

  get '/signin', to: 'users#signin', as: :signin
  post '/login', to: 'users#login', as: :login
  get '/logout', to: 'users#logout', as: :logout
end
