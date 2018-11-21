Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :users, only: [:show]
  resources :accountants, only: [:index, :show]
  resources :enquiries, only: [:new, :create, :show, :destroy, :update]
  resources :quotes, only: [:new, :create]
end

