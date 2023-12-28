Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  resources :users, only: [:index, :show] 

    root 'goods#index'

    resources :messages, only: [:create]
    resources :rooms, only: [:create, :index, :show]


  resources :goods do
    resources :likes, only: [:create, :destroy]

    resources :comments, only: [:create, :destroy]

    resources :relationships, only: [:create, :destroy]

    resources :messages, only: [:create]
    resources :rooms, only: [:create, :show, :index]


  end

end


  Rails.application.routes.draw do
    resources :goods
  end


