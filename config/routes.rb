Rails.application.routes.draw do
  resources :charges, only: [:new, :create]
  resources :wikis
  devise_for :users
  get 'wikis/index'
  get 'welcome/index'
  root 'welcome#index'
end
