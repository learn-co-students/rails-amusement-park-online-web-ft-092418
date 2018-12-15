Rails.application.routes.draw do

  root to: 'welcome#home'
  resources :users
  resources :attractions
  resources :rides , only: [:new , :create]
  

  get '/signin' , to: 'sessions#sign_in' ,  as: "signin"
  post '/signin' , to: 'sessions#log_in'
  get '/signout' , to: 'sessions#sign_out' , as: "signout"

end
