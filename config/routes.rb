Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :goods do
    resources :likes, only: [:create, :destroy]
  end

  resources :comments, only: [:create]

  resources :users, only: [:show] 

  resources :relationships, only: [:create, :destroy]

  root 'goods#index'

  Rails.application.routes.draw do
    resources :goods
  end


end
