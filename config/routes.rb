Rails.application.routes.draw do

  get 'users/edit'

  get 'users/index'

  get 'users/new'

  get 'users/show'

  get 'sessions/new'

  get "welcome/index"
  root "welcome#index", as: 'welcome'

  get "/about", to: "static_pages#about", as: 'about'
  get "/contact", to: "static_pages#contact", as: 'contact'
  get "/help", to: "static_pages#help", as: 'help'

  match '/login',  to: 'sessions#new',          via: 'get'
end