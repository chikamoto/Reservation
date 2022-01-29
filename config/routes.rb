Rails.application.routes.draw do

  get 'users/index'
  root 'pages#index'
  get 'pages/show'

  devise_for :users
  resources :rooms do
    resource :reservations
  end
  resources :users

  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
