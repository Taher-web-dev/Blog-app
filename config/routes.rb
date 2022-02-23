Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "users#index"
  #get '/users/:id/posts/:id/new', to: 'comments#new'
  #get user_post_path, to: 'comments#new'
  #post '/users/:id/posts/:id/', to: 'comments#create'
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :new, :create, :show] do
      resources :comments, only: [:new, :create]
      resources :likes, only: [:create]
    end
  end
  
end
