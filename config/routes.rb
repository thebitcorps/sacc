# require 'sidekiq/web'
Rails.application.routes.draw do

  namespace :admin do 
    resources :users
    resources :clients
  end

  resources :dossiers
  resources :location_information
  resources :nominal_work_record
  resources :spouse_work_record
  match "dossier" => "dossiers#documentize", as: :documentize_client, via: :post

  resources :interactions
  resources :messages
  resources :appointments do
    get 'client', on: :collection
  end
  devise_for :users
  resources :users, only: [:edit, :update]
  resources :clients

  get 'pages/dashboard'
  get 'pages/help'
  get 'pages/about'

  root to: 'pages#dashboard'

  # mount Sidekiq::Web, at: '/sidekiq'
end
