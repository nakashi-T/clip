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
    end
  end
  
  resources :posts, only: [:new, :create, :show] do
    member do
      post :evaluation
    end 
  end
  
  resources :relationships, only: [:create, :destroy]
end
