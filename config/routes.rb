Rails.application.routes.draw do

  post 'users/downgrade_user'
  resources :charges, only: [:new, :create]
  resources :wikis do
    resources :collaborators, only: [:create, :destroy]
    collection do
      get 'private_wikis', to: "wikis#private_wikis", as: "private_wikis"
    end
  end
  devise_for :users
  get 'wikis/index'
  get 'welcome/index'
  root 'welcome#index'
end
