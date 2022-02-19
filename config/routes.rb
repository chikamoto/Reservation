Rails.application.routes.draw do

  get 'reservations/index'
  get 'reservetions/index'
  get 'users/index'
  root 'pages#index'
  get 'pages/show'
  post 'reservations/confirm', to:'reservations#confirm'
  post 'reservation/confirm'
  post 'reservation/back'
  post 'reservations/create', to:'reservations#create'
  get "search" => "rooms#search"
  
  devise_for :users
  resources :users do
    resources :reservations
  end
  resources :rooms do
    resources :reservations

    get 'search', :on => :collection
  end
  resources :users
  resources :reservations

  

  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
