Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  
  resources :users, only: [:index, :show, :new, :create] do
    member do
      get :followings
      get :followers
      get 'likes', to: 'users#likes'
    end
  end
  delete 'quit', to: 'users#destroy'
  
  
  resources :posts, only: [:new, :create, :show, :destroy] do
    member do
      post :evaluation
    end
    collection do
      get :search
    end
  end
  
  resources :relationships, only: [:create, :destroy]
  resources :favorites, only: [:create, :destroy]
end
