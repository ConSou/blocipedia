Rails.application.routes.draw do

  post 'users/downgrade_user'
  get '/wikis/private_wikis', to: "wikis#private_wikis", as: "private_wikis"
  resources :charges, only: [:new, :create]
  resources :wikis
  devise_for :users
  get 'wikis/index'
  get 'welcome/index'
  root 'welcome#index'
end
