Rails.application.routes.draw do

  post 'charges/downgrade_user'
  resources :charges, only: [:new, :create]
  resources :wikis
  devise_for :users
  get 'wikis/index'
  get 'welcome/index'
  root 'welcome#index'
end
