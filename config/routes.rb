Rails.application.routes.draw do
  root "users#welcome"
   post "/rides", to: "rides#create"
   resources :users
   resources :attractions, except: [:destroy]
   #resources :rides, only: [:create]

   get "/signin", to: "users#signin"
   post "/signin", to: "users#login"
   get "/logout", to: "users#logout", as: "logout"
end
