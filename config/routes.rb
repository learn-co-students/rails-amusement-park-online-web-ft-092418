Rails.application.routes.draw do
    root 'application#welcome'

    post '/attractions/ride', to: 'attractions#ride'
    get '/signin', to: 'users#signin', as: :signin
    post '/signin', to: "users#login"
    post '/login', to: 'users#login', as: :login
    get '/logout', to: 'users#logout', as: :logout
    
    resources :users
    resources :attractions
end
