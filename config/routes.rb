Rails.application.routes.draw do

  resources :interactions
  resources :appointments
  devise_for :users
  resources :users

  resources :clients

  get 'pages/index'

  get 'pages/help'

  get 'pages/about'

  root to: 'pages#index'
end
