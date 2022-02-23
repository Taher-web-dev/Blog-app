Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "users#index"
  get '/users/:id/posts/:id/new', to: 'comments#new'
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :new, :create, :show]
  end
  
end
