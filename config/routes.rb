Rails.application.routes.draw do

  devise_for :users
  resources :posts
  resources :users
  get "/users/:id(.:format)", to: "users#show", as: "feed"

  get "welcome/index"
  root "welcome#index", as: 'welcome'

  get "/about", to: "static_pages#about", as: 'about'
  get "/contact", to: "static_pages#contact", as: 'contact'
  get "/help", to: "static_pages#help", as: 'help'
end