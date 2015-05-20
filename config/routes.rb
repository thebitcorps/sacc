require 'sidekiq/web'
Rails.application.routes.draw do

  resources :interactions
  resources :messages
  resources :appointments
  devise_for :users
  resources :users
  resources :clients

  get 'pages/dashboard'
  get 'pages/help'
  get 'pages/about'

  root to: 'pages#dashboard'

  mount Sidekiq::Web, at: '/sidekiq'
end
