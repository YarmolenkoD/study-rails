Rails.application.routes.draw do
  get 'friends/index'
  get 'friends/destroy'
  resources :friend_requests
  devise_for :users
  root to: "home#index"

  get "user/:id", to: "users#show"
  get "users/:id", to: "users#search", as: "search"
end
