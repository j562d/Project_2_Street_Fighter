Rails.application.routes.draw do

  root "combos#index"

  resources :users, only: [:new, :create, :index]

  resources :sessions, only: [:new, :create, :destroy]

  resources :combos


  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'

end
