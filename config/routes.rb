Rails.application.routes.draw do
  
  #get 'sessions/new' #削除
  root to: 'static_pages#home'
  get 'signup',  to: 'users#new'
  get    'login'   => 'sessions#new' #追加
  post   'login'   => 'sessions#create' #追加
  delete 'logout'  => 'sessions#destroy' #追加
  
  resources :users do member do
    get :following 
    get :follower
    end
  end

    
  resources :users
  resources :sessions, only: [:new, :create, :destroy] #追加
  resources :microposts #追加
  resources :relationships, only: [:create, :destroy] #追加
  

end