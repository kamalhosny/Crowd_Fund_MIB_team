Rails.application.routes.draw do
  resources :users, only: %i(show update destroy)

  mount_devise_token_auth_for 'User', at: 'auth'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :comments, except: %i(show)
end
