# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users, only: %i[show update destroy]

  mount_devise_token_auth_for 'User', at: 'auth'
  mount_devise_token_auth_for 'Admin', at: 'admin_auth'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :campaign do
    resources :comments, except: [:show]
    resources :charges, only: [:create]
  end
  get '/charges/new', to: 'charges#new'
end
