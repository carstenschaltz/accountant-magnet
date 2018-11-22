Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :users, only: [:show]
  resources :accountants, only: [:index, :show]
  resources :enquiries, only: [:new, :create, :show, :destroy, :update, :edit]
  resources :quotes, only: [:new, :create, :destroy] do
    get 'change_status'
  end
end

