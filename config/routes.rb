Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  
  get 'search', to: 'posts#search'
  resources :users, only: [:index, :show, :new, :create] do
    member do
      get :followings
      get :followers
      get 'likes', to: 'users#likes'
    end
  end
  
  resources :posts, only: [:new, :create, :show] do
    member do
      post :evaluation
      get 'likes', to: 'posts#likes'
    end 
  end
  
  resources :relationships, only: [:create, :destroy]
  resources :favorites, only: [:create, :destroy]
end
