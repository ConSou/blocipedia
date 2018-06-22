Rails.application.routes.draw do

  resources :charges
  resources :wikis
  devise_for :users
  get 'wikis/index'
  get 'welcome/index'
  root 'welcome#index'
end
#, only: [:new, :create]
