Rails.application.routes.draw do

  root "combos#index"

  resources :users, only: [:new, :create, :index]

  resources :sessions, only: [:new, :create, :destroy]

  resources :combos

  resources :users do
    resources :combos, shallow: true do
        resources :comments
      end
    end

  resources :users do
    resources :comments
  end

  resources :combos do
    put :favorite, on: :member
  end

  get "favorites/" => "favorites#index"

  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'

end
