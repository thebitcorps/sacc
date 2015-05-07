Rails.application.routes.draw do

  devise_for :users
  resources :users

  resources :clients

  get 'pages/index'

  get 'pages/help'

  get 'pages/about'

  root 'pages#index'
end
