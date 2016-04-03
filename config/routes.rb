Rails.application.routes.draw do

<<<<<<< HEAD
  resources :events
  resources :posts
  devise_for :users
  resources :users
  get "/users/:id(.:format)", to: "users#show", as: "feed"

	authenticated :user do
    	root to: 'home#index', as: 'home'
  	end
 	unauthenticated :user do
    	root 'welcome#index', as: 'welcome'
  	end

  	get "/about", to: "static_pages#about", as: 'about'
  	get "/contact", to: "static_pages#contact", as: 'contact'
  	get "/help", to: "static_pages#help", as: 'help'
  	
end