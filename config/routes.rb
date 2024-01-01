Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root 'goods#index'

  resources :users, only: [:index, :show, :edit, :update]
  resources :messages, only: [:create]
  resources :rooms, only: [:create, :show]

    
  resources :goods do
    resources :likes, only: [:create, :destroy]

    resources :comments, only: [:create, :destroy]


  end

end


Rails.application.routes.draw do
  resources :goods
end


