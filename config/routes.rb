Rails.application.routes.draw do

  resources :meetings
  resources :posts
  resources :comments, only: [:create, :destroy]
  devise_for :users
  resources :users do
    member do
      get :friends
      get :followers
      get :deactivate
    end
  end
  resources :groups do
    get 'join', :on => :member
  end

  resources :users
  resources :events, except: [:edit, :update]

  authenticated :user do
      root to: 'home#index', as: 'home'
    end
  unauthenticated :user do
      root 'welcome#index', as: 'welcome'
    end

  resources :conversations do
    resources :messages
  end


  post "groups/:id/leave", to: "groups#leave", as: :leave
  
  get "/about", to: "static_pages#about", as: 'about'
  get "/contact", to: "static_pages#contact", as: 'contact'
  get "/help", to: "static_pages#help", as: 'help'
  post 'home/promote'
  get 'home/vote'

  match :follow, to: 'follows#create', as: :follow, via: :post
  match :unfollow, to: 'follows#destroy', as: :unfollow, via: :post
  match :like, to: 'likes#create', as: :like, via: :post
  match :unlike, to: 'likes#destroy', as: :unlike, via: :post
  match :find_friends, to: 'home#find_friends', as: :find_friends, via: :get

  match 'users/:id/approve'=> 'users#approve_user', as: 'approve_user', via: :get
end
