# require 'sidekiq/web'
Rails.application.routes.draw do

  resources :dossiers do
    resources :legal_person_check_lists
    resources :natural_person_check_lists
    resources :empresarial_check_lists
    resources :wage_check_lists
    resources :general_spouse_check_lists
    resources :general_check_lists
  end

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

  # mount Sidekiq::Web, at: '/sidekiq'
end
