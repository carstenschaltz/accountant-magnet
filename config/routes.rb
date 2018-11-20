Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :accountants, only: :index
  resources :enquiries, only: [:new, :create, :show, :destroy, :update]
end
