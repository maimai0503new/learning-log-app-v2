Rails.application.routes.draw do
  get "comments/create"
  devise_for :users
  resources :posts do
    resources :likes, only: [:create, :destroy]
    resources :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
  
  root "home#index"
end
