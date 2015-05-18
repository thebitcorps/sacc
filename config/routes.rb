require 'sidekiq/web'
Rails.application.routes.draw do


  resources :interactions

  resources :messages

  resources :appointments
  devise_for :users
  resources :users

  resources :clients

  get 'pages/index'

  get 'pages/help'

  get 'pages/about'

  root to: 'pages#index'

  mount Sidekiq::Web, at: '/sidekiq'
end
