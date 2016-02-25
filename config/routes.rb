Rails.application.routes.draw do
  get 'welcome/index'
  root 'welcome#index', as: 'welcome'
end