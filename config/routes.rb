Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "hello#index"
  namespace :api do
    resources :posts, only: [:index, :show] do
      resources :comments, only: [:create]
    end
    resources :private_api_keys, only: [:update]
  end
  resources :users, only: [:index,:show] do
    resources :posts, only: [:index, :new, :create, :show, :destroy] do
      resources :comments, only: [:new, :create, :destroy]
      resources :likes, only: [:create]
    end
  end
end
